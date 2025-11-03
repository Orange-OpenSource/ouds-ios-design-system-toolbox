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

import OUDSThemesContract
import OUDSThemesOrange
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSCheckboxIndeterminate` and `OUDSCheckboxItemIndeterminate` for each parameter.
/// `OUDSCheckbox` and `OUDSCheckboxItem` won't be tested as, until today, are based on the same layouts and look and feels, and the only difference
/// is in the management of the states. Uses `OrangeTheme`.
final class OrangeThemeCheckboxSnapshotsTests: CheckboxSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeTheme()
    }

    /// Tests all buttons configuration in the `OrangeTheme` with the `light` color schemes.
    @MainActor func testAllCheckboxesOrangeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllCheckboxes(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeTheme` with the `dark` color schemes.
    @MainActor func testAllCheckboxesOrangeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllCheckboxes(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
