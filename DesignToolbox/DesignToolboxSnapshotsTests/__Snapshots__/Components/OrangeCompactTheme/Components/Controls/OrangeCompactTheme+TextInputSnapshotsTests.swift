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

// swiftlint:disable required_deinit
// swiftlint:disable type_name
// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSTextInput` for each parameter for `OrangeCompactTheme`.
final class OrangeCompactThemeTextInputSnapshotsTests: TextInputSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeCompactTheme()
    }

    /// Tests all switches configuration in the `OrangeCompactTheme` with the `light` color schemes.
    @MainActor func testAllTextInputsOrangeCompactThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTextInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all switches configuration in the `OrangeCompactTheme` with the `dark` color schemes.
    @MainActor func testAllTextInputsOrangeCompactThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTextInputs(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
