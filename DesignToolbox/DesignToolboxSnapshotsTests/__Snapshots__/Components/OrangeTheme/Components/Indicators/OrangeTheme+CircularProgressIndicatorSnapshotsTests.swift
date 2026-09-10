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

/// Tests the UI rendering of the `OUDSCircularProgressIndicator` for each parameter with `OrangeTheme`.
final class OrangeThemeCircularProgressIndicatorSnapshotsTests: CircularProgressIndicatorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeTheme()
    }

    /// Tests all circular progress indicators configuration in the `OrangeTheme` with the `light` color schemes.
    @MainActor func testAllCircularProgressIndicatorsOrangeThemeLight() {
        testAllCircularProgressIndicators(theme: theme, interfaceStyle: .light)
    }

    /// Tests all circular progress indicators configuration in the `OrangeTheme` with the `dark` color schemes.
    @MainActor func testAllCircularProgressIndicatorsOrangeThemeDark() {
        testAllCircularProgressIndicators(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable type_name
// swiftlint:enable required_deinit
