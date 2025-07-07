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
import OUDSComponents
import OUDSThemesOrange
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSBadge` for each parameter
final class OUDSBadgeUITests: XCTestCase {

    /// Tests all bages configuration in the `OrangeTheme` with the `light` color schemes.
    @MainActor func testAllBagesOrangeThemeLight() {
        let theme = OrangeTheme()
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllBadges(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all badges configuration in the `OrangeTheme` with the `dark` color schemes.
    @MainActor func testAllBadgesOrangeThemeDark() {
        let theme = OrangeTheme()
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllBadges(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Helpers

    /// This function tests all badges with all types, status and size for the given theme and color scheme.
    ///
    /// It iterates through all `Badge.Type`, `OUDSBadge.Status`, `OUDSBadge.Size`.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testAllBadges(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Test OUDSBadge
        for badgeType in BadgeConfigurationModel.BadgeType.allCases {
            for status in OUDSBadge.Status.allCases {
                for size in OUDSBadge.Size.allCases {
                    let model = BadgeConfigurationModel()
                    model.badgeType = badgeType
                    model.status = status
                    model.size = size

                    testBadge(theme: theme, interfaceStyle: interfaceStyle, model: model)

                    // Add extra test if type is count with value > 99
                    if badgeType == .count {
                        model.countText = "100"
                        testBadge(theme: theme, interfaceStyle: interfaceStyle, model: model)
                    }
                }
            }
        }
    }

    /// This function tests `OUDSBadge` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testBadge(theme: OUDSTheme,
                                      interfaceStyle: UIUserInterfaceStyle,
                                      model: BadgeConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            BadgeDemo(configurationModel: model)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<typePatterne><statusPattern><sizePattern> where:
        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let typePattern = model.badgeType.rawValue
        let statusPattern = model.status.technicalDescription
        let sizePattern = model.size.technicalDescription
        let name = "\(typePattern)\(statusPattern)\(sizePattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
