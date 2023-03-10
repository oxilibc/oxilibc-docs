/* automatically generated by rust-bindgen 0.61.0 */

pub const INT8_MIN: i32 = -128;
pub const INT8_MAX: u32 = 127;
pub const INT8_WIDTH: u32 = 8;
pub const INT16_MIN: i32 = -32768;
pub const INT16_MAX: u32 = 32767;
pub const INT16_WIDTH: u32 = 16;
pub const INT32_MIN: i32 = -2147483648;
pub const INT32_MAX: u32 = 2147483647;
pub const INT32_WIDTH: u32 = 32;
pub const INT64_MIN: i64 = -9223372036854775808;
pub const INT64_MAX: u64 = 9223372036854775807;
pub const INT64_WIDTH: u32 = 64;
pub const UINT8_MIN: u32 = 0;
pub const UINT8_MAX: u32 = 255;
pub const UINT8_WIDTH: u32 = 8;
pub const UINT16_MIN: u32 = 0;
pub const UINT16_MAX: u32 = 65535;
pub const UINT16_WIDTH: u32 = 16;
pub const UINT32_MIN: u32 = 0;
pub const UINT32_MAX: u32 = 4294967295;
pub const UINT32_WIDTH: u32 = 32;
pub const UINT64_MIN: u32 = 0;
pub const UINT64_MAX: i32 = -1;
pub const UINT64_WIDTH: u32 = 64;
pub const INT_FAST8_MAX: u32 = 127;
pub const INT_FAST16_MAX: u32 = 32767;
pub const INT_FAST32_MAX: u32 = 2147483647;
pub const INT_FAST64_MAX: u64 = 9223372036854775807;
pub const INT_LEAST8_MAX: u32 = 127;
pub const INT_LEAST16_MAX: u32 = 32767;
pub const INT_LEAST32_MAX: u32 = 2147483647;
pub const INT_LEAST64_MAX: u64 = 9223372036854775807;
pub const UINT_FAST8_MAX: u32 = 255;
pub const UINT_FAST16_MAX: u32 = 65535;
pub const UINT_FAST32_MAX: u32 = 4294967295;
pub const UINT_FAST64_MAX: i32 = -1;
pub const UINT_LEAST8_MAX: u32 = 255;
pub const UINT_LEAST16_MAX: u32 = 65535;
pub const UINT_LEAST32_MAX: u32 = 4294967295;
pub const UINT_LEAST64_MAX: i32 = -1;
pub const INT_FAST8_MIN: i32 = -128;
pub const INT_FAST16_MIN: i32 = -32768;
pub const INT_FAST32_MIN: i32 = -2147483648;
pub const INT_FAST64_MIN: i64 = -9223372036854775808;
pub const INT_LEAST8_MIN: i32 = -128;
pub const INT_LEAST16_MIN: i32 = -32768;
pub const INT_LEAST32_MIN: i32 = -2147483648;
pub const INT_LEAST64_MIN: i64 = -9223372036854775808;
pub const UINT_FAST8_MIN: u32 = 0;
pub const UINT_FAST16_MIN: u32 = 0;
pub const UINT_FAST32_MIN: u32 = 0;
pub const UINT_FAST64_MIN: u32 = 0;
pub const UINT_LEAST8_MIN: u32 = 0;
pub const UINT_LEAST16_MIN: u32 = 0;
pub const UINT_LEAST32_MIN: u32 = 0;
pub const UINT_LEAST64_MIN: u32 = 0;
pub const INTMAX_MIN: i64 = -9223372036854775808;
pub const INTMAX_MAX: u64 = 9223372036854775807;
pub const UINTMAX_MIN: u32 = 0;
pub const UINTMAX_MAX: i32 = -1;
pub const UINTPTR_MIN: u32 = 0;
/// Smallest signed integer type with size of 8 bits
pub type int_least8_t = ::core::ffi::c_schar;
/// Smallest signed integer type with size of 16 bits
pub type int_least16_t = ::core::ffi::c_short;
/// Smallest signed integer type with size of 32 bits
pub type int_least32_t = ::core::ffi::c_int;
/// Smallest signed integer type with size of 64 bits
pub type int_least64_t = ::core::ffi::c_longlong;
/// Smallest unsigned integer type with size of at least 8 bits
pub type uint_least8_t = ::core::ffi::c_uchar;
/// Smallest unsigned integer type with size of at least 16 bits
pub type uint_least16_t = ::core::ffi::c_ushort;
/// Smallest unsigned integer type with size of at least 32 bits
pub type uint_least32_t = ::core::ffi::c_uint;
/// Smallest unsigned integer type with size of at least 64 bits
pub type uint_least64_t = ::core::ffi::c_ulonglong;
/// Fastest signed integer type with size of at least 8 bits
pub type int_fast8_t = ::core::ffi::c_schar;
/// Fastest unsigned integer type with size of at least 16 bits
pub type int_fast16_t = ::core::ffi::c_short;
/// Fastest unsigned integer type with size of at least 32 bits
pub type int_fast32_t = ::core::ffi::c_int;
/// Fastest unsigned integer type with size of at least 64 bits
pub type int_fast64_t = ::core::ffi::c_longlong;
/// Fastest unsigned integer type with size of at least 8 bits
pub type uint_fast8_t = ::core::ffi::c_uchar;
/// Fastest unsigned integer type with size of at least 16 bits
pub type uint_fast16_t = ::core::ffi::c_ushort;
/// Fastest unsigned integer type with size of at least 32 bits
pub type uint_fast32_t = ::core::ffi::c_uint;
/// Fastest unsigned integer type with size of at least 64 bits
pub type uint_fast64_t = ::core::ffi::c_ulonglong;
/// Maximum-size signed integer type on the platform
pub type intmax_t = ::core::ffi::c_long;
/// Maximum-size unsigned integer type on the platform
pub type uintmax_t = ::core::ffi::c_ulong;
