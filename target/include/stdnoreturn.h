/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file stdnoreturn.h

#ifndef __OXILIBC_STDNORETURN_H
#define __OXILIBC_STDNORETURN_H

#ifndef __cplusplus
    #if __STDC_VERSION__ >= 201112L
        // On C11 _Noreturn is a keyword so we don't define it from C11 aftwards
    #elif defined(__GNUC__) || defined(__clang__)
        #define _Noreturn __attribute__((__noreturn__))
    #else
        #define _Noreturn
    #endif /* __STDC_VERSION__ >= 201112L */

    #define noreturn _Noreturn
#endif /* __cplusplus */

#define __noreturn_is_defined 1

#endif /* __OXILIBC_STDNORETURN_H */