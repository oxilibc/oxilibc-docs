/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file string.h


#ifndef _OXILIBC_STRING_H
#define _OXILIBC_STRING_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

/// Copy bytes from `src` to `dest` until `c` byte is found, returning a pointer to the byte after
/// the position of `c` in `dest`, or until `len` bytes are copied, returning a NULL pointer.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
/// - `dest` must be valid for writes of `len` bytes.
/// - The region of memory beginning at `src` with a size of `len` bytes must *not* overlap with the
///   region of memory beginning at `dest` with the same size.
/// - `c` must be a valid `u8` value.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memccpy;
///
/// let src = [1u8, 2, 3, 4, 5];
/// let mut dest = [0u8; 5];
///
/// let ptr = unsafe { memccpy(dest.as_mut_ptr() as _, src.as_ptr() as _, 3, 5) };
/// assert_eq!(ptr, dest[3..].as_ptr() as _);
/// assert_eq!(dest, [1u8, 2, 3, 0, 0]);
/// ```
///
/// ```rust
/// use oxilibc::string::memccpy;
///
/// let src = [1u8, 2, 3, 4, 5];
/// let mut dest = [0u8; 5];
///
/// let ptr = unsafe { memccpy(dest.as_mut_ptr() as _, src.as_ptr() as _, 7, 5) };
/// assert!(ptr.is_null());
/// assert_eq!(dest, [1u8, 2, 3, 4, 5]);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char src[] = {1, 2, 3, 4, 5};
///     char* dest = {0,0,0,0,0};
///
///     void* ptr = memccpy(dest, src, 3, 5);
///     assert(memcmp(dest, src, 3));
///
///     return 0;
/// }
/// ```
///
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char src[] = {1, 2, 3, 4, 5};
///     char* dest = {0,0,0,0,0};
///
///     void* ptr = memccpy(dest, src, 7, 5);
///     assert(NULL == ptr);
///     assert(memcmp(dest, src, 5));
///
///     return 0;
/// }
/// ```
void *memccpy(void *dest, const void *src, int c, size_t len);

/// Search for the first occurrence of a `byte` in a `source` first `len` bytes, returning a pointer
/// to the found the `byte` or a null pointer it the `byte` was not found.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memchr;
///
/// let arr = [10, 12, 45, 78, 32];
///
/// let found_at_ptr = unsafe { memchr(arr.as_ptr() as _, 12, arr.len()) };
///
/// assert_eq!(found_at_ptr, arr[1..].as_ptr() as _);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char arr[] = {10, 12, 45, 78, 32};
///
///     char* ptr = memchr(arr, 12, 5);
///     assert(ptr == arr[1]);
///
///     return 0;
/// }
/// ```
void *memchr(const void *src, int byte, size_t len);

/// Compares the first `len` bytes of the objects pointed to by `source` and `other` and returning:
/// - Zero if both pointed objects are the same
/// - A positive number if `source` is greater than `other`
/// - A negative number if `source` is less than `other`
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
/// - `other` must be valid for reads of `len` bytes.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memcmp;
///
/// let source = b"Hello,";
/// let other = b"World";
///
/// let len = source.len().min(other.len());
/// let ord = unsafe { memcmp(source.as_ptr() as _, other.as_ptr() as _, len) };
///
/// assert!(ord < 0);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char source[] = "Hello,";
///     const char other[]  = "World";
///
///     int ord = memcmp(source, other, 5);
///     assert(ord < 0);
///
///     return 0;
/// }
/// ```
int memcmp(const void *src, const void *other, size_t len);

/// Copy the first `len` bytes from `src` to `dest`, returning `dest` itself.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
/// - `dest` must be valid for writes of `len` bytes.
/// - The region of memory beginning at `src` with a size of `len` bytes must *not* overlap with the
///   region of memory beginning at `dest` with the same size.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memcpy;
///
/// let src = [1u8, 2, 3, 4, 5];
/// let mut dest = [0u8; 5];
///
/// unsafe {
///     memcpy(dest.as_mut_ptr() as _, src.as_ptr() as _, 5);
/// }
/// assert_eq!(dest, [1u8, 2, 3, 4, 5]);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char src[] = {1, 2, 3, 4, 5};
///     char* dest = {0,0,0,0,0};
///
///     assert(memcmp(memcpy(dest, src, 5), src, 5));
///
///     return 0;
/// }
/// ```
void *memcpy(void *dest, const void *src, size_t len);

/// Search for the first occurrence of a `pattern` of `pattern_len` size in a `src` first `len`
/// bytes, returning a pointer to the first byte of the found `pattern` or a null pointer it the
/// `pattern` was not found.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `str_len` bytes.
/// - `pattern` must be valid for reads of `pattern_len` bytes.
///
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memmem;
///
/// let src = b"abcdefghijklmnopqrstuvwxyz";
/// let pat = b"jk";
///
/// let ptr = unsafe {
///     memmem(
///         src.as_ptr().cast(),
///         src.len(),
///         pat.as_ptr().cast(),
///         pat.len(),
///     )
/// };
///
/// assert_eq!(ptr, src[9..].as_ptr());
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "abcdefghijklmnopqrstuvwxyz";
///     const char* pat = "jk";
///
///     assert(memcmp(memmem(src, 26, pat, 2), "jk", 2))
///
///     return 0;
/// }
/// ```
void *memmem(const void *src, size_t str_len, const void *pattern, size_t pattern_len);

/// Copy the first `len` bytes from `src` to `dest`, returning `dest`.
///
/// Note that differently than `memcpy`, the slices of memory of `[src, src + len)` and
/// `[dest, dest + len)` can overlap.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
/// - `dest` must be valid for writes of `len` bytes.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memmove;
///
/// let mut src = [1u8, 2, 3, 4, 5];
/// let src2 = [125u8, 124, 122];
/// let p1 = src.as_mut_ptr();
/// let p2 = src2.as_ptr();
/// unsafe { memmove(p1.cast(), p2.cast(), src2.len() as _) };
/// assert_eq!(src, [125, 124, 122, 4, 5]);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     char* src = "abcde";
///     char* dest = "FGH";
///
///     assert(memcmp(memmove(dest, src, 3), "FGHde", 6));
///
///     return 0;
/// }
/// ```
void *memmove(void *dest, const void *src, size_t len);

/// Search for the last occurrence of a `byte` in a `source` first `len` bytes, returning a pointer
/// to the found the `byte` or a null pointer it the `byte` was not found.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memrchr;
///
/// let arr = [10, 12, 45, 12, 32];
///
/// let found_at_ptr = unsafe { memrchr(arr.as_ptr() as _, 12, arr.len()) };
///
/// assert_eq!(found_at_ptr, arr[3..].as_ptr() as _);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char arr[] = {10, 12, 45, 12, 32};
///
///     char* ptr = memrchr(arr, 12, 5);
///     assert(ptr == arr[3]);
///
///     return 0;
/// }
/// ```
void *memrchr(const void *src, int byte, size_t len);

/// Search for the last occurrence of a `pattern` of `pattern_len` size in a `src` first `len`
/// bytes, returning a pointer to the first byte of the found `pattern` or a null pointer it the
/// `pattern` was not found.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `str_len` bytes.
/// - `pattern` must be valid for reads of `pattern_len` bytes.
///
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memrmem;
///
/// let src = b"abcdefghijklmnopqrstuvjkyz";
/// let pat = b"jk";
///
/// let ptr = unsafe {
///     memrmem(
///         src.as_ptr().cast(),
///         src.len(),
///         pat.as_ptr().cast(),
///         pat.len(),
///     )
/// };
///
/// assert_eq!(ptr, src[22..].as_ptr());
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "abcdefghijklmnopqrstuvjkyz";
///     const char* pat = "jk";
///
///     assert(memcmp(memrmem(src, 26, pat, 2), "jk", 2))
///
///     return 0;
/// }
/// ```
void *memrmem(const void *src, size_t str_len, const void *pattern, size_t pattern_len);

/// Set the first `len` bytes of `src` to the value of `val`, returning the `src`.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
/// - `src` must be valid for writes of `len` bytes.
///
/// # Example
///
/// ## Rust
/// ```rust
/// use oxilibc::string::memset;
///
/// let mut src = [b'a', b'b', b'c', b'd', b'e', b'f'];
///
/// unsafe {
///     memset(src.as_mut_ptr() as _, b'g' as _, 3);
/// }
///
/// assert_eq!(&src, b"gggdef");
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     char* src = "abcdef";
///
///     assert(memcmp(memset(src, 'g', 3), "gggdef", 6));
///
///     return 0;
/// }
/// ```
void *memset(void *src, int val, size_t len);

/// Copies the characters from the `src` string to the `dest`, returning a pointer to the end of the
/// string, in other words, the first null character.
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be a null terminated string
/// - `dest` must be at least the size of `src` long
/// - `str` must be valid for reads until the first null character found.
/// - `dest` must be valid for writes until the `str` length.
/// - `src` and `dest` must not overlap
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxibot::string::stpcpy;
///
/// let src = b"Hello World!\0";
/// let dest = &mut [0u8; 13];
///
/// let ret = unsafe { stpcpy(dest.as_mut_ptr().cast(), src.as_ptr().cast()) };
/// assert_eq!(src, dest);
///
/// let expected_ret = unsafe { dest.as_mut_ptr().add(12).cast() };
/// assert_eq!(ret, expected_ret)
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "Hello world!";
///     char dest[13] = {0};
///
///     char* last = stpcpy(dest, src);
///
///     for (int i = 0; i < 14; i++) {
///         assert(src[i] == dest[i]);
///     }
///
///     assert(*last == 0);
///
///     return 0;
/// }
/// ```
char *stpcpy(char *dest, const char *src);

/// Copies the at least `max_size` characters from the `src` string to the `dest`, returning
/// a pointer to the end of the string, in other words, the first null character.
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be a null terminated string
/// - `dest` must be at least the size of `max_size` bytes long or the size of `src` if it is
///   smaller
/// - `str` must be valid for reads for `max_size` bytes or until the first null character found,
///   whatever is smaller.
/// - `dest` must be valid for writes for `max_size` bytes or until the `str` length, whatever is
///   smaller.
/// - `src` and `dest` must not overlap
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxibot::string::stpcpy;
///
/// let src = b"Hello World!\0";
/// let dest = &mut [0u8; 13];
/// let ret = unsafe { stpncpy(dest.as_mut_ptr().cast(), src.as_ptr().cast(), 5) };
/// assert_eq!(b"Hello\0\0\0\0\0\0\0\0", dest);
///
/// let expected_ret = unsafe { dest.as_mut_ptr().add(5).cast() };
/// assert_eq!(ret, expected_ret);
///
/// unsafe {
///     assert_eq!(*ret, 0);
/// };
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "Hello world!";
///     char dest[13] = {0};
///
///     char* last = stpncpy(dest, src, 5);
///
///     for (int i = 0; i < 5; i++) {
///         assert(src[i] == dest[i]);
///     }
///
///     assert(*last == 0);
///
///     return 0;
/// }
/// ```
char *stpncpy(char *dest, const char *src, size_t max_size);

/// Appends a copy of the `src` string to the `dest` string, returning a pointer to the beginning of
/// the `dest` string.
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` and `dest` must be a null terminated strings
/// - `str` must be valid for reads until the first null character found.
/// - `dest` must be valid for writes for `strlen(dest)+strlen(src)+1` bytes.
/// - `src` and `dest` must not overlap
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxibot::string::strcat;
/// let src = b"Hello World!\0";
/// let mut dest = *b"I'm part of a test\0\0\0\0\0\0\0\0\0\0\0\0\0";
///
/// let ret = unsafe { strcat(dest.as_mut_ptr().cast(), src.as_ptr().cast()) };
/// assert_eq!(b"I'm part of a testHello World!\0", &dest);
/// assert_eq!(ret, dest.as_mut_ptr().cast());
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "Hello world!";
///     char dest[31] = "I'm part of a test\0\0\0\0\0\0\0\0\0\0\0\0";
///
///     char* ret = strcat(dest, src);
///     let eq = strcmp(dest, "I'm part of a testHello world!");
///     assert(eq == 0);
///     assert(ret == dest);
///
///     return 0;
/// }
/// ```
char *strcat(char *dest, const char *src);

/// Search for the first occurrence of a `ch` in a `str`, returning a pointer to the found the `ch`
/// or a null pointer it the `ch` was not found.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be a null terminated string
/// - `str` must be valid for reads until the first null character found.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::strchr;
///
/// let str = b"Hello, World!\0";
///
/// let found_at_ptr = unsafe { strchr(str.as_ptr() as _, b'l' as _) };
///
/// assert_eq!(found_at_ptr, str[2..].as_ptr() as _);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char str[] = "Hello, World!";
///
///     char* ptr = memchr(str, 'l');
///     assert(ptr == str[3]);
///
///     return 0;
/// }
/// ```
char *strchr(const char *str, int ch);

/// Compares `str1` and `str2` null terminated strings lexicographically. Returning:
/// - Zero if both strings match
/// - A positive number if `str1` sorts lexicographically after `str2`
/// - A negative number if `str1` sorts lexicographically before `str2`
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str1` must be a null terminated string
/// - `str2` must be a null terminated string
/// - `str1` must be valid for reads until the first null character found.
/// - `str2` must be valid for reads until the first null character found.
///
/// # Examples
/// ## Rust
/// ```rust
/// use oxilibc::string::strcmp;
///
/// let s1 = b"Hello, World!\0";
/// let s2 = b"hello, world!\0";
///
/// let test = unsafe { strcmp(s1.as_ptr().cast(), s2.as_ptr().cast()) };
/// assert_eq!(test, -32);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* s1 = "Hello, World!";
///     const char* s2 = "hello, world!";
///
///     int cmp = strcmp(s1, s2);
///     assert(cmp == -32)
///
///     return 0;
/// }
/// ```
int strcmp(const char *str1, const char *str2);

/// Copies the `src` string, including the null terminator, to the `dest`, returning `dest` itself.
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be a null terminated string
/// - `dest` must be at least the size of `src` long
/// - `str` must be valid for reads until the first null character found.
/// - `dest` must be valid for writes until the `str` length.
/// - `src` and `dest` must not overlap
///
/// # Examples
/// ## Rust
/// ```rust
/// use oxibot::string::strcpy;
///
/// let src = b"Hello World!\0";
/// let dest = &mut [0u8; 13];
///
/// unsafe { strcpy(dest.as_mut_ptr().cast(), src.as_ptr().cast()) };
/// assert_eq!(src, dest);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "Hello world!";
///     char dest[13] = {0};
///
///     strcpy(dest, src);
///
///     for (int i = 0; i < 14; i++) {
///         assert(src[i] == dest[i]);
///     }
///
///     return 0;
/// }
/// ```
char *strcpy(char *dest, const char *src);

/// Returns the length of the maximum initial segment (span) of the byte string pointed to by `str`,
/// that consists of only the characters *not* found in the byte string pointed to by `char_set`.
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be a null terminated string
/// - `char_set` must be a null terminated string
/// - `str` must be valid for reads until the first null character found.
/// - `char_set` must be valid for reads until the first null character found.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxibot::string::strcspn;
///
/// let s = b"abcde312$#@\0";
/// let pat = b"*$#\0";
///
/// let test = unsafe { strcspn(s.as_ptr().cast(), pat.as_ptr().cast()) };
/// assert_eq!(test, 8);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* string = "abcde312$#@";
///     const char* invalid = "*$#";
///
///     size_t valid_len = strcspn(string, low_alpha);
///     assert(valid_len == 8);
///
///     return 0;
/// }
/// ```
size_t strcspn(const char *str, const char *char_set);

/// Returns the length of the given null terminated string `str`.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be a null terminated string
/// - `str` must be valid for reads until the first null character found.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::strlen;
///
/// let s = b"Hello, World!\0";
/// let len = unsafe { strlen(s.as_ptr().cast()) };
/// assert_eq!(len, 13);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* s = "Hello, World!";
///
///     assert(strlen(s) == 13);
///
///     return 0;
/// }
/// ```
size_t strlen(const char *str);

/// Appends a copy of the `src` string to the `dest` string for at least `max_size` characters,
/// returning a pointer to the beginning of the `dest` string.
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` and `dest` must be a null terminated strings
/// - `str` must be valid for reads for `max_size` characters or until the first null character
///   found, whatever is smaller.
/// - `dest` must be valid for writes for `max_size` characters or for `strlen(dest)+strlen(src)+1`
///   characters, whatever is smaller.
/// - `src` and `dest` must not overlap
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxibot::string::strcat;
/// let src = b"Hello World!\0";
/// let mut dest = *b"I'm part of a test\0\0\0\0\0\0";
///
/// let ret = unsafe { strncat(dest.as_mut_ptr().cast(), src.as_ptr().cast(), 5) };
/// assert_eq!(b"I'm part of a testHello\0", &dest);
/// assert_eq!(ret, dest.as_mut_ptr().cast());
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "Hello world!";
///     char dest[31] = "I'm part of a test\0\0\0\0\0";
///
///     char* ret = strncat(dest, src, 5);
///     let eq = strcmp(dest, "I'm part of a testHello");
///     assert(eq == 0);
///     assert(ret == dest);
///
///     return 0;
/// }
/// ```
char *strncat(char *dest, const char *src, size_t max_size);

/// Compares `str1` and `str2` for a maximum of `max_size` strings lexicographically. Returning:
/// - Zero if both strings match
/// - A positive number if `str1` sorts lexicographically after `str2`
/// - A negative number if `str1` sorts lexicographically before `str2`
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str1` must be valid for reads until `max_size` or the first null character found.
/// - `str2` must be valid for reads until `max_size` or the first null character found.
///
/// # Examples
/// ## Rust
/// ```rust
/// use oxilibc::string::strncmp;
///
/// let s1 = b"Hello, World!\0";
/// let s2 = b"hello, world!\0";
///
/// let test = unsafe { strncmp(s1.as_ptr().cast(), s2.as_ptr().cast(), 5) };
/// assert!(test < 0);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* s1 = "Hello, World!";
///     const char* s2 = "hello, world!";
///
///     int cmp = strncmp(s1, s2, 6);
///     assert(cmp < 0)
///
///     return 0;
/// }
/// ```
int strncmp(const char *str1, const char *str2, size_t max_size);

/// Copies the at least `max_size` characters from the `src` string to the `dest`, returning
/// `dest` itself.
///
/// If a null character is found on `src` before reaching the `max_size` character, additional null
/// characters are added up to the `max_size`
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads until `max_size` or the first null character found.
/// - `dest` must be valid for writes until `max_size`
/// - `src` and `dest` must not overlap
///
/// # Examples
/// ## Rust
/// ```rust
/// use oxibot::string::strncpy;
///
/// let src = b"Hello World!\0";
/// let dest = &mut [1u8; 14];
///
/// unsafe { strncpy(dest.as_mut_ptr().cast(), src.as_ptr().cast(), 14) };
/// assert_eq!(src, &dest[..13]);
/// assert_eq!(b"Hello World!\0\0", dest);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "Hello world!";
///     char dest[14] = {0};
///
///     strncpy(dest, src, 14);
///
///     for (int i = 0; i < 14; i++) {
///         assert(src[i] == dest[i]);
///     }
///     assert(dest[14] == 0);
///
///     return 0;
/// }
/// ```
char *strncpy(char *dest, const char *src, size_t max_size);

/// A safer version of [strlen]. This function returns:
/// - `max_size` if no null character was found up to that point
/// - The length of `str` if a null character was found before reaching the `max_size`
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be valid for reads until `max_size` or the first null character found.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use core::ptr;
/// use oxilibc::string::strnlen;
///
/// let s = b"Hello, World!\0";
/// let len = unsafe { strnlen(s.as_ptr().cast(), 14) };
/// assert_eq!(len, 13);
///
/// let len = unsafe { strnlen(s.as_ptr().cast(), 7) };
/// assert_eq!(len, 7);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* s = "Hello, World!";
///
///     assert(strnlen(s, 14) == 13);
///     assert(strnlen(s, 7) == 7);
///
///
///     return 0;
/// }
/// ```
size_t strnlen(const char *str, size_t max_size);

/// A safer version of [strlen]. This function returns:
/// - Zero if `str` is a null pointer
/// - `max_size` if no null character was found up to that point
/// - The length of `str` if a null character was found before reaching the `max_size`
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be valid for reads until `max_size` or the first null character found.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use core::ptr;
/// use oxilibc::string::strnlen_s;
///
/// let s = b"Hello, World!\0";
/// let len = unsafe { strnlen_s(s.as_ptr().cast(), 14) };
/// assert_eq!(len, 13);
///
/// let len = unsafe { strnlen_s(ptr::null(), 5) };
/// assert_eq!(len, 0);
///
/// let len = unsafe { strnlen_s(s.as_ptr().cast(), 7) };
/// assert_eq!(len, 7);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* s = "Hello, World!";
///
///     assert(strnlen_s(s, 14) == 13);
///     assert(strnlen_s(NULL, 5) == 0);
///     assert(strnlen_s(s, 7) == 7);
///
///
///     return 0;
/// }
/// ```
size_t strnlen_s(const char *str, size_t max_size);

/// Search for the last occurrence of a `ch` in a `str`, returning a pointer to the found the `ch`
/// or a null pointer it the `ch` was not found.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be a null terminated string
/// - `str` must be valid for reads until the first null character found.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxilibc::string::strrchr;
///
/// let str = b"Hello, World!\0";
///
/// let found_at_ptr = unsafe { strrchr(str.as_ptr() as _, b'l' as _) };
///
/// assert_eq!(found_at_ptr, str[10..].as_ptr() as _);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char str[] = "Hello, World!";
///
///     char* ptr = memchr(str, 'l');
///     assert(ptr == str[10]);
///
///     return 0;
/// }
/// ```
char *strrchr(const char *str, int ch);

/// Returns the length of the maximum initial segment (span) of the byte string pointed to by `str`,
/// that consists of only the characters found in the byte string pointed to by `char_set`.
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be a null terminated string
/// - `char_set` must be a null terminated string
/// - `str` must be valid for reads until the first null character found.
/// - `char_set` must be valid for reads until the first null character found.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxibot::string::strspn;
///
/// let s = b"abcde312$#@\0";
/// let pat = b"qwertyuiopasdfghjklzxcvbnm\0";
///
/// let test = unsafe { strspn(s.as_ptr().cast(), pat.as_ptr().cast()) };
/// assert_eq!(test, 5);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char *string = "abcde312$#@";
///     const char *low_alpha = "qwertyuiopasdfghjklzxcvbnm";
///
///     size_t spnsz = strspn(string, low_alpha);
///     assert(spnsz == 5);
///
///     return 0;
/// }
/// ```
size_t strspn(const char *str, const char *char_set);

/// Search for the first occurrence of a `pattern` in a `src`, returning a pointer
/// to the first character of the found the `pattern` or a null pointer it the `pattern` was not
/// found.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` and `pattern` must be null terminated strings
/// - `src` must be valid for reads until the first null character found.
/// - `pattern` must be valid for reads until the first null character found.
///
/// # Examples
///
/// ## Rust
/// ```rust
/// use oxibot::string::strstr;
///
/// let src = b"Hello World!\0";
/// let pat = b"World\0";
///
/// let res = unsafe { strstr(src.as_ptr().cast(), pat.as_ptr().cast()) };
/// assert_eq!(unsafe { src.as_ptr().cast::<i8>().add(6) }, res);
/// ```
///
/// ## C
/// ```c
/// #include <string.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* src = "Hello world!";
///     const char* pat = "world";
///
///     char* res = strstr(src, pat);
///
///     assert(src[6] == res);
///
///     return 0;
/// }
/// ```
char *strstr(const char *str, const char *pattern);

#ifdef __cplusplus
} // extern "C"
#endif // __cplusplus

#endif /* _OXILIBC_STRING_H */
