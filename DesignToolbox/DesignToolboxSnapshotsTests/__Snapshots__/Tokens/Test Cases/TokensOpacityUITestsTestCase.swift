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
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **opacity token** using reference images
open class TokensOpacityUITestsTestCase: XCTestCase {

    /// Tests all opacity properties by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g., `SoshTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testOpacities(for theme: OUDSTheme, in interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all named tokens
        for namedToken in NamedOpacity.allCases {
            // Use the `IllustrationWidth` struct to test a single illustration
            let illustration = OUDSThemeableView(theme: theme) {
                OpacityTokenPage.IllustrationOpacity(opacityName: namedToken)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }
}

// swiftlint:enable required_deinit
