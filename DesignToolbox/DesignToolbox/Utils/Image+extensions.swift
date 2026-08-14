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

    // MARK: - Decorative imahe

    /// Returns a decorative `Image` with the given named loaded form the suitable workspace depending to the theme name
    static func decorativeImage(named: String, prefixedBy themeName: String) -> Image {
        if themeName.contains(OrangeTheme.name) { // "Orange" and "Orange Compact" themes
            Image(decorative: "\(OrangeTheme.name)/\(named)")
        } else {
            Image(decorative: "\(themeName)/\(named)")
        }
    }

    // MARK: - Default image
    // Note: Warning, seen as false positive by Periphery, this method is used in tests cases
    /// Returns a decorative default `Image` view with Orange asset
    static func defaultImage() -> Image {
        Image(decorative: "\(OrangeTheme.name)/tips-and-tricks")
    }

    /// Returns a decorative default `Image` view with a prefix in the name, supposed to be theme assets folder.
    /// Supposed tp have in the Design System Toolbox, in assets folder, folders with assets "providing namespaces".
    static func defaultImage(prefixedBy themeName: String) -> Image {
        if themeName.contains(OrangeTheme.name) { // "Orange" and "Orange Compact" themes
            Image(decorative: "\(OrangeTheme.name)/tips-and-tricks")
        } else {
            Image(decorative: "\(themeName)/tips-and-tricks")
        }
    }

    /// Returns a Swift sample code for design toolbox app faking the use of a default icon
    static func defaultImageSample() -> String {
        "Image(decorative: \"tips-and-tricks\")"
    }

    // MARK: - Placeholder image

    /// Returns a Swift `Image` view with a placeholder image related to a theme.
    static func brandedPlaceholderImage(for themeName: String) -> Image {
        Image.decorativeImage(named: "il_placeholder", prefixedBy: themeName)
    }

    /// Returns a Swift `Image` view with a placeholder image, which can be decorative (i.e. not spotted by Voice Over) or not
    static func placeholderImage(decorative: Bool = false) -> Image {
        if decorative {
            Image(decorative: "il_placeholder")
        } else {
            Image("il_placeholder")
        }
    }

    /// Returns a Swift sample code for design toolbox app faking the use of a placeholder image
    static func placeholderImageSample() -> String {
        "Image(decorative: \"il_placeholder\")"
    }
}
