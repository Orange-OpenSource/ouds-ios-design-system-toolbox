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
import OUDSThemesOrange
import SwiftUI

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `OUDSTag` for each parameter with `OrangeTheme`.
final class OrangeThemeThemeTagUITests: TagUITestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeTheme()
    }

    /// Tests all tags configuration in the `OrangeTheme` with the `light` color scheme.
    @MainActor func testAllTagsOrangeThemeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `OrangeTheme` with the `dark` color scheme.
    @MainActor func testAllTagsOrangeThemeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `OrangeTheme` with the `light` color scheme.
    @MainActor func testAllInputTagsOrangeThemeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `OrangeTheme` with the `dark` color scheme.
    @MainActor func testAllInputTagsOrangeThemeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
