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

/// Tests the UI rendering of the `OUDSBulletList` for each parameter
open class BulletListSnapshotsTestsTestCase: XCTestCase {

    /// This function tests all BulletList configuration for the given theme and color schemes on a standard surface.
    ///
    /// It iterates through all elements of configuration `BulletListType`, `BulletListTextStyle`, `isBold` flag.
    /// For unordered list, additional elements are iterated in `testUnorderedBulletList`
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllBulletLists(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for type in BulletListType.allCases {
            for textType in BulletListTextStyle.allCases {
                for levelCount in BulletListLevelCount.allCases {

                    for isBold in [true, false] {
                        let model = BulletListConfigurationModel()
                        model.textStyle = textType
                        model.isBold = isBold
                        model.bulletType = type
                        model.levelCount = levelCount

                        switch type {
                        case .unordered:
                            testUnorderedBulletList(theme: theme,
                                                    interfaceStyle: interfaceStyle,
                                                    model: model)
                        case .ordered, .bare:
                            testBulletList(theme: theme,
                                           interfaceStyle: interfaceStyle,
                                           model: model)
                        }
                    }
                }
            }
        }
    }

    /// This function tests Unordered Bullet List with some additional parameter like bullet type,
    /// and flag to know if bullet is branded.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains sommon common element of configuration
    @MainActor private func testUnorderedBulletList(theme: OUDSTheme,
                                                    interfaceStyle: UIUserInterfaceStyle,
                                                    model: BulletListConfigurationModel)
    {
        for icon in BulletListUnorderedAsset.allCases {
            for isBranded in [true, false] {
                model.unorderedAsset = icon
                model.unorderedBulletIsBranded = isBranded

                testBulletList(theme: theme,
                               interfaceStyle: interfaceStyle,
                               model: model)
            }
        }
    }

    /// This function tests BulletList according to all parameters of the configuration available on a `OUDSBulletList`
    /// for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters
    ///    test_<themeName>_<colorScheme>_<type>_<textStyle>_<isBold>
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testBulletList(theme: OUDSTheme,
                                           interfaceStyle: UIUserInterfaceStyle,
                                           model: BulletListConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            BulletListDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>_<type>_<textStyle>_<isBold>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let typePattern = model.bulletType.description
        let bulletTypePattern = model.bulletType == .unordered ? "_\(model.unorderedAsset.description)" : ""
        let brandedBulletPattern = model.bulletType == .unordered && model.unorderedBulletIsBranded ? "_Branded" : ""
        let unorderedBulletTypePattern = model.bulletType == .unordered ? bulletTypePattern + brandedBulletPattern : ""
        let textStylePattern = model.textStyle.description
        let isBoldPattern = model.isBold ? "Bold" : ""
        let countPattern = switch model.levelCount {
        case .one:
            "Count-1"
        case .two:
            "Count-2"
        case .three:
            "Count-3"
        }
        let name = "\(typePattern)\(unorderedBulletTypePattern)_\(textStylePattern)_\(isBoldPattern)_\(countPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
