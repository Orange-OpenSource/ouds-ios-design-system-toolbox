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
import OUDSThemesOrangeInverse
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSButton` for each parameter for `OrangeInverseTheme`.
final class OrangeInverseThemeButtonUITests: ButtonUITestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeInverseTheme()
    }

    /// Tests all buttons configuration in the `OrangeInverseTheme` with the `light` color schemes.
    @MainActor func testAllButtonsOrangeInverseThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: theme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeInverseTheme` with the `dark` color schemes.
    @MainActor func testAllButtonsOrangeInverseThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: theme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
