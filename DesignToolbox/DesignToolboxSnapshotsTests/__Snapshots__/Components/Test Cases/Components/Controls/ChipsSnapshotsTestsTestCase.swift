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

/// Tests the UI rendering of the `OUDSFilterChip` and `OUDSSuggestionChip` for each parameter.
open class ChipsSnapshotsTestsTestCase: XCTestCase {

    /// This function tests all chips (Filter and Suggestion) with all layouts, for the given theme and color scheme.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all `ChipLayout.Layout`, for all combinations of layouts in enabled and disabled state.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllChips(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Test OUDSFilterChips
        for layout in ChipLayout.allCases {
            for enabled in [true, false] {
                let model = SuggestionChipConfigurationModel()
                model.layout = layout
                model.enabled = enabled

                testSuggestionChips(theme: theme, interfaceStyle: interfaceStyle, model: model)
            }
        }

        // Test OUDSSuggestionChips
        for layout in ChipLayout.allCases {
            for selected in [true, false] {
                for enabled in [true, false] {
                    let model = FilterChipConfigurationModel()
                    model.layout = layout
                    model.selected = selected
                    model.enabled = enabled

                    testFilterChips(theme: theme, interfaceStyle: interfaceStyle, model: model)
                }
            }
        }
    }

    /// This function tests `OUDSFilterChip` according to all parameters of the configuration available
    /// (Layout, enable state and selection) for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// **/!\ It does not text the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor func testFilterChips(theme: OUDSTheme,
                                    interfaceStyle: UIUserInterfaceStyle,
                                    model: FilterChipConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            FilterChipDemo(configurationModel: model)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<layout>_<selectionPattern>_<disabledPattern> where:
        // - `disabledPattern` is empty if not disabled
        // - `selectionPattern` is empty if not selected
        let testName = "testFilter_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPattern = !model.enabled ? "_Disabled" : ""
        let selectedPattern = model.selected ? "_Selected" : ""
        let name = "\(model.layout.debugDescription)\(selectedPattern)\(disabledPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests `OUDSSuggestionChip` according to all parameters of the configuration available
    /// (Layout, enable state) for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// **/!\ It does not text the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor func testSuggestionChips(theme: OUDSTheme,
                                        interfaceStyle: UIUserInterfaceStyle,
                                        model: SuggestionChipConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            SuggestionChipDemo(configurationModel: model)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<layout><disabledPattern> where:
        // - `disabledPattern` is empty if not disabled
        let testName = "testSuggestion_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPattern = !model.enabled ? "_Disabled" : ""
        let name = "\(model.layout.debugDescription)\(disabledPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

extension ChipLayout: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .textOnly:
            "TextOnly"
        case .textAndIcon:
            "TextAndIcon"
        case .iconOnly:
            "IconOnly"
        }
    }
}

// swiftlint:enable required_deinit
