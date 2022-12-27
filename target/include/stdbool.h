/*
 * Copyright (c) 2022, Eric Shimizu Karbstein
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/// @file stdbool.h

#ifndef _OXILIBC_STDBOOL_H
#define _OXILIBC_STDBOOL_H

/* Don't define bool, true, and false in C++ */
#ifndef __cplusplus

    #if __STDC_VERSION__ > 201710L
        /// A value of type `bool`  representing logical **true**.
        /// `true` is the logical opposite of `false`.
        #define true ((_Bool) + 1u)

        /// A value of type `bool` representing logical **false**.
        /// `false` is the logical opposite of `true`.
        #define false ((_Bool) + 0u)
    #else
        /// A value of type `bool`  representing logical **true**.
        /// `true` is the logical opposite of `false`.
        #define true 1

        /// A value of type `bool` representing logical **false**.
        /// `false` is the logical opposite of `true`.
        #define false 0
    #endif

    /// The boolean type
    #define bool _Bool

#endif   // __cplusplus

/* Defined even on C++ */
/// Flag to mark that `bool`, `true` and `false` symbols are defined
#define __bool_true_false_are_defined 1

#endif /* _OXILIBC_STDBOOL_H */