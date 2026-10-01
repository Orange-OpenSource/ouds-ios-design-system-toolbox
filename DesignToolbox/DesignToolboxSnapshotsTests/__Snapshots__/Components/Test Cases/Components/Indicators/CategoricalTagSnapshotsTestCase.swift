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

/// Tests the UI rendering of the `OUDSCategoricalTag` for each parameter.
///
/// **Warning: the loader state in indterminated variant tag is not tested because of discrepencies with snapshots comparisons**
open class CategoricalTagSnapshotsTestsTestCase: XCTestCase {

    // MARK: - Categorical Tags

    /// Tests all categorical tags with all layouts, categories, sizes and shapes for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllCategoricalTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        testDisabledCategoricalTags(theme: theme, interfaceStyle: interfaceStyle)
        testEnabledCategoricalTags(theme: theme, interfaceStyle: interfaceStyle)
        testLoadingCategoricalTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests categorical tags in disabled state for each layouts, sizes and shapes.
    ///
    /// The category is fixed to `.category1` since the disabled rendering does not depend on category colors.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testDisabledCategoricalTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in CategoricalTagLayout.allCases {
            for size in OUDSTag.Size.allCases {
                for shape in OUDSTag.Shape.allCases {

                    let model = CategoricalTagConfigurationModel()
                    model.category = .category1

                    model.isLoading = false
                    model.enabled = false
                    model.flipIcon = false

                    model.layout = layout
                    model.size = size
                    model.shape = shape

                    let iconTypes: [DefinedStatusIcons] = model.enableFlipIcon ? DefinedStatusIcons.allCases : [.tintedIcon]
                    for iconType in iconTypes {
                        model.iconType = iconType
                        model.flipIcon = false
                        testCategoricalTag(theme: theme, interfaceStyle: interfaceStyle, model: model)

                        // Add extra test for flip icon if enabled
                        if model.enableFlipIcon {
                            model.flipIcon = true
                            testCategoricalTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                        }
                    }
                }
            }
        }
    }

    /// Tests categorical tags in enabled state for each layouts, categories, sizes and shapes.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testEnabledCategoricalTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in CategoricalTagLayout.allCases {
            for category in OUDSCategoricalTag.Category.allCases {
                for size in OUDSTag.Size.allCases {
                    for shape in OUDSTag.Shape.allCases {
                        let model = CategoricalTagConfigurationModel()

                        model.isLoading = false
                        model.enabled = true

                        model.layout = layout
                        model.category = category
                        model.size = size
                        model.shape = shape
                        model.flipIcon = false

                        let iconTypes: [DefinedStatusIcons] = model.enableFlipIcon ? DefinedStatusIcons.allCases : [.tintedIcon]
                        for iconType in iconTypes {
                            model.iconType = iconType
                            model.flipIcon = false
                            testCategoricalTag(theme: theme, interfaceStyle: interfaceStyle, model: model)

                            // Add extra test for flip icon if enabled
                            if model.enableFlipIcon {
                                model.flipIcon = true
                                testCategoricalTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                            }
                        }
                    }
                }
            }
        }
    }

    /// Tests categorical tags in loading state for each layouts, categories, sizes and shapes.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testLoadingCategoricalTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in CategoricalTagLayout.allCases {
            for category in OUDSCategoricalTag.Category.allCases {
                for size in OUDSTag.Size.allCases {
                    for shape in OUDSTag.Shape.allCases {
                        let model = CategoricalTagConfigurationModel()

                        model.enabled = true
                        model.flipIcon = false

                        model.isLoading = true
                        model.layout = layout
                        model.category = category
                        model.size = size
                        model.shape = shape
                        model.progressVariant = .determinate
                        model.progressValue = 0.75

                        testCategoricalTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                    }
                }
            }
        }
    }

    /// Tests `OUDSCategoricalTag` according to all parameters of the configuration available for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameter.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testCategoricalTag(theme: OUDSTheme,
                                               interfaceStyle: UIUserInterfaceStyle,
                                               model: CategoricalTagConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            CategoricalTagDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        let testName = "testCategoricalTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let layoutPattern = model.layout.debugDescription
        let categoryPattern = model.category.technicalDescription
        let sizePattern = model.size.technicalDescription
        let shapePattern = model.shape.technicalDescription

        let loaderPattern = model.isLoading ? ".loading" : ""
        let disabledPatern = model.isLoading ? "" : !model.enabled ? "_Disabled" : "_Enabled"

        let flipIconPattern = model.flipIcon ? ".flipIcon" : ""
        let imageModePattern = model.isLoading ? "" : model.enableFlipIcon
            ? (model.iconType == .image ? "_OriginalImage" : "_TemplateImage")
            : ""

        let name = "\(layoutPattern)\(categoryPattern)\(sizePattern)\(shapePattern)\(loaderPattern)\(imageModePattern)\(flipIconPattern)\(disabledPatern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

extension CategoricalTagLayout: CustomDebugStringConvertible {
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
