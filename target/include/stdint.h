/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file stdint.h

#ifndef _OXILIBC_STDINT_H
#define _OXILIBC_STDINT_H

// CONSTANTS
// TODO(C23): Add *_WIDTH values for fast and least variants

/// The smallest value that can be represented by the `int8_t` type,
/// &minus;2<sup>7</sup>.
#define INT8_MIN -128
/// The largest value that can be represented by the `int8_t` type,
/// 2<sup>7</sup> &minus; 1.
#define INT8_MAX 127
/// The size of the `int8_t` type in bits.
#define INT8_WIDTH 8

/// The smallest value that can be represented by the `int16_t` type,
/// &minus;2<sup>15</sup>.
#define INT16_MIN -32768
/// The largest value that can be represented by the `int16_t` type,
/// 2<sup>15</sup> &minus; 1.
#define INT16_MAX 32767
/// The size of the `int16_t` type in bits.
#define INT16_WIDTH 16

/// The smallest value that can be represented by the `int32_t` type,
/// &minus;2<sup>31</sup>.
#define INT32_MIN -2147483648
/// The largest value that can be represented by the `int32_t` type,
/// 2<sup>31</sup> &minus; 1.
#define INT32_MAX 2147483647
/// The size of the `int32_t` type in bits.
#define INT32_WIDTH 32

/// The smallest value that can be represented by the `int64_t` type,
/// &minus;2<sup>31</sup>.
#define INT64_MIN -9223372036854775808
/// The largest value that can be represented by the `int64_t` type,
/// 2<sup>31</sup> &minus; 1.
#define INT64_MAX 9223372036854775807
/// The size of the `int64_t` type in bits.
#define INT64_WIDTH 64

/// The smallest value that can be represented by the `uint8_t` type, zero.
#define UINT8_MIN 0
/// The largest value that can be represented by the `uint8_t` type,
/// 2<sup>8</sup> &minus; 1.
#define UINT8_MAX 255
/// The size of the `uint8_t` type in bits.
#define UINT8_WIDTH 8

/// The smallest value that can be represented by the `uint16_t` type, zero.
#define UINT16_MIN 0
/// The largest value that can be represented by the `uint16_t` type,
/// 2<sup>16</sup> &minus; 1.
#define UINT16_MAX 65535
/// The size of the `uint16_t` type in bits.
#define UINT16_WIDTH 16

/// The smallest value that can be represented by the `uint32_t` type, zero.
#define UINT32_MIN 0
/// The largest value that can be represented by the `uint32_t` type,
/// 2<sup>32</sup> &minus; 1.
#define UINT32_MAX 4294967295
/// The size of the `uint32_t` type in bits.
#define UINT32_WIDTH 32

/// The smallest value that can be represented by the `uint64_t` type, zero.
#define UINT64_MIN 0
/// The largest value that can be represented by the `uint64_t` type,
/// 2<sup>64</sup> &minus; 1.
#define UINT64_MAX 18446744073709551615
/// The size of the `uint64_t` type in bits.
#define UINT64_WIDTH 64

/// The largest value that can be represented by the `int_fast8_t`.
#define INT_FAST8_MAX INT8_MAX
/// The largest value that can be represented by the `int_fast16_t`.
#define INT_FAST16_MAX INT16_MAX
/// The largest value that can be represented by the `int_fast32_t`.
#define INT_FAST32_MAX INT32_MAX
/// The largest value that can be represented by the `int_fast64_t`.
#define INT_FAST64_MAX INT64_MAX

/// The largest value that can be represented by the `int_least8_t`.
#define INT_LEAST8_MAX INT8_MAX
/// The largest value that can be represented by the `int_least16_t`.
#define INT_LEAST16_MAX INT16_MAX
/// The largest value that can be represented by the `int_least32_t`.
#define INT_LEAST32_MAX INT32_MAX
/// The largest value that can be represented by the `int_least64_t`.
#define INT_LEAST64_MAX INT64_MAX

/// The largest value that can be represented by the `uint_fast8_t`.
#define UINT_FAST8_MAX UINT8_MAX
/// The largest value that can be represented by the `uint_fast16_t`.
#define UINT_FAST16_MAX UINT16_MAX
/// The largest value that can be represented by the `uint_fast32_t`.
#define UINT_FAST32_MAX UINT32_MAX
/// The largest value that can be represented by the `uint_fast64_t`.
#define UINT_FAST64_MAX UINT64_MAX

/// The largest value that can be represented by the `uint_least8_t`.
#define UINT_LEAST8_MAX UINT8_MAX
/// The largest value that can be represented by the `uint_least16_t`.
#define UINT_LEAST16_MAX UINT16_MAX
/// The largest value that can be represented by the `uint_least32_t`.
#define UINT_LEAST32_MAX UINT32_MAX
/// The largest value that can be represented by the `uint_least64_t`.
#define UINT_LEAST64_MAX UINT64_MAX

/// The smallest value that can be represented by the `int_fast8_t`.
#define INT_FAST8_MIN INT8_MIN
/// The smallest value that can be represented by the `int_fast16_t`.
#define INT_FAST16_MIN INT16_MIN
/// The smallest value that can be represented by the `int_fast32_t`.
#define INT_FAST32_MIN INT32_MIN
/// The smallest value that can be represented by the `int_fast64_t`.
#define INT_FAST64_MIN INT64_MIN

/// The smallest value that can be represented by the `int_least8_t`.
#define INT_LEAST8_MIN INT8_MIN
/// The smallest value that can be represented by the `int_least16_t`.
#define INT_LEAST16_MIN INT16_MIN
/// The smallest value that can be represented by the `int_least32_t`.
#define INT_LEAST32_MIN INT32_MIN
/// The smallest value that can be represented by the `int_least64_t`.
#define INT_LEAST64_MIN INT64_MIN

/// The smallest value that can be represented by the `uint_fast8_t`.
#define UINT_FAST8_MIN UINT8_MIN
/// The smallest value that can be represented by the `uint_fast16_t`.
#define UINT_FAST16_MIN UINT16_MIN
/// The smallest value that can be represented by the `uint_fast32_t`.
#define UINT_FAST32_MIN UINT32_MIN
/// The smallest value that can be represented by the `uint_fast64_t`.
#define UINT_FAST64_MIN UINT64_MIN

/// The smallest value that can be represented by the `uint_least8_t`.
#define UINT_LEAST8_MIN UINT8_MIN
/// The smallest value that can be represented by the `uint_least16_t`.
#define UINT_LEAST16_MIN UINT16_MIN
/// The smallest value that can be represented by the `uint_least32_t`.
#define UINT_LEAST32_MIN UINT32_MIN
/// The smallest value that can be represented by the `uint_least64_t`.
#define UINT_LEAST64_MIN UINT64_MIN

/// The smallest value that can be represented by the `intmax_t`.
#define INTMAX_MIN INT64_MIN
/// The largest value that can be represented by the `intmax_t`.
#define INTMAX_MAX INT64_MAX
/// The smallest value that can be represented by the `uintmax_t`.
#define UINTMAX_MIN UINT64_MIN
/// The largest value that can be represented by the `uintmax_t`.
#define UINTMAX_MAX UINT64_MAX

#ifdef __INTPTR_MAX__
    /// The largest value that can be represented by the `intptr_t`.
    #define INTPTR_MAX __INTPTR_MAX__
    /// The smallest value that can be represented by the `intptr_t`.
    #define INTPTR_MIN (-INTPTR_MAX - 1)

#else
    // Fallback to hardcoded values, should be valid on cpu's with 32bit
    // int/32bit `void*`

    /// The largest value that can be represented by the `intptr_t`.
    #define INTPTR_MAX (__STDINT_EXP(LONG_MAX))
    /// The smallest value that can be represented by the `intptr_t`.
    #define INTPTR_MIN (-__STDINT_EXP(LONG_MAX) - 1)
#endif /* __INTPTR_MAX__ */

/// The smallest value that can be represented by the `uintptr_t`.
#define UINTPTR_MIN 0
#ifdef __UINTPTR_MAX__
    /// The largest value that can be represented by the `intptr_t`.
    #define UINTPTR_MAX __UINTPTR_MAX__

#else
    // Fallback to hardcoded values, should be valid on cpu's with 32bit
    // int/32bit `void*`

    /// The largest value that can be represented by the `intptr_t`.
    #define UINTPTR_MAX (__STDINT_EXP(LONG_MAX) * 2UL + 1)
#endif /* __UINTPTR_MAX__ */

// TYPES

#ifdef __INT8_TYPE__
/// Signed integer type with size of exactly 8 bits with no padding bits and
/// using 2's complement for negative values
typedef __INT8_TYPE__ int8_t;
#endif /* __INT8_TYPE__ */

#ifdef __INT16_TYPE__
/// Signed integer type with size of exactly 16 bits with no padding bits and
/// using 2's complement for negative values
typedef __INT16_TYPE__ int16_t;
#endif /* __INT16_TYPE__ */

#ifdef __INT32_TYPE__
/// Signed integer type with size of exactly 32 bits with no padding bits and
/// using 2's complement for negative values
typedef __INT32_TYPE__ int32_t;
#endif /* __INT32_TYPE__ */

#ifdef __INT64_TYPE__
/// Signed integer type with size of exactly 64 bits with no padding bits and
/// using 2's complement for negative values
typedef __INT64_TYPE__ int64_t;
#endif /* __INT64_TYPE__ */

#ifdef __UINT8_TYPE__
/// Unsigned integer type with size of exactly 8 bits respectively
typedef __UINT8_TYPE__ uint8_t;
#endif /* __UINT8_TYPE__ */

#ifdef __UINT16_TYPE__
/// Unsigned integer type with size of exactly 16 bits respectively
typedef __UINT16_TYPE__ uint16_t;
#endif /* __UINT16_TYPE__ */

#ifdef __UINT32_TYPE__
/// Unsigned integer type with size of exactly 32 bits respectively
typedef __UINT32_TYPE__ uint32_t;
#endif /* __UINT32_TYPE__ */

#ifdef __UINT64_TYPE__
/// Unsigned integer type with size of exactly 64 bits respectively
typedef __UINT64_TYPE__ uint64_t;
#endif /* __UINT64_TYPE__ */

#ifdef __INTPTR_TYPE__
/// Signed integer type capable of holding a pointer to `void`
///
/// The size of this type is how many bytes it takes to reference any
/// location in memory. For example, on a **32 bit target**, this is **4 bytes**
/// and on a **64 bit target**, this is **8 bytes**.
typedef __INTPTR_TYPE__ intptr_t;
#endif /* __INTPTR_TYPE__ */

#ifdef __UINTPTR_TYPE__
/// Unsigned integer type capable of holding a pointer to `void`
///
/// The size of this type is how many bytes it takes to reference any
/// location in memory. For example, on a **32 bit target**, this is **4 bytes**
/// and on a **64 bit target**, this is **8 bytes**.
typedef __UINTPTR_TYPE__ uintptr_t;
#endif /* __UINTPTR_TYPE__ */

// Minimum-size integer types

/// Smallest signed integer type with size of 8 bits
typedef __INT_LEAST8_TYPE__ int_least8_t;
/// Smallest signed integer type with size of 16 bits
typedef __INT_LEAST16_TYPE__ int_least16_t;
/// Smallest signed integer type with size of 32 bits
typedef __INT_LEAST32_TYPE__ int_least32_t;
/// Smallest signed integer type with size of 64 bits
typedef __INT_LEAST64_TYPE__ int_least64_t;

/// Smallest unsigned integer type with size of at least 8 bits
typedef __UINT_LEAST8_TYPE__ uint_least8_t;
/// Smallest unsigned integer type with size of at least 16 bits
typedef __UINT_LEAST16_TYPE__ uint_least16_t;
/// Smallest unsigned integer type with size of at least 32 bits
typedef __UINT_LEAST32_TYPE__ uint_least32_t;
/// Smallest unsigned integer type with size of at least 64 bits
typedef __UINT_LEAST64_TYPE__ uint_least64_t;

// Fastest minimum-size integer types

/// Fastest signed integer type with size of at least 8 bits
typedef __INT_FAST8_TYPE__ int_fast8_t;
/// Fastest unsigned integer type with size of at least 16 bits
typedef __INT_FAST16_TYPE__ int_fast16_t;
/// Fastest unsigned integer type with size of at least 32 bits
typedef __INT_FAST32_TYPE__ int_fast32_t;
/// Fastest unsigned integer type with size of at least 64 bits
typedef __INT_FAST64_TYPE__ int_fast64_t;

/// Fastest unsigned integer type with size of at least 8 bits
typedef __UINT_FAST8_TYPE__ uint_fast8_t;
/// Fastest unsigned integer type with size of at least 16 bits
typedef __UINT_FAST16_TYPE__ uint_fast16_t;
/// Fastest unsigned integer type with size of at least 32 bits
typedef __UINT_FAST32_TYPE__ uint_fast32_t;
/// Fastest unsigned integer type with size of at least 64 bits
typedef __UINT_FAST64_TYPE__ uint_fast64_t;

/// Maximum-size signed integer type on the platform
typedef __INTMAX_TYPE__ intmax_t;
/// Maximum-size unsigned integer type on the platform
typedef __UINTMAX_TYPE__ uintmax_t;

/// Macro that expands to an integer constant expression having the value
/// specified by its argument and whose type is the promoted type of
/// `int_least8_t`.
#define INT8_C(c) c
/// Macro that expands to an integer constant expression having the value
/// specified by its argument and whose type is the promoted type of
/// `int_least16_t`.
#define INT16_C(c) c
/// Macro that expands to an integer constant expression having the value
/// specified by its argument and whose type is the promoted type of
/// `int_least32_t`.
#define INT32_C(c) c

/// Macro that expands to an integer constant expression having the value
/// specified by its argument and whose type is the promoted type of
/// `uint_least8_t`.
#define UINT8_C(c) c
/// Macro that expands to an integer constant expression having the value
/// specified by its argument and whose type is the promoted type of
/// `uint_least16_t`.
#define UINT16_C(c) c
/// Macro that expands to an integer constant expression having the value
/// specified by its argument and whose type is the promoted type of
/// `uint_least32_t`.
#define UINT32_C(c) c##U

#if UINTPTR_MAX == UINT64_MAX
    /// Macro that expands to an integer constant expression having the value
    /// specified by its argument and whose type is the promoted type of
    /// `int_least64_t`.
    #define INT64_C(c) c##L
    /// Macro that expands to an integer constant expression having the value
    /// specified by its argument and whose type is the promoted type of
    /// `uint_least64_t`.
    #define UINT64_C(c) c##UL
    /// Macro that expands to an integer constant expression having the value
    /// specified by its argument and whose type is the promoted type of
    /// `intmax_t`.
    #define INTMAX_C(c) c##L
    /// Macro that expands to an integer constant expression having the value
    /// specified by its argument and whose type is the promoted type of
    /// `uintmax_t`.
    #define UINTMAX_C(c) c##UL
#else
    /// Macro that expands to an integer constant expression having the value
    /// specified by its argument and whose type is the promoted type of
    /// `int_least64_t`.
    #define INT64_C(c)   c##LL
    /// Macro that expands to an integer constant expression having the value
    /// specified by its argument and whose type is the promoted type of
    /// `uint_least64_t`.
    #define UINT64_C(c)  c##ULL
    /// Macro that expands to an integer constant expression having the value
    /// specified by its argument and whose type is the promoted type of
    /// `intmax_t`.
    #define INTMAX_C(c)  c##LL
    /// Macro that expands to an integer constant expression having the value
    /// specified by its argument and whose type is the promoted type of
    /// `uintmax_t`.
    #define UINTMAX_C(c) c##ULL
#endif

#endif /* _OXILIBC_STDINT_H */