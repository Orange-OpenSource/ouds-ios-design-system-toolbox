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
import OUDSFoundations
import OUDSThemesOrange
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSTag` for each parameter.
///
/// **Warning: the loader state tag is not tested because of discrepencies with snapshots comparisons**
open class TagUITestsTestCase: XCTestCase {

    /// Tests all tags with all types, appearances, status and size for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        testDisabledTags(theme: theme, interfaceStyle: interfaceStyle)
        testEnabledTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests tags in disabled state for each layouts, sizes and shapes.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testDisabledTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in TagLayout.allCases {
            for size in OUDSTag.Size.allCases {
                for shape in OUDSTag.Shape.allCases {

                    let model = TagConfigurationModel()
                    model.statusCategory = .accent
                    model.appearance = .emphasized

                    model.loader = false
                    model.enabled = false
                    model.flipIcon = false

                    model.layout = layout
                    model.size = size
                    model.shape = shape

                    testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)

                    // Add extra test for flip icon if enabled
                    if model.enableFlipIcon {
                        model.flipIcon = true
                        testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                    }
                }
            }
        }
    }

    /// Tests tags in enabled state for each layouts, appearances, catagories, sizes and shapes.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testEnabledTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in TagLayout.allCases {
            for appearance in OUDSTag.Appearance.allCases {
                for statusCategory in OUDSTag.Status.Category.allCases {
                    for size in OUDSTag.Size.allCases {
                        for shape in OUDSTag.Shape.allCases {
                            let model = TagConfigurationModel()

                            model.loader = false
                            model.enabled = true

                            model.layout = layout
                            model.statusCategory = statusCategory
                            model.appearance = appearance
                            model.size = size
                            model.shape = shape
                            model.flipIcon = false

                            testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)

                            // Add extra test for flip icon if enabled
                            if model.enableFlipIcon {
                                model.flipIcon = true
                                testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                            }
                        }
                    }
                }
            }
        }
    }

    /// Tests`OUDSTag` according to all parameters of the configuration available for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameter.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testTag(theme: OUDSTheme,
                                    interfaceStyle: UIUserInterfaceStyle,
                                    model: TagConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            TagDemo(configurationModel: model)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        let testName = "testTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let layoutPattern = model.layout.debugDescription
        let appearancePattern = model.appearance.technicalDescription
        let statusPattern = model.statusCategory.technicalDescription
        let sizePattern = model.size.technicalDescription
        let shapePattern = model.shape.technicalDescription
        let loaderPattern = model.loader ? ".loader" : ""
        let flipIconPattern = model.flipIcon ? ".flipIcon" : ""
        let disabledPatern = !model.enabled ? "_Disabled" : "_Enabled"

        let name = "\(layoutPattern)\(appearancePattern)\(statusPattern)\(sizePattern)\(shapePattern)\(loaderPattern)\(flipIconPattern)\(disabledPatern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests all input tags with disable state for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllInputTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for enabled in [true, false] {
            let model = InputTagConfigurationModel()
            model.enabled = enabled
            testInputTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
        }
    }

    /// This function tests `OUDSInputTag` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameter.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testInputTag(theme: OUDSTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         model: InputTagConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            InputTagDemo(configurationModel: model)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        let testName = "testInputTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPattern = model.enabled ? "" : "_Disabled"

        let name = disabledPattern

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

extension TagLayout: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .textOnly:
            "textOnly"
        case .textAndBullet:
            "textAndBullet"
        case .textAndIcon:
            "textAndIcon"
        }
    }
}

// swiftlint:enable required_deinit
