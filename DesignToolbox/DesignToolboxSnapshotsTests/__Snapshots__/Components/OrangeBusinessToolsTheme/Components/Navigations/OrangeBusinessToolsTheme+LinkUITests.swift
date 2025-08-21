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

import OUDS
import OUDSThemesOrangeBusinessTools
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSLink` for each parameter  for `OrangeBusinessToolsTheme`.
final class OrangeBusinessToolsThemeLinkUITests: LinkUITestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeBusinessToolsTheme()
    }

    /// Tests all link configuration in the `OrangeBusinessToolsTheme` with the `light` color schemes.
    @MainActor func testAllLinksOrangeBusinessToolsThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllLinks(theme: theme, interfaceStyle: interfaceStyle)
        testAllLinksOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all link configuration in the `OrangeBusinessToolsTheme` with the `dark` color schemes.
    @MainActor func testAllLinksOrangeBusinessToolsThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllLinks(theme: theme, interfaceStyle: interfaceStyle)
        testAllLinksOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
