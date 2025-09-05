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

/// Tests the UI rendering of the `OUDSRadio` and `OUDSRadioItem` for each parameter  for `OrangeBusinessToolsTheme`.
final class OrangeBusinessToolsThemeRadioUITests: RadioButtonUITestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeBusinessToolsTheme()
    }

    /// Tests all buttons configuration in the `OrangeBusinessToolsTheme` with the `light` color schemes.
    @MainActor func testAllRadioButtonsOrangeBusinessToolsThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllRadioButtons(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeBusinessToolsTheme` with the `dark` color schemes.
    @MainActor func testAllRadioButtonsOrangeBusinessToolsThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllRadioButtons(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
