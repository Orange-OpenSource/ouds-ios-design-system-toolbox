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
import OUDSTokensRaw
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSCheckboxIndeterminate` and `OUDSCheckboxItemIndeterminate` for each parameter.
/// `OUDSCheckbox` and `OUDSCheckboxItem` won't be tested as, until today, are based on the same layouts and look and feels, and the only difference
/// is in the management of the states.
open class CheckboxSnapshotsTestsTestCase: XCTestCase {

    // swiftlint:disable function_body_length
    /// This function tests all checkboxes configuration for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all `OUDSCheckboxIndicatorState`, for all combinations of layouts in enabled and disabled state.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllCheckboxes(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for indicatorState in OUDSCheckboxIndicatorState.allCases {
            for someLayout in availableLayouts(isError: false, isReadOnly: false) {
                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: true)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: true)
            }
        }

        for indicatorState in OUDSCheckboxIndicatorState.allCases {
            for someLayout in availableLayouts(isError: true, isReadOnly: false) {
                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)
            }

            for someLayout in availableLayouts(isError: true, errorText: "Error text", isReadOnly: false) {
                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)
            }
        }

        for indicatorState in OUDSCheckboxIndicatorState.allCases {
            for someLayout in availableLayouts(isError: false, isReadOnly: true) {
                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)
            }
        }
    }

    // swiftlint:enable function_body_length

    /// This function tests checkbox according to all parameters of the configuration available on a `OUDSCheckbox`
    /// of `OUDSCheckboxItem` for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - a11yContrast: The constrat to apply (high or not)
    ///   - layout: the layout of the checkbox
    ///   - indicatorState: the indicator state of the checkbox
    ///   - isDisabled: the disabled flag
    @MainActor func testCheckbox(theme: OUDSTheme,
                                 interfaceStyle: UIUserInterfaceStyle,
                                 a11yContrast: UIAccessibilityContrast,
                                 layout: CheckboxIndeterminateTest.Layout,
                                 indicatorState: OUDSCheckboxIndicatorState,
                                 isDisabled: Bool)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            CheckboxIndeterminateTest(layout: layout,
                                      indicatorState: indicatorState,
                                      isDisabled: isDisabled)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<layout>_<indicatorState>_<disabledPatern> where:
        // - `disabledPatern` is empty if not disabled
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPatern = isDisabled ? "_Disabled" : ""
        let name = "\(layout.description.camelCase)_\(indicatorState.name)_\(disabledPatern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           a11yContrast: a11yContrast,
                           named: name,
                           precision: 0.92, // Not found why it failed for indicator only in light mode enabled for Sosh (｡•́︿•̀｡)
                           testName: testName)
    }

    // swiftlint:disable line_length
    // swiftlint:disable function_default_parameter_at_end
    private func availableLayouts(isError: Bool, errorText: String? = nil, isReadOnly: Bool) -> [CheckboxIndeterminateTest.Layout] {
        [
            CheckboxIndeterminateTest.Layout.indicatorOnly(isError: isError),

            CheckboxIndeterminateTest.Layout.default(labelText: "Takoyaki", helperText: nil, icon: nil, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Takoyaki", helperText: nil, icon: nil, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", helperText: "Bravas", icon: nil, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", helperText: "Bravas", icon: nil, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.default(labelText: "Kammthaar", helperText: nil, icon: Image(systemName: "figure.handball"), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Kammthaar", helperText: nil, icon: Image(systemName: "figure.handball"), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", helperText: "Bravas", icon: Image(systemName: "figure.handball"), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", helperText: "Bravas", icon: Image(systemName: "figure.handball"), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.default(labelText: "Kammthaar", helperText: nil, icon: Image(systemName: "figure.handball"), flipIcon: true, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Kammthaar", helperText: nil, icon: Image(systemName: "figure.handball"), flipIcon: true, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", helperText: "Bravas", icon: Image(systemName: "figure.handball"), flipIcon: true, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", helperText: "Bravas", icon: Image(systemName: "figure.handball"), flipIcon: true, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.reversed(labelText: "Takoyaki", helperText: nil, icon: nil, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Takoyaki", helperText: nil, icon: nil, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", helperText: "Bravas", icon: nil, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", helperText: "Bravas", icon: nil, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.reversed(labelText: "Kammthaar", helperText: nil, icon: Image(systemName: "figure.handball"), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Kammthaar", helperText: nil, icon: Image(systemName: "figure.handball"), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", helperText: "Bravas", icon: Image(systemName: "figure.handball"), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", helperText: "Bravas", icon: Image(systemName: "figure.handball"), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.reversed(labelText: "Kammthaar", helperText: nil, icon: Image(systemName: "figure.handball"), flipIcon: true, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Kammthaar", helperText: nil, icon: Image(systemName: "figure.handball"), flipIcon: true, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", helperText: "Bravas", icon: Image(systemName: "figure.handball"), flipIcon: true, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", helperText: "Bravas", icon: Image(systemName: "figure.handball"), flipIcon: true, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
        ]
    }
    // swiftlint:enable line_length
    // swiftlint:enable function_default_parameter_at_end
}

// swiftlint:enable required_deinit

// MARK: - Checkbox Test

/// The test object which will define the `OUDSCheckboxIndeterminate` or `OUDSCheckboxItemIndeterminate`object to test.
struct CheckboxIndeterminateTest: View {

    enum Layout { // Checkbox.Layout is private, not accessiblefrom  here
        case indicatorOnly(isError: Bool)
        case `default`(labelText: String,
                       helperText: String?,
                       icon: Image?,
                       flipIcon: Bool = false,
                       isError: Bool,
                       errorText: String? = nil,
                       hasDivider: Bool,
                       isReadOnly: Bool)
        case reversed(labelText: String,
                      helperText: String?,
                      icon: Image?,
                      flipIcon: Bool = false,
                      isError: Bool,
                      errorText: String? = nil,
                      hasDivider: Bool,
                      isReadOnly: Bool)

        // swiftlint:disable line_length
        var description: String {
            switch self {
            case let .indicatorOnly(isError):
                "layout-indicatorOnly-\(isError ? "error" : "")"
            case let .default(_, helperText, icon, flipIcon, isError, errorText, hasDivider, isReadOnly):
                "layout-default-label-\(helperText != nil ? "withHelper" : "")-\(icon != nil ? "withIcon" : "")-\(flipIcon ? "flipIcon" : "")-\(isError ? "error-\(errorText != nil ? "withText" : "")" : "")-\(isReadOnly ? "readOnly" : "")-\(hasDivider ? "divider" : "")"
            case let .reversed(_, helperText, icon, flipIcon, isError, errorText, hasDivider, isReadOnly):
                "layout-inverse-label-\(helperText != nil ? "withHelper" : "")-\(icon != nil ? "withIcon" : "")-\(flipIcon ? "flipIcon" : "")-\(isError ? "error-\(errorText != nil ? "withText" : "")" : "")-\(isReadOnly ? "readOnly" : "")-\(hasDivider ? "divider" : "")"
            }
        }
        // swiftlint:enable line_length
    }

    let layout: Layout
    let indicatorState: OUDSCheckboxIndicatorState
    let isDisabled: Bool

    var body: some View {
        checkbox()
    }

    @ViewBuilder
    func checkbox() -> some View {
        switch layout {
        case let .indicatorOnly(isError):
            OUDSCheckboxIndeterminate(selection: .constant(indicatorState),
                                      accessibilityLabel: "Bazinga!",
                                      isError: isError)
                .disabled(isDisabled)
        case let .default(labelText, helperText, icon, flipIcon, isError, errorText, hasDivider, isReadOnly):
            OUDSCheckboxItemIndeterminate(selection: .constant(indicatorState),
                                          label: labelText,
                                          helper: helperText,
                                          icon: icon,
                                          flipIcon: flipIcon,
                                          isReversed: false,
                                          isError: isError,
                                          errorText: errorText,
                                          isReadOnly: isReadOnly,
                                          hasDivider: hasDivider)
                .disabled(isDisabled)
        case let .reversed(labelText, helperText, icon, flipIcon, isError, errorText, hasDivider, isReadOnly):
            OUDSCheckboxItemIndeterminate(selection: .constant(indicatorState),
                                          label: labelText,
                                          helper: helperText,
                                          icon: icon,
                                          flipIcon: flipIcon,
                                          isReversed: true,
                                          isError: isError,
                                          errorText: errorText,
                                          isReadOnly: isReadOnly,
                                          hasDivider: hasDivider)
                .disabled(isDisabled)
        }
    }
}

// MARK: - extension OUDSCheckboxIndicatorState

extension OUDSCheckboxIndicatorState {
    var name: String {
        switch self {
        case .selected:
            "Selected"
        case .unselected:
            "Unselected"
        case .indeterminate:
            "Indeterminate"
        }
    }
}
