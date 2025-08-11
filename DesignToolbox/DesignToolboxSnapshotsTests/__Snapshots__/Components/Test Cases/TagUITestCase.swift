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

    /// This function tests all badges with all types, hierarchy, status and size for the given theme and color scheme.
    ///
    /// It iterates through all `Tag.Type`, `OUDSTag.Hierarchy`, `OUDSTag.Status`, `OUDSTag.Size`.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Test OUDSTag
        for layout in TagLayout.allCases {
            for hierarchy in OUDSTag.Hierarchy.allCases {
                for status in OUDSTag.Status.allCases {
                    for size in OUDSTag.Size.allCases {
                        for shape in OUDSTag.Shape.allCases {
                            let model = TagConfigurationModel()
                            model.layout = layout
                            model.status = status
                            model.hierarchy = hierarchy
                            model.size = size
                            model.shape = shape

                            testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                        }
                    }
                }
            }
        }
    }

    /// This function tests `OUDSTag` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
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
        // test_<themeName>_<colorScheme>.<typePatterne><statusPattern><sizePattern> where:
        let testName = "testTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let layoutPattern = model.layout.technicalDescription.localized()
        let hierarchyPattern = model.hierarchy.technicalDescription
        let statusPattern = model.status.technicalDescription
        let sizePattern = model.size.technicalDescription
        let shapePattern = model.shape.technicalDescription

        let name = "\(layoutPattern)_\(hierarchyPattern)_\(statusPattern)_\(sizePattern)_\(shapePattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
