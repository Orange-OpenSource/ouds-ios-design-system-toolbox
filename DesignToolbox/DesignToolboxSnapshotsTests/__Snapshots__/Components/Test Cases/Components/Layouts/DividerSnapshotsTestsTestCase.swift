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

import OUDSComponents
import OUDSThemesContract
import OUDSThemesSosh
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSDivider` for each parameter
open class DividerSnapshotsTestsTestCase: XCTestCase {

    /// This function tests all Divider configuration for the given theme and color schemes on a standard surface.
    ///
    /// It iterates through all colors `OUDSDividerColor`, for both layout `orientations`.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllDividers(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for orientation: DividerConfigurationModel.Orientation in [.horizontal, .vertical] {
            for dividerColor in OUDSDividerColor.allCases {
                testDivider(theme: theme, interfaceStyle: interfaceStyle, dividerColor: dividerColor, orientation: orientation)
            }
        }
    }

    /// This function tests divider according to all parameters of the configutation available on a `OUDSDivider`
    /// for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters
    ///    test_<themeName>_<colorScheme>.<orientation>.<dividerColor>
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - dividerColor: the color of the divider
    ///   - orientation; the oriention of the divider (i.e. OUDSHorizontalDivider or OUDSVerticalDivider)
    @MainActor func testDivider(theme: OUDSTheme,
                                interfaceStyle: UIUserInterfaceStyle,
                                dividerColor: OUDSDividerColor,
                                orientation: DividerConfigurationModel.Orientation)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            DividerDemo(configurationModel: DividerConfigurationModel(orientation: orientation, selectedColor: dividerColor))
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>.<orientation>.<dividerColor>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let dividerColorPatern = dividerColor.description
        let orientationPatern = orientation == .horizontal ? "Horizontal" : "Vertical"
        let name = "\(orientationPatern).\(dividerColorPatern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
