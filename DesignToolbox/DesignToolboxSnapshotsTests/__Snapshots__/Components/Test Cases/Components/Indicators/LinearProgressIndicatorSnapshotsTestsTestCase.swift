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
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSLinearProgressIndicator` for each parameter.
///
/// **Warning: only the determinate variant is tested. The indeterminate variant is not tested yet
/// as we face troubles with animations and snapshots.**
open class LinearProgressIndicatorSnapshotsTestsTestCase: XCTestCase {

    /// Fixed progress values covering the full [0, 1] range.
    private static let testedProgressValues: [Double] = [0.0, 0.25, 0.5, 0.75, 1.0]

    /// Tests all determinate linear progress indicators with all statuses, gap sizes,
    /// track on/off and the five predefined progress values for the given theme and color scheme.
    ///
    /// Also produces a small extra matrix on a fixed configuration (`neutral`, `.default` gap,
    /// track on, progress 0.5) crossing `stopIndicator` and `helperText` on/off to cover the
    /// two Linear-specific parameters.
    ///
    /// **The indeterminate variant is not tested yet as we face troubles with animations
    /// and snapshots.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllLinearProgressIndicators(theme: OUDSTheme,
                                                    interfaceStyle: UIUserInterfaceStyle)
    {
        // MARK: Base matrix - Status x GapSize x Track x Progress
        for status in OUDSLinearProgressIndicator.Status.allCases {
            for gapSize in OUDSLinearProgressIndicator.GapSize.allCases {
                for track in [true, false] {
                    for progress in Self.testedProgressValues {
                        let model = LinearProgressIndicatorConfigurationModel()
                        model.variant = .determinate
                        model.status = status
                        model.gapSize = gapSize
                        model.track = track
                        model.progress = progress
                        // Disable the reveal animation to make snapshots deterministic.
                        model.animated = false
                        model.stopIndicator = false
                        model.helperText = false

                        testLinearProgressIndicator(theme: theme,
                                                    interfaceStyle: interfaceStyle,
                                                    model: model)
                    }
                }
            }
        }

        // MARK: Extras matrix - stopIndicator x helperText (Linear-specific parameters)
        for stopIndicator in [true, false] {
            for helperText in [true, false] {
                // Skip the (false, false) combination which is already covered above
                // (neutral / default / track / progress 0.5).
                if !stopIndicator, !helperText { continue }

                let model = LinearProgressIndicatorConfigurationModel()
                model.variant = .determinate
                model.status = .neutral
                model.gapSize = .default
                model.track = true
                model.progress = 0.5
                model.animated = false
                model.stopIndicator = stopIndicator
                model.helperText = helperText

                testLinearProgressIndicator(theme: theme,
                                            interfaceStyle: interfaceStyle,
                                            model: model)
            }
        }
    }

    /// Renders a single determinate `OUDSLinearProgressIndicator` in the given configuration and
    /// captures a snapshot named after the configuration.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor func testLinearProgressIndicator(theme: OUDSTheme,
                                                interfaceStyle: UIUserInterfaceStyle,
                                                model: LinearProgressIndicatorConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            LinearProgressIndicatorDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration:
        // test_<themeName>_<colorScheme>.<typePattern><statusPattern><gapPattern><trackPattern><progressPattern>[<stopPattern>][<helperPattern>]
        let testName = "testLinearProgressIndicator_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let typePattern = "DeterminateLinearProgressIndicator"
        let statusPattern = model.status.technicalDescription
        let gapPattern = model.gapSize.technicalDescription
        let trackPattern = model.track ? ".track" : ".noTrack"
        // Encoded as `.progress_75` to keep the file name filesystem-friendly.
        let progressPattern = ".progress_\(Int((model.progress * 100).rounded()))"
        let stopPattern = model.stopIndicator ? ".stopIndicator" : ""
        let helperPattern = model.helperText ? ".helperText" : ""

        let name = "\(typePattern)\(statusPattern)\(gapPattern)\(trackPattern)\(progressPattern)\(stopPattern)\(helperPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable type_name
// swiftlint:enable required_deinit
