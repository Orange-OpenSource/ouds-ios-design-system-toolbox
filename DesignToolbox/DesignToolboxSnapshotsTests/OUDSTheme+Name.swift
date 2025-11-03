//
// Software Name: OUDSThemesContract iOS
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
            return "Orange"
        }
        if self is OrangeBusinessToolsTheme {
            return "Orange Business Tools"
        }
        if self is SoshTheme {
            return "Sosh"
        }
        if self is WireframeTheme {
            return "Wireframe"
        }
        return String(describing: Self.self)
    }
}
