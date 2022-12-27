/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file strings.h


#ifndef _OXILIBC_STRINGS_H
#define _OXILIBC_STRINGS_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

/// This function is the same as [`memcmp`] function defined on the `string.h`. For all intents and
/// purposes, use [`memcmp`] instead.
///
/// # Safety
///
/// The user of this function must hold these invariants for the function to not cause Undefined
/// Behavior:
/// - `source` and `other` must be a valid pointer
/// - `len` value must be between zero and the the minimum size between `source` and `other`
int bcmp(const void *source, const void *other, size_t len);

/// This function is the same as [`memmove`] function defined on the `string.h`. For all intents and
/// purposes, use [`memmove`] instead.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
/// - `dest` must be valid for writes of `len` bytes.
void bcopy(const void *src, void *dest, size_t len);

/// This function is the same as [`memset`] function defined on the `string.h` with `val` equal to
/// zero. For all intents and purposes, use [`memset`] instead.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be valid for reads of `len` bytes.
/// - `str` must be valid for writes of `len` bytes.
void bzero(void *str, size_t len);

/// Finds the first bit set (beginning with the least significant bit) and returns the index of that
/// bit of the given `word`.
///
/// Bits are numbered starting at one (the least significant bit).
///
/// If `word` is zero, this function also returns zero
///
/// # Examples
///
/// ## Rust:
/// ```rust
/// use oxilibc::strings::ffs;
///
/// assert_eq!(ffs(0), 0);
/// assert_eq!(ffs(0b010011), 1);
/// assert_eq!(ffs(0b010010), 2);
/// assert_eq!(ffs(12), 3);
/// ```
///
/// ## C:
/// ```c
/// #include <strings.h>
/// #include <assert.h>
///
/// int main(void) {
///     int test = ffs(0);
///     assert(test == 0);
///
///     test = ffs(12);
///     assert(test == 3);
///
///     test = ffs(18);
///     assert(test == 2);
///
///     test = ffs(19);
///     assert(test == 1);
///
///     return 0;
/// }
/// ```
int ffs(int word);

/// Finds the first bit set (beginning with the least significant bit) and returns the index of that
/// bit of the given `word`.
///
/// Bits are numbered starting at one (the least significant bit).
///
/// If `word` is zero, this function also returns zero
///
/// # Examples
///
/// ## Rust:
/// ```rust
/// use oxilibc::strings::ffsl;
///
/// assert_eq!(ffsl(0), 0);
/// assert_eq!(ffsl(0b010011), 1);
/// assert_eq!(ffsl(0b010010), 2);
/// assert_eq!(ffsl(12), 3);
/// ```
///
/// ## C:
/// ```c
/// #include <strings.h>
/// #include <assert.h>
///
/// int main(void) {
///     int test = ffsl(0);
///     assert(test == 0);
///
///     test = ffsl(12);
///     assert(test == 3);
///
///     test = ffsl(18);
///     assert(test == 2);
///
///     test = ffsl(19);
///     assert(test == 1);
///
///     return 0;
/// }
/// ```
int ffsl(long word);

/// Finds the first bit set (beginning with the least significant bit) and returns the index of that
/// bit of the given `word`.
///
/// Bits are numbered starting at one (the least significant bit).
///
/// If `word` is zero, this function also returns zero
///
/// # Examples
///
/// ## Rust:
/// ```rust
/// use oxilibc::strings::ffs;
///
/// assert_eq!(ffsll(0), 0);
/// assert_eq!(ffsll(0b010011), 1);
/// assert_eq!(ffsll(0b010010), 2);
/// assert_eq!(ffsll(12), 3);
/// ```
///
/// ## C:
/// ```c
/// #include <strings.h>
/// #include <assert.h>
///
/// int main(void) {
///     int test = ffsll(0);
///     assert(test == 0);
///
///     test = ffsll(12);
///     assert(test == 3);
///
///     test = ffsll(18);
///     assert(test == 2);
///
///     test = ffsll(19);
///     assert(test == 1);
///
///     return 0;
/// }
/// ```
int ffsll(long long word);

/// This function is the same as [`strchr`] function defined on the `string.h` with `val` equal to
/// zero. For all intents and purposes, use [`strchr`] instead.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be a null terminated string
/// - `str` must be valid for reads until the first null character found.
char *index(const char *str, int ch);

/// This function is the same as [`strrchr`] function defined on the `string.h` with `val` equal to
/// zero. For all intents and purposes, use [`strrchr`] instead.
///
/// # Safety
///
/// Behavior is undefined if any of the following conditions are violated:
/// - `str` must be a null terminated string
/// - `str` must be valid for reads until the first null character found.
char *rindex(const char *str, int ch);

/// Compares the string at `str1` to the string at `str2` in a case-insensitive manner, returning:
/// - Zero if both strings match
/// - A positive number if `str1` sorts lexicographically after `str2`
/// - A negative number if `str1` sorts lexicographically before `str2`
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be null terminated and valid for reads until the null temination byte.
/// - `other` must be null terminated and valid for reads until the null temination byte.
///
/// # Examples
///
/// ## Rust:
/// ```rust
/// use oxilibc::strings::strcasecmp;
///
/// let (s1, s2, s3, s4) = (b"Foofoo\0", b"fooFoo\0", b"foobar\0", b"barFoo\0");
///
/// unsafe {
///     // the same case insensitive
///     assert_eq!(strcasecmp(s1.as_ptr().cast(), s2.as_ptr().cast()), 0);
///
///     assert!(strcasecmp(s1.as_ptr().cast(), s3.as_ptr().cast()) > 0);
///
///     assert!(strcasecmp(s1.as_ptr().cast(), s4.as_ptr().cast()) > 0);
///
///     assert!(strcasecmp(s4.as_ptr().cast(), s1.as_ptr().cast()) < 0);
/// }
/// ```
///
/// ## C:
/// ```c
/// #include <strings.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* s1 = "Foofoo";
///     const char* s2 = "fooFoo";
///     const char* s3 = "foobar";
///     const char* s4 = "barFoo";
///
///     assert(strcasecmp(s1, s2) == 0);
///     assert(strcasecmp(s1, s3) > 0);
///     assert(strcasecmp(s1, s4) > 0);
///     assert(strcasecmp(s4, s1) < 0);
///
///     return 0;
/// }
/// ```
int strcasecmp(const char *src, const char *other);

/// Compares the string at `str1` to the string at `str2` in a case-insensitive manner until the
/// `len` or one of the strings get to the end, returning:
/// - Zero if both strings match
/// - A positive number if `str1` sorts lexicographically after `str2`
/// - A negative number if `str1` sorts lexicographically before `str2`
///
/// # Safety
/// Behavior is undefined if any of the following conditions are violated:
/// - `src` must be valid for reads of `len` bytes.
/// - `src` must be null terminated and valid for reads until the null temination byte.
/// - `other` must be valid for reads of `len` bytes.
/// - `other` must be null terminated and valid for reads until the null temination byte.
///
/// # Examples
///
/// ## Rust:
/// ```rust
/// use oxilibc::strings::strncasecmp;
///
/// let (s1, s2, s3, s4) = (b"Foofoo\0", b"fooFoo\0", b"foobar\0", b"barFoo\0");
///
/// unsafe {
///     // the same case insensitive
///     assert_eq!(strncasecmp(s1.as_ptr().cast(), s2.as_ptr().cast(), 6), 0);
///     assert_eq!(strncasecmp(s1.as_ptr().cast(), s3.as_ptr().cast(), 3), 0);
///
///     assert!(strncasecmp(s1.as_ptr().cast(), s4.as_ptr().cast(), 6) > 0);
///     assert!(strncasecmp(s4.as_ptr().cast(), s1.as_ptr().cast(), 6) < 0);
/// }
/// ```
///
/// ## C:
/// ```c
/// #include <strings.h>
/// #include <assert.h>
///
/// int main(void) {
///     const char* s1 = "Foofoo";
///     const char* s2 = "fooFoo";
///     const char* s3 = "foobar";
///     const char* s4 = "barFoo";
///
///     assert(strncasecmp(s1, s2, 6) == 0);
///     assert(strncasecmp(s1, s3, 3) == 0);
///     assert(strncasecmp(s1, s4, 6) > 0);
///     assert(strncasecmp(s4, s1, 6) < 0);
///
///     return 0;
/// }
/// ```
int strncasecmp(const char *src, const char *other, size_t len);

#ifdef __cplusplus
} // extern "C"
#endif // __cplusplus

#endif /* _OXILIBC_STRINGS_H */
