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

/// Tests the UI rendering of the `OUDSTag` for each parameter
open class TagUITestsTestCase: XCTestCase {

    /// This function tests all tags with all types, hierarchy, status and size for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in TagLayout.allCases {
            for appearance in OUDSTag.Appearance.allCases {
                for statusCategory in OUDSTag.Status.Category.allCases {
                    for size in OUDSTag.Size.allCases {
                        for shape in OUDSTag.Shape.allCases {
                            // Drop loader and disabled status because this case is not allowed
                            for loader in [true, false] {
                                let model = TagConfigurationModel()
                                model.layout = layout
                                model.statusCategory = statusCategory
                                model.appearance = appearance
                                model.size = size
                                model.shape = shape
                                model.loader = loader
                                model.flipIcon = false

                                testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)

                                // Add extra test for flip icon if not disbaled
                                if !model.disableFlipIcon {
                                    model.flipIcon = true
                                    testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    /// This function tests `OUDSTag` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameter.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor func testTag(theme: OUDSTheme,
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

        let name = "\(layoutPattern)\(appearancePattern)\(statusPattern)\(sizePattern)\(shapePattern)\(loaderPattern)\(flipIconPattern)"

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
