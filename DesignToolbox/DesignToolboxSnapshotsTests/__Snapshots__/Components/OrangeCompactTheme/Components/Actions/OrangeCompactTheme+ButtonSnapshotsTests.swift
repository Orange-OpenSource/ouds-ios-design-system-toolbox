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

/// Tests the UI rendering of the `OUDSButton` for each parameter for `OrangeCompactTheme`.
final class OrangeCompactThemeButtonSnapshotsTests: ButtonSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var standardTheme: OUDSTheme!
    private var tunedTheme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        standardTheme = OrangeCompactTheme() // Default tuning do not have rounded corners
        tunedTheme = OrangeCompactTheme(tuning: Tuning(hasRoundedButtons: true))
    }

    // MARK: Orange Compact theme - no tuning

    /// Tests all buttons configuration in the `OrangeCompactTheme` with the `light` color schemes
    /// with default tuning.
    @MainActor func testAllButtonsOrangeCompactStandardThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: standardTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: standardTheme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeCompactTheme` with the `dark` color schemes
    /// with default tuning.
    @MainActor func testAllButtonsOrangeCompactStandardThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: standardTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: standardTheme, interfaceStyle: interfaceStyle)
    }

    // MARK: Orange Compact theme - with tuning

    /// Tests all buttons configuration in the `OrangeCompactTheme` with the `light` color schemes
    /// with special tuning (rounded corners)
    @MainActor func testAllButtonsOrangeCompactTunedThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: tunedTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: tunedTheme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeCompactTheme` with the `dark` color schemes
    /// with special tuning (rounded corners)
    @MainActor func testAllButtonsOrangeCompactTunedThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: tunedTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: tunedTheme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
