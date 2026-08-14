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

/// Tests the UI rendering of the `OUDSDisplay`, `OUDSHeading`, `OUDSBody`, `OUDSLabel` and `OUDSCode`
/// typography components for each parameter.
open class TypographySnapshotsTestsTestCase: XCTestCase {

    @MainActor func testAllTypography(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        testAllDisplays(theme: theme, interfaceStyle: interfaceStyle)
        testAllHeadings(theme: theme, interfaceStyle: interfaceStyle)
        testAllBodies(theme: theme, interfaceStyle: interfaceStyle)
        testAllLabels(theme: theme, interfaceStyle: interfaceStyle)
        testCode(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Display

    @MainActor func testAllDisplays(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for size in OUDSDisplay.Size.allCases {
            let model = DisplayConfigurationModel()
            model.text = "Display"
            model.size = size
            testDisplay(theme: theme, interfaceStyle: interfaceStyle, model: model)
        }
    }

    @MainActor private func testDisplay(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle, model: DisplayConfigurationModel) {
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSDisplay(text: model.text, size: model.size)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "Display\(model.size.technicalDescription)"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Heading

    @MainActor func testAllHeadings(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for size in OUDSHeading.Size.allCases {
            testHeading(theme: theme, interfaceStyle: interfaceStyle, size: size, hasMarker: false)
        }
        // The marker is only honored for `size == .large` and when the theme supports it.
        testHeading(theme: theme, interfaceStyle: interfaceStyle, size: .large, hasMarker: true)
        // The colored substring is only meaningful for `size == .large`.
        testHeadingColoredSubstring(theme: theme, interfaceStyle: interfaceStyle)
    }

    @MainActor private func testHeading(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle, size: OUDSHeading.Size, hasMarker: Bool) {
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSHeading(text: "Heading", size: size, hasMarker: hasMarker)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let markerPattern = hasMarker ? "_Marker" : ""
        let name = "Heading\(size.technicalDescription)\(markerPattern)"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    @MainActor private func testHeadingColoredSubstring(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSHeading(text: "Welcome to Sosh", coloredText: "Sosh")
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "HeadingColoredSubstring"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Body

    @MainActor func testAllBodies(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for size in OUDSBody.Size.allCases {
            for weight in OUDSBody.Weight.allCases {
                let model = BodyConfigurationModel()
                model.text = "Body"
                model.size = size
                model.weight = weight
                testBody(theme: theme, interfaceStyle: interfaceStyle, model: model)
            }
        }
    }

    @MainActor private func testBody(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle, model: BodyConfigurationModel) {
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSBody(text: model.text, size: model.size, weight: model.weight)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "Body\(model.size.technicalDescription)\(model.weight.technicalDescription)"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Label

    @MainActor func testAllLabels(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for size in OUDSLabel.Size.allCases {
            for weight in OUDSLabel.Weight.allCases {
                let model = LabelConfigurationModel()
                model.text = "Label"
                model.size = size
                model.weight = weight
                testLabel(theme: theme, interfaceStyle: interfaceStyle, model: model)
            }
        }
    }

    @MainActor private func testLabel(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle, model: LabelConfigurationModel) {
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSLabel(text: model.text, size: model.size, weight: model.weight)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "Label\(model.size.technicalDescription)\(model.weight.technicalDescription)"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Code

    @MainActor func testCode(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSCode(text: "let x = 42")
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "Code"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }
}

// swiftlint:enable required_deinit
