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
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSButton` for each parameter
open class ButtonSnapshotsTestsTestCase: XCTestCase {

    /// This function tests all buttons configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    /// **The loading style is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// It iterates through all button `appearance`, for all `style` with *textOnly, textAndIcon and iconOnly* layouts
    /// in enabled and disabled states.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllButtons(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for appearance in OUDSButton.Appearance.allCases {
            for layout in ButtonTest.Layout.allCases {
                for disabled in [true, false] {
                    testButton(theme: theme,
                               interfaceStyle: interfaceStyle,
                               a11yContrast: .normal,
                               layout: layout,
                               appearance: appearance,
                               disabled: disabled,
                               onColoredSurface: false)
                    testButton(theme: theme,
                               interfaceStyle: interfaceStyle,
                               a11yContrast: .high,
                               layout: layout,
                               appearance: appearance,
                               disabled: disabled,
                               onColoredSurface: false)
                }
            }
        }
    }

    /// This function tests all buttons configuration for the given themen and color schemes on aa colored surface (the `colorSurfaceBrandPrimary` token)
    ///
    /// **/!\ It does not test the hover and pressed states.**
    /// **The loading style is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// It iterates through all button `appearance`, for all `style` with* textOnly, textAndIcon and iconOnly layouts*
    /// in enabled and disabled state.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllButtonsOnColoredSurface(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Skip test for negative and brand appearance because it is not allowed on colored surface
        for appearance in OUDSButton.Appearance.allCases where appearance != .negative && appearance != .brand {
            for layout in ButtonTest.Layout.allCases {
                for disabled in [true, false] {
                    testButton(theme: theme,
                               interfaceStyle: interfaceStyle,
                               a11yContrast: .normal,
                               layout: layout,
                               appearance: appearance,
                               disabled: disabled,
                               onColoredSurface: true)
                    testButton(theme: theme,
                               interfaceStyle: interfaceStyle,
                               a11yContrast: .high,
                               layout: layout,
                               appearance: appearance,
                               disabled: disabled,
                               onColoredSurface: true)
                }
            }
        }
    }

    /// This function tests button according to all parameters of the configutation available on a `OUDButton`
    /// for the given theme and color schemes and on a colored surface or not.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// **/!\ It does not text the hover and pressed states.**
    /// **The loading style is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - a11yContrast:Contrast mode (high or not)
    ///   - layout: the layout of the button
    ///   - appearance; the appearance of the button
    ///   - disabled: the disabled flag
    ///   - onColoredSurface: a flag to know if button is on a colored surface or not
    @MainActor private func testButton(theme: OUDSTheme,
                                       interfaceStyle: UIUserInterfaceStyle,
                                       a11yContrast: UIAccessibilityContrast,
                                       layout: ButtonTest.Layout,
                                       appearance: OUDSButton.Appearance,
                                       disabled: Bool,
                                       onColoredSurface: Bool = false)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            ButtonTest(layout: layout, appearance: appearance, style: .default, onColoredSurface: onColoredSurface)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
                .disabled(disabled)
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")_\(a11yContrast == .high ? "HighContrast" : "")"
        let coloredSurfacePatern = onColoredSurface ? "ColoredSurface_" : ""
        let disabledPatern = disabled ? "_Disabled" : ""
        let roundedPattern = theme.tuning.hasRoundedButtons ? "_Rounded" : ""
        let name = "\(coloredSurfacePatern)\(layout.rawValue.camelCase)_\(appearance.description)_\(OUDSButton.Style.default.description)\(disabledPatern)\(roundedPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           a11yContrast: a11yContrast,
                           named: name,
                           testName: testName)
    }
}

// MARK: - Button Test

struct ButtonTest: View {

    enum Layout: String, CaseIterable {
        case text
        case textAndIcon
        case icon
    }

    let layout: Layout
    let appearance: OUDSButton.Appearance
    let style: OUDSButton.Style
    let onColoredSurface: Bool

    @Environment(\.theme) private var theme

    var body: some View {
        if onColoredSurface {
            OUDSColoredSurface(color: theme.colorModes.modeOnBrandPrimary, content: button)
        } else {
            button()
        }
    }

    func button() -> some View {
        switch layout {
        case .text:
            OUDSButton(text: "Button", appearance: appearance, style: style) {}
        case .textAndIcon:
            OUDSButton(icon: Image(decorative: "ic_heart"), text: "Button", appearance: appearance, style: style) {}
        case .icon:
            OUDSButton(icon: Image(decorative: "ic_heart"), accessibilityLabel: "Icon", appearance: appearance, style: style) {}
        }
    }
}

// swiftlint:enable required_deinit
