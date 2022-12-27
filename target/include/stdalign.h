/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file stdalign.h

#ifndef __OXILIBC_STDALIGN_H
#define __OXILIBC_STDALIGN_H

#ifndef __cplusplus

    #if __STDC_VERSION__ >= 201112L
        // On C11 _Alignas and _Alignof are keywords so we don't define it from
        // C11 aftwards
    #elif defined(__GNUC__) || defined(__clang__)
        #define _Alignas(t) __attribute__((__aligned__(t)))
        #define _Alignof(t) __alignof__(t)
    #else
        #define _Alignas(t)
        #define _Alignof(t)
    #endif /* __STDC_VERSION__ >= 201112L */

    #define alignas _Alignas
    #define alignof _Alignof
#endif /* __cplusplus */

#define __alignas_is_defined 1
#define __alignof_is_defined 1

#endif /* __OXILIBC_STDALIGN_H */