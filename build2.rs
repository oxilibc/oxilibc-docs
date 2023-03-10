use std::path::{Path, PathBuf};

use walkdir::WalkDir;

static HEADER_MODS: &[&str] = &["string", "strings"];

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let target_dir = std::env::var("CARGO_TARGET_DIR").unwrap_or_else(|_| "target".to_string());

    let profile = std::env::var("PROFILE")?;

    // Generate headers from the Rust code using C bindgen
    for &header_mod_name in HEADER_MODS {
        let mod_path = PathBuf::from("src").join(header_mod_name);
        let mod_src = mod_path.with_extension("rs");
        let config_path = mod_path.join("cbindgen.toml");
        let header_path = PathBuf::from(&target_dir)
            .join("include")
            .join(&header_mod_name)
            .with_extension("h");

        println!("cargo:rerun-if-changed={mod_src:?}");
        println!("cargo:rerun-if-changed={config_path:?}");

        let config = cbindgen::Config::from_file(config_path)?;
        cbindgen::Builder::new()
            .with_config(config)
            .with_src(mod_src)
            .generate()?
            .write_to_file(header_path);
    }

    let out_dir = std::env::var("OUT_DIR")?;

    let raw_includes = WalkDir::new("include").into_iter().skip(1);

    // Copy the header files to the same place as the header generated by Rust code and create Rust
    // code from the headers using bindgen
    for raw_include in raw_includes {
        let raw_include = raw_include?;
        let path = raw_include.path();

        // Ignore directories
        if path.is_dir() {
            continue;
        }

        // Set the parent directory name if we are in depth 2
        let parent = if raw_include.depth() == 2 {
            path.parent().unwrap().file_name().unwrap()
        } else {
            Path::new("").as_os_str()
        };

        let copy_to_dir = PathBuf::from(&target_dir).join("include").join(parent);

        if !copy_to_dir.exists() {
            std::fs::create_dir_all(&copy_to_dir)?;
        }

        std::fs::copy(
            &path,
            copy_to_dir.join(path.file_name().expect("Unable to get file name")),
        )?;

        let binding = bindgen::Builder::default()
            .header(path.to_string_lossy())
            .derive_debug(true)
            .use_core()
            .ctypes_prefix("::cty")
            .layout_tests(false)
            .rustfmt_bindings(true)
            .clang_args(&["-nostdlib"])
            .generate()
            .expect("Unable to generete the bindings");

        let to = PathBuf::from(&out_dir)
            .join(path.file_stem().expect("Unable to get file stem"))
            .with_extension("rs");

        binding.write_to_file(to)?;
    }

    // Setup stuff for testing using inline-c
    let includes = PathBuf::from(&target_dir).join("include");
    let libc_objects_dir = PathBuf::from(&target_dir).join(&profile);
    println!(
        "cargo:rustc-env=INLINE_C_RS_CFLAGS=-nostdlib -fno-builtin -nostdinc -D_DEBUG -isystem {} \
         -L {}",
        includes.display(),
        libc_objects_dir.display()
    );

    Ok(())
}
