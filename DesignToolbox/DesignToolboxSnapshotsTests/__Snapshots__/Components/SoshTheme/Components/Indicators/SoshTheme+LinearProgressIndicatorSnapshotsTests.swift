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

/// Tests the UI rendering of the `OUDSLinearProgressIndicator` for each parameter with `SoshTheme`.
final class SoshThemeLinearProgressIndicatorSnapshotsTests: LinearProgressIndicatorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = SoshTheme()
    }

    /// Tests all linear progress indicators configuration in the `SoshTheme` with the `light` color schemes.
    @MainActor func testAllLinearProgressIndicatorsSoshThemeLight() {
        testAllLinearProgressIndicators(theme: theme, interfaceStyle: .light)
    }

    /// Tests all linear progress indicators configuration in the `SoshTheme` with the `dark` color schemes.
    @MainActor func testAllLinearProgressIndicatorsSoshThemeDark() {
        testAllLinearProgressIndicators(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable type_name
// swiftlint:enable required_deinit
