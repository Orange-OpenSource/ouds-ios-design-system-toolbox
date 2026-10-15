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

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSDisplay`, `OUDSHeading`, `OUDSBody`, `OUDSLabel` and `OUDSCode`
/// typography components for each parameter with `OrangeTheme`.
final class OrangeThemeTypographySnapshotsTests: TypographySnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeTheme()
    }

    @MainActor func testAllTypographyOrangeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTypography(theme: theme, interfaceStyle: interfaceStyle)
    }

    @MainActor func testAllTypographyOrangeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTypography(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
