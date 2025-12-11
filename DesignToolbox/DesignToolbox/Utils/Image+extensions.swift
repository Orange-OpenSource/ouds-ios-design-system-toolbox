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
import SwiftUI

extension Image {

    /// Returns a decorative `Image` with the given named loaded form the suitable workspace depending to the theme name
    static func decorativeImage(named: String, prefixedBy themeName: String) -> Image {
        if themeName.contains("Orange") { // "Orange" and "Orange Business Tools" themes
            Image(decorative: "Orange/\(named)")
        } else {
            Image(decorative: "\(themeName)/\(named)")
        }
    }

    // Note: Warning, seen as false positive by Periphery, this method is used in tests cases
    /// Returns a decorative default `Image` view with Orange asset
    static func defaultImage() -> Image {
        Image(decorative: "Orange/tips-and-tricks")
    }

    /// Returns a decorative default `Image` view with a prefix in the name, upposed to be theme assets folder.
    /// Supposed ot have in the Design System Toolbox, in assets folder, folders with assets "providing namespaces".
    static func defaultImage(prefixedBy themeName: String) -> Image {
        if themeName.contains("Orange") { // "Orange" and "Orange Business Tools" themes
            Image(decorative: "Orange/tips-and-tricks")
        } else {
            Image(decorative: "\(themeName)/tips-and-tricks")
        }
    }

    /// Returns a Swift sample code for design toolbox app faking the use of an image
    static func defaultImageSample() -> String {
        "Image(decorative: \"tips-and-tricks\")"
    }
}
