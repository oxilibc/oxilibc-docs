/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file limits.h

#ifndef _OXILIBC_LIMITS_H
#define _OXILIBC_LIMITS_H

// System headers include a number of constants from POSIX in <limits.h>.
// Include it if we're hosted.
#if __STDC_HOSTED__ && __has_include_next(<limits.h>)
    #include_next <limits.h>

    // Many system headers define these. We don't need it
    #undef SCHAR_MIN
    #undef SCHAR_MAX
    #undef UCHAR_MAX
    #undef SHRT_MIN
    #undef SHRT_MAX
    #undef USHRT_MAX
    #undef INT_MIN
    #undef INT_MAX
    #undef UINT_MAX
    #undef LONG_MIN
    #undef LONG_MAX
    #undef ULONG_MAX
    #undef CHAR_BIT
    #undef CHAR_MIN
    #undef CHAR_MAX
    #undef LLONG_MIN
    #undef LLONG_MAX
    #undef ULLONG_MAX
#endif

/// The size of the `_Bool` type in bits.
#define BOOL_WIDTH 8

/// The largest value that can be represented by the `signed char` type.
#define SCHAR_MAX __SCHAR_MAX__
/// The smallest value that can be represented by the `signed char` type.
#define SCHAR_MIN (-__SCHAR_MAX__ - 1)

/// The largest value that can be represented by the `short` type.
#define SHRT_MAX __SHRT_MAX__
/// The smallest value that can be represented by the `short` type.
#define SHRT_MIN (-__SHRT_MAX__ - 1)

/// The largest value that can be represented by the `int` type.
#define INT_MAX __INT_MAX__
/// The smallest value that can be represented by the `int` type.
#define INT_MIN (-__INT_MAX__ - 1)

/// The largest value that can be represented by the `long` type.
#define LONG_MAX __LONG_MAX__
/// The smallest value that can be represented by the `long` type.
#define LONG_MIN (-__LONG_MAX__ - 1L)

/// The smallest value that can be represented by the `unsigned char` type.
#define UCHAR_MIN 0
/// The largest value that can be represented by the `unsigned char` type.
#define UCHAR_MAX (__SCHAR_MAX__ * 2 + 1)

/// The smallest value that can be represented by the `unsigned short` type.
#define USHRT_MIN 0
/// The largest value that can be represented by the `unsigned short` type.
#define USHRT_MAX (__SHRT_MAX__ * 2 + 1)

/// The smallest value that can be represented by the `unsigned int` type.
#define UINT_MIN 0
/// The largest value that can be represented by the `unsigned int` type.
#define UINT_MAX (__INT_MAX__ * 2U + 1U)

/// The smallest value that can be represented by the `unsigned long` type.
#define ULONG_MIN 0
/// The largest value that can be represented by the `unsigned long` type.
#define ULONG_MAX (__LONG_MAX__ * 2UL + 1UL)

/// Number of bits in a type `char`
#define CHAR_BIT __CHAR_BIT__
/// The size of the `char` type in bits.
#define CHAR_WIDTH 8

#if defined(__CHAR_UNSIGNED__) || '\xff' > 0 /* -funsigned-char */
    /// The smallest value that can be represented by the `char` type.
    #define CHAR_MIN 0
    /// The largest value that can be represented by the `char` type.
    #define CHAR_MAX UCHAR_MAX
#else
    /// The smallest value that can be represented by the `char` type.
    #define CHAR_MIN SCHAR_MIN
    /// The largest value that can be represented by the `char` type.
    #define CHAR_MAX SCHAR_MAX
#endif

#ifndef MB_LEN_MAX
    /// The maximum number of bytes in a multibyte character
    #define MB_LEN_MAX 1
#endif

// `long long` started to exist from C99 foward
// C++11 says that it needs to define the header as in C
#if __STDC_VERSION__ >= 199901L || __cplusplus >= 201103L
    /// The largest value that can be represented by the `long long` type.
    #define LLONG_MAX __LONG_LONG_MAX__
    /// The smallest value that can be represented by the `long long` type.
    #define LLONG_MIN (-__LONG_LONG_MAX__ - 1LL)

    /// The smallest value that can be represented by the `unsigned long long`
    /// type.
    #define ULLONG_MIN 0
    /// The largest value that can be represented by the `unsigned long long`
    /// type.
    #define ULLONG_MAX (__LONG_LONG_MAX__ * 2ULL + 1ULL)
#endif

#endif /* _OXILIBC_LIMITS_H */