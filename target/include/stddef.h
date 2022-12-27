/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file stddef.h

#ifndef _OXILIBC_STDDEF_H
#define _OXILIBC_STDDEF_H

#if __cplusplus >= 201103L   // If we are on C++ 11 of newer
    /// The NULL pointer constant
    #define NULL nullptr
#elif defined(__cplusplus)   // Older C++
    // The NULL pointer constant
    #define NULL 0L
#else   // C
    // The NULL pointer constant
    #define NULL ((void *)0)
#endif   // __cplusplus >= 201103L

/// The signed integer type returned when subtracting two pointers.
typedef __PTRDIFF_TYPE__ ptrdiff_t;

/// The unsigned integer type returned by the `sizeof` operator.
typedef __SIZE_TYPE__ size_t;

#ifndef __cplusplus
/// The integer type whose range of values can represent distinct codes for all
/// members of the largest extended character set specified among the supported
/// locales.
/// The null character shall have the code value zero. Each member of the basic
/// character set shall have a code value equal to its value when used as the
/// lone character in an integer character constant if an implementation does
/// not define __STDC_MB_MIGHT_NEQ_WC__.
typedef __WCHAR_TYPE__ wchar_t;
#endif /* #ifndef __cplusplus */

/// The integer type able to represent any value of the type `wchar_t` that is a
/// member of the extended character set, as well as an additional value not
/// part of that set.
typedef __WINT_TYPE__ wint_t;

#if defined(_MSC_VER)
/// A type whose alignment requirement is at least as strict (as large) as
/// that of every scalar type.
typedef double max_align_t;
#elif defined(__APPLE__)
/// A type whose alignment requirement is at least as strict (as large) as
/// that of every scalar type.
typedef long double max_align_t;
#else
// Define 'max_align_t' to match the GCC definition.
/// A type whose alignment requirement is at least as strict (as large) as
/// that of every scalar type.
typedef struct {
    long long __ll;
    long double __ld;
} max_align_t;
#endif

/// Get the byte offset from the beginning of a struct `type` to specified
/// `member`
#define offsetof(type, member) __builtin_offsetof(type, member)

#endif /* _OXILIBC_STDDEF_H */