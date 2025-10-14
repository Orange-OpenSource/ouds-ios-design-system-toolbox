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
import OUDSFoundations
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit
// swiftlint:disable type_body_length

/// Tests the UI rendering of each **color token** using reference images
open class TokensColorUITestsTestCase: XCTestCase {

    /// This function tests colors for the `Background` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testBackgroundColors(theme: OUDSTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         precision: Float = XCTestCase.precision,
                                         perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Background
        for color in NamedColor.Background.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.hasForbiddenColorValue() {
                OL.debug("For NamedColor.Bacgkround cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Action` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testActionColors(theme: OUDSTheme,
                                     interfaceStyle: UIUserInterfaceStyle,
                                     precision: Float = XCTestCase.precision,
                                     perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Action
        for color in NamedColor.Action.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.hasForbiddenColorValue() {
                OL.debug("For NamedColor.Action cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Always` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testAlwaysColors(theme: OUDSTheme,
                                     interfaceStyle: UIUserInterfaceStyle,
                                     precision: Float = XCTestCase.precision,
                                     perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Always
        for color in NamedColor.Always.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.isForbiddenValueColor() {
                OL.debug("For NamedColor.Always cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Content` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testContentColors(theme: OUDSTheme,
                                      interfaceStyle: UIUserInterfaceStyle,
                                      precision: Float = XCTestCase.precision,
                                      perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Content
        for color in NamedColor.Content.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.hasForbiddenColorValue() {
                OL.debug("For NamedColor.Content cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Border` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testBorderColors(theme: OUDSTheme,
                                     interfaceStyle: UIUserInterfaceStyle,
                                     precision: Float = XCTestCase.precision,
                                     perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Border
        for color in NamedColor.Border.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.hasForbiddenColorValue() {
                OL.debug("For NamedColor.Border cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Chart` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testChartColors(theme: OUDSTheme,
                                    interfaceStyle: UIUserInterfaceStyle,
                                    precision: Float = XCTestCase.precision,
                                    perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Chart
        for color in NamedColor.Chart.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.hasForbiddenColorValue() {
                OL.debug("For NamedColor.Chart cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Opacity` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testOpacityColors(theme: OUDSTheme,
                                      interfaceStyle: UIUserInterfaceStyle,
                                      precision: Float = XCTestCase.precision,
                                      perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Opacity
        for color in NamedColor.Opacity.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Overlay` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testOverlayColors(theme: OUDSTheme,
                                      interfaceStyle: UIUserInterfaceStyle,
                                      precision: Float = XCTestCase.precision,
                                      perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Overlay
        for color in NamedColor.Overlay.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.hasForbiddenColorValue() {
                OL.debug("For NamedColor.Opacity cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Repository` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testRepositoryColors(theme: OUDSTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         precision: Float = XCTestCase.precision,
                                         perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Repository
        for color in NamedColor.Repository.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.isForbiddenValueColor() {
                OL.debug("For NamedColor.Repository cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }

    /// This function tests colors for the `Surface` category of the given theme.
    /// It captures snapshots for each background color in the specified theme and interfaceStyle (light or dark).
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - precision: Value for tests, default set to `XCTestCase.precision`
    ///   - perceptualPrecision: Value for tests, default set to `XCTestCase.perceptualPrecision`
    @MainActor func testSurfaceColors(theme: OUDSTheme,
                                      interfaceStyle: UIUserInterfaceStyle,
                                      precision: Float = XCTestCase.precision,
                                      perceptualPrecision: Float = XCTestCase.perceptualPrecision)
    {
        // Iterate through all background color cases defined in NamedColor.Surface
        for color in NamedColor.Surface.allCases {
            // Retrieve the corresponding color token from the provided theme
            let token = color.token(from: theme)

            if token.hasForbiddenColorValue() {
                OL.debug("For NamedColor.Surface cases and theme \(theme.name) a forbidden value has been skipped (\(color))")
                continue
            }

            // Generate the illustration for the specified color token
            let illustration = OUDSThemeableView(theme: theme) {
                ColorTokenPage.Illustration(token: token, name: color.rawValue)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current interfaceStyle (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = color.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               precision: precision,
                               perceptualPrecision: perceptualPrecision,
                               testName: testName)
        }
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_body_length
