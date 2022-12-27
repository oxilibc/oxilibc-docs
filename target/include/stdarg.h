/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file stdarg.h

#ifndef _OXILIBC_STDARG_H
#define _OXILIBC_STDARG_H

/// A type suitable for holding the information needed by the macros `va_start`,
/// `va_copy`, `va_arg`, and `va_end`.
///
/// If a `va_list` instance is created, passed to another function, and used via
/// `va_arg` in that function, then any subsequent use in the calling function
/// should be preceded by a call to `va_end`.
///
/// It is legal to pass a pointer to a `va_list` object to another function and
/// then use that object after the function returns.
typedef __builtin_va_list va_list;

/// Enables access to the variable arguments following the named argument
/// `param`.
///
/// `va_start` should be invoked with an instance to a valid `va_list` object
/// `ap` before any calls to `va_arg`.
///
/// # Safety
///
/// If `param` is declared with register storage class specifier, with an array
/// type, with a function type, or with a type not compatible with the type that
/// results from default argument promotions, the behavior is undefined.
#define va_start(ap, param) __builtin_va_start(ap, param)

/// Performs cleanup for an `ap` object initialized by a call to `va_start` or
/// `va_copy`.
///
/// `va_end` may modify `ap` so that it is no longer usable.
///
/// # Safety
///
/// If there is no corresponding call to va_start or va_copy, or if va_end is
/// not called before a function that calls va_start or va_copy returns, the
/// behavior is undefined.
#define va_end(ap) __builtin_va_end(ap)

/// Expands to an expression of type `T` that corresponds to the next parameter
/// from the `va_list` `ap`.
///
/// Prior to calling `va_arg`, `ap` must be initialized by a call to either
/// `va_start` or `va_copy`, with no intervening call to `va_end`. Each
/// invocation of the va_arg macro modifies ap to point to the next variable
/// argument.
///
/// # Safety
///
/// If the type of the next argument in `ap` (after promotions) is not
/// compatible with `T`, the behavior is undefined, unless:
///
///     one type is a signed integer type, the other type is the corresponding
///     unsigned integer type, and the value is representable in both types; or
///     one type is pointer to void and the other is a pointer to a character
///     type.
///
/// If va_arg is called when there are no more arguments in ap, the behavior is
/// undefined.
#define va_arg(ap, T) __builtin_va_arg(ap, T)

/// Copies `va_list` from `src` to `dest`.
///
/// `va_end` should be called on `dest` before the function returns or any
/// subsequent re-initialization of `dest` (via calls to `va_start` or
/// `va_copy`).
#define va_copy(dest, src) __builtin_va_copy(dest, src)

#endif /* _OXILIBC_STDARG_H */