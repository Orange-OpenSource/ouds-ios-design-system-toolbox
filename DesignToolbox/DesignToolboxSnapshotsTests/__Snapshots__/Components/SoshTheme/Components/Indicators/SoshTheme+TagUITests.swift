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
import OUDSThemesSosh
import SwiftUI

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `OUDSTag`  for each parameter with `SoshTheme`.
final class SoshThemeTagUITests: TagUITestsTestCase {
    
    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional
    
    override func setUp() {
        theme = SoshTheme()
    }
    
    /// Tests all tags configuration in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllTagsSoshThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }
    
    /// Tests all tags configuration in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllTagsSoshThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }
    
    /// Tests all tags configuration in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllInputTagsSoshThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllInputTagsSoshThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
