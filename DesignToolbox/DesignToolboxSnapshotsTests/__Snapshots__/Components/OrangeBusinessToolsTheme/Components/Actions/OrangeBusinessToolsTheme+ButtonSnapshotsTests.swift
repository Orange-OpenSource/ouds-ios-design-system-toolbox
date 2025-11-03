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
import OUDSThemesOrangeBusinessTools
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSButton` for each parameter for `OrangeBusinessToolsTheme`.
final class OrangeBusinessToolsThemeButtonSnapshotsTests: ButtonSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var standardTheme: OUDSTheme!
    private var tunedTheme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        standardTheme = OrangeBusinessToolsTheme() // Default tuning do not have rounded corners
        tunedTheme = OrangeBusinessToolsTheme(tuning: Tuning(hasRoundedButtons: true))
    }

    // MARK: Orange Business Tools theme - no tuning

    /// Tests all buttons configuration in the `OrangeBusinessToolsTheme` with the `light` color schemes
    /// with default tuning.
    @MainActor func testAllButtonsOrangeBusinessToolsStandardThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: standardTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: standardTheme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeBusinessToolsTheme` with the `dark` color schemes
    /// with default tuning.
    @MainActor func testAllButtonsOrangeBusinessToolsStandardThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: standardTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: standardTheme, interfaceStyle: interfaceStyle)
    }

    // MARK: Orange Business Tools theme - with tuning

    /// Tests all buttons configuration in the `OrangeBusinessToolsTheme` with the `light` color schemes
    /// with special tuning (rounded corners)
    @MainActor func testAllButtonsOrangeBusinessToolsTunedThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: tunedTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: tunedTheme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeBusinessToolsTheme` with the `dark` color schemes
    /// with special tuning (rounded corners)
    @MainActor func testAllButtonsOrangeBusinessToolsTunedThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: tunedTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: tunedTheme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
