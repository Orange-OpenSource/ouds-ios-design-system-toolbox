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
import OUDSTokensRaw
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSRadio` and `OUDSRadioItem` for each parameter
final class OUDSRadioUITests: XCTestCase {

    /// Tests all buttons configuration in the `OrangeTheme` with the `light` color schemes.
    @MainActor func testAllRadioButtonsOrangeThemeLight() {
        let theme = OrangeTheme()
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllRadioButtons(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeTheme` with the `dark` color schemes.
    @MainActor func testAllRadioButtonsOrangeThemeDark() {
        let theme = OrangeTheme()
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllRadioButtons(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Helpers

    /// This function tests all radio buttons configuration for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all combinations of layouts in enabled and disabled state.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testAllRadioButtons(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for indicatorState in [true, false] {
            for someLayout in availableLayouts(isError: false, isReadOnly: false) {
                testRadioButton(theme: theme,
                                interfaceStyle: interfaceStyle,
                                layout: someLayout,
                                indicatorState: indicatorState,
                                isDisabled: false)

                testRadioButton(theme: theme,
                                interfaceStyle: interfaceStyle,
                                layout: someLayout,
                                indicatorState: indicatorState,
                                isDisabled: true)
            }
        }

        for indicatorState in [true, false] {
            for someLayout in availableLayouts(isError: true, isReadOnly: false) {
                testRadioButton(theme: theme,
                                interfaceStyle: interfaceStyle,
                                layout: someLayout,
                                indicatorState: indicatorState,
                                isDisabled: false)
            }
        }

        for indicatorState in [true, false] {
            for someLayout in availableLayouts(isError: false, isReadOnly: true) {
                testRadioButton(theme: theme,
                                interfaceStyle: interfaceStyle,
                                layout: someLayout,
                                indicatorState: indicatorState,
                                isDisabled: false)
            }
        }
    }

    /// This function tests radio button according to all parameters of the configuration available on a `OUDSRadio`
    /// or `OUDSRadioItem` for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters
    ///    "test_<themeName>_<colorScheme>.<layout>_<indicatorState>_<disabledPatern>"
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - layout: the layout of the radio button
    ///   - indicatorState: the indicator state of the radio button (`true` if selected, `false` if not)
    ///   - isDisabled: the disabled flag
    @MainActor private func testRadioButton(theme: OUDSTheme,
                                            interfaceStyle: UIUserInterfaceStyle,
                                            layout: RadioTest.Layout,
                                            indicatorState: Bool,
                                            isDisabled: Bool)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            RadioTest(layout: layout,
                      indicatorState: indicatorState,
                      isDisabled: isDisabled)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<layout>_<indicatorState>_<disabledPatern> where:
        // - `disabledPatern` is empty if not disabled
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPatern = isDisabled ? "_Disabled" : ""
        let name = "\(layout.description.camelCase)_\(indicatorState ? "on" : "off")_\(disabledPatern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // swiftlint:disable line_length
    private func availableLayouts(isError: Bool, isReadOnly: Bool) -> [RadioTest.Layout] {
        [
            RadioTest.Layout.indicatorOnly(isError: isError),

            RadioTest.Layout.default(labelText: "Takoyaki", additionalLabelText: nil, helperText: nil, icon: nil, isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Takoyaki", additionalLabelText: nil, helperText: nil, icon: nil, isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: nil, helperText: "Bravas", icon: nil, isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: nil, helperText: "Bravas", icon: nil, isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: nil, icon: nil, isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: nil, icon: nil, isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: "Bravas", icon: nil, isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: "Bravas", icon: nil, isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Kammthaar", additionalLabelText: nil, helperText: nil, icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Kammthaar", additionalLabelText: nil, helperText: nil, icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: nil, helperText: "Bravas", icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: nil, helperText: "Bravas", icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: "Bravas", icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.default(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: "Bravas", icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: true, isReadOnly: isReadOnly),

            RadioTest.Layout.reversed(labelText: "Takoyaki", additionalLabelText: nil, helperText: nil, icon: nil, isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Takoyaki", additionalLabelText: nil, helperText: nil, icon: nil, isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: nil, helperText: "Bravas", icon: nil, isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: nil, helperText: "Bravas", icon: nil, isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: nil, icon: nil, isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: nil, icon: nil, isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: "Bravas", icon: nil, isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: "Bravas", icon: nil, isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Kammthaar", additionalLabelText: nil, helperText: nil, icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Kammthaar", additionalLabelText: nil, helperText: nil, icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: nil, helperText: "Bravas", icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: nil, helperText: "Bravas", icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: true, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: "Bravas", icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: false, isReadOnly: isReadOnly),
            RadioTest.Layout.reversed(labelText: "Patatas", additionalLabelText: "Patatata-patatata-patatas", helperText: "Bravas", icon: Image(systemName: "heart.fill"), isError: isError, hasDivider: true, isReadOnly: isReadOnly),
        ]
    }
    // swiftlint:enable line_length
}

// swiftlint:enable required_deinit

// MARK: - Radio Test

/// The test object which will define the `OUDSRadio` or `OUDSRadioItem`object to test
private struct RadioTest: View {

    enum Layout { // ControlItemLabel.LayoutData is not accessible, need to fake it here
        case indicatorOnly(isError: Bool)
        case `default`(labelText: String,
                       additionalLabelText: String?,
                       helperText: String?,
                       icon: Image?,
                       isError: Bool,
                       hasDivider: Bool,
                       isReadOnly: Bool)
        case reversed(labelText: String,
                      additionalLabelText: String?,
                      helperText: String?,
                      icon: Image?,
                      isError: Bool,
                      hasDivider: Bool,
                      isReadOnly: Bool)

        // swiftlint:disable line_length
        var description: String {
            switch self {
            case let .indicatorOnly(isError):
                "layout-indicatorOnly-\(isError ? "error" : "")"
            case let .default(_, additionalLabelText, helperText, icon, isError, hasDivider, isReadOnly):
                "layout-default-label-\(additionalLabelText != nil ? "withAdditional-" : "-")\(helperText != nil ? "withHelper" : "")-\(icon != nil ? "withIcon" : "")-\(isError ? "error" : "")-\(isReadOnly ? "readOnly-" : "-")\(hasDivider ? "divider" : "")"
            case let .reversed(_, additionalLabelText, helperText, icon, isError, hasDivider, isReadOnly):
                "layout-inverse-label-\(additionalLabelText != nil ? "withAdditional-" : "-")\(helperText != nil ? "withHelper" : "")-\(icon != nil ? "withIcon" : "")-\(isError ? "error" : "")-\(isReadOnly ? "readOnly" : "")-\(hasDivider ? "divider" : "")"
            }
        }
        // swiftlint:enable line_length
    }

    let layout: Layout
    let indicatorState: Bool
    let isDisabled: Bool

    var body: some View {
        radioButton()
    }

    @ViewBuilder
    func radioButton() -> some View {
        switch layout {
        case let .indicatorOnly(isError):
            OUDSRadio(isOn: .constant(indicatorState),
                      accessibilityLabel: "Bazinga!",
                      isError: isError)
                .disabled(isDisabled)
        case let .default(labelText, additionalLabelText, helperText, icon, isError, hasDivider, isReadOnly):
            OUDSRadioItem(isOn: .constant(indicatorState),
                          label: labelText,
                          additionalLabel: additionalLabelText,
                          helper: helperText,
                          icon: icon,
                          isReversed: false,
                          isError: isError,
                          isReadOnly: isReadOnly,
                          hasDivider: hasDivider)
                .disabled(isDisabled)
        case let .reversed(labelText, additionalLabelText, helperText, icon, isError, hasDivider, isReadOnly):
            OUDSRadioItem(isOn: .constant(indicatorState),
                          label: labelText,
                          additionalLabel: additionalLabelText,
                          helper: helperText,
                          icon: icon,
                          isReversed: true,
                          isError: isError,
                          isReadOnly: isReadOnly,
                          hasDivider: hasDivider)
                .disabled(isDisabled)
        }
    }
}
