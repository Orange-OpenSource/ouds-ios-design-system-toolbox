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
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSBadgeStandard`, `OUDSBadgeIcon` and `OUDSBadgeCount` for each parameter
open class BadgeSnapshotsTestsTestCase: XCTestCase {

    /// This function tests all badges with all types, status and size for the given theme and color scheme.
    ///
    /// It iterates through all types, sizes and status of badge components.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllBadges(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Test OUDSBadgeStandard
        for status in OUDSBadgeStandard.Status.allCases {
            let model = BadgeStandardConfigurationModel()
            model.status = status
            for size in OUDSBadgeStandard.Size.allCases {
                model.standardSize = size
                testBadgeStandard(theme: theme, interfaceStyle: interfaceStyle, model: model)
            }
        }

        // Test OUDSBadgeIcon
        for status in BadgeIconStatusKind.allCases {
            let model = BadgeIconConfigurationModel()
            model.statusKind = status
            for size in OUDSBadgeStandard.Size.allCases {
                model.size = size
                for statusIcon in DefinedStatusIcons.allCases {
                    model.statusIcon = statusIcon
                    testBadgeIcon(theme: theme, interfaceStyle: interfaceStyle, model: model)
                }
            }
        }

        // Test OUDSBadgeCount
        for status in OUDSBadgeStandard.Status.allCases {
            let model = BadgeCountConfigurationModel()
            model.status = status
            for size in OUDSBadgeCount.Size.allCases {
                model.countSize = size
                model.countText = "100"
                testBadgeCount(theme: theme, interfaceStyle: interfaceStyle, model: model)
            }
        }
    }

    /// This function tests `OUDSBadgeStandard` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor func testBadgeStandard(theme: OUDSTheme,
                                      interfaceStyle: UIUserInterfaceStyle,
                                      model: BadgeStandardConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            BadgeStandardDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<typePatterne><statusPattern><sizePattern> where:
        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let typePattern = "StandardBadge"
        let statusPattern = model.status.technicalDescription
        let sizePattern = model.standardSize.technicalDescription

        let name = "\(typePattern)\(statusPattern)\(sizePattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests `OUDSBadgeIcon` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor func testBadgeIcon(theme: OUDSTheme,
                                  interfaceStyle: UIUserInterfaceStyle,
                                  model: BadgeIconConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            BadgeIconDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<typePatterne><statusPattern><sizePattern> where:
        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let typePattern = "IconBadge"
        let statusPattern = model.statusKind.technicalDescription
        let statusIconPattern = model.statusIcon.technicalDescription
        let sizePattern = model.size.technicalDescription

        let name = "\(typePattern)\(statusPattern)\(statusIconPattern)\(sizePattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests `OUDSBadgeCount` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor func testBadgeCount(theme: OUDSTheme,
                                   interfaceStyle: UIUserInterfaceStyle,
                                   model: BadgeCountConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            BadgeCountDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<typePatterne><statusPattern><sizePattern> where:
        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let typePattern = "CountBadge"
        let statusPattern = model.status.technicalDescription
        let sizePattern = model.countSize.technicalDescription

        let name = "\(typePattern)\(statusPattern)\(sizePattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // MARK: - Helpers

    private func statusKind(_ status: OUDSBadgeIcon.Status) -> BadgeIconStatusKind {
        switch status {
        case .neutral:
            .neutral
        case .accent:
            .accent
        case .positive:
            .positive
        case .info:
            .info
        case .warning:
            .warning
        case .negative:
            .negative
        }
    }
}

// swiftlint:enable required_deinit
