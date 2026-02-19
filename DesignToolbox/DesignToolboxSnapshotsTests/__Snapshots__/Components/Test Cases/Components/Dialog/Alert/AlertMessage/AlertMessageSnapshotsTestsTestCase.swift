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

/// Tests the UI rendering of the `OUDSAlertMessage` for each parameter
open class AlertMessageSnapshotsTestsTestCase: XCTestCase {

    /// This function tests some AlertMessage configuration for the given theme and color schemes on a standard surface.
    ///
    /// To reduce the size of memory of snapshots, two kinds of configuration are considered:
    /// - first: With action at the traling position, with bullet list and without close button
    /// - seconf: With action at the bottom position without bullet but with a close button
    /// For both, it iterates through all `AlertMessageStatus` values.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllAlertMessages(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        for status in AlertMessageStatus.allCases {
            let model = AlertMessageConfigurationModel()
            model.status = status
            model.statusIcon = true
            model.descriptionText = "Here is a long description that need two lines to be displayed"

            // First test with bullet list and action at top trailing position
            model.closeButton = false
            model.actionPosition = .topTrailing
            model.bullet2 = "Bullet 2 is a bullet with a very long label to test the wrapping"

            testAlertMessage(theme: theme,
                             interfaceStyle: interfaceStyle,
                             model: model)

            // Second test with action at bottom and with close button, but without bullet list
            model.closeButton = true
            model.actionPosition = .bottom
            model.bullet1 = ""
            model.bullet2 = ""
            model.bullet3 = ""

            testAlertMessage(theme: theme,
                             interfaceStyle: interfaceStyle,
                             model: model)
        }
    }

    /// This function tests AlertMessage according to parameters of the configuration available on a `OUDSAlertMessage`
    /// for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters
    ///    test_<themeName>_<colorScheme>_<status>_<actionPosition>
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testAlertMessage(theme: OUDSTheme,
                                             interfaceStyle: UIUserInterfaceStyle,
                                             model: AlertMessageConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            AlertMessageDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>_<type>_<textStyle>_<isBold>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let statusPattern = model.status.technicalDescription
        let actionPosition = model.actionPosition.technicalDescription

        let name = "\(statusPattern)\(actionPosition)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
