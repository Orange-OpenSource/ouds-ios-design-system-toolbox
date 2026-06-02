//
// Software Name: OUDS iOS
// SPDX-FileCopyrightText: Copyright (c) Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//
// Authors: See CONTRIBUTORS.txt
// Software description: A SwiftUI components library with code examples for Orange Unified Design System
//

import OUDSSwiftUI

extension OUDSTheme {

    /// The name of the theme used in snapshots files names
    var name: String {
        if self is OrangeTheme {
            return OrangeTheme.name
        }
        if self is OrangeCompactTheme {
            return OrangeCompactTheme.name
        }
        if self is SoshTheme {
            return SoshTheme.name
        }
        if self is WireframeTheme {
            return WireframeTheme.name
        }
        return String(describing: Self.self)
    }
}
