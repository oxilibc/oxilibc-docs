/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file bits/assert.h

#ifndef _BITS_ASSERT_H
#define _BITS_ASSERT_H

#ifdef NDEBUG
    #define assert(cond) (void)0
#else
    #define assert(cond) \
        ((void)((cond)   \
                || (__assert_fail(__func__, __FILE__, __LINE__, #cond), 0)))
#endif

#endif /* _BITS_ASSERT_H */