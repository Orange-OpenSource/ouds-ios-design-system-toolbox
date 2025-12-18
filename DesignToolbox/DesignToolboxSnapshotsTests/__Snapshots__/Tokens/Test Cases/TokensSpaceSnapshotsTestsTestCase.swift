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

/// Tests the UI rendering of each **space token** using reference images
open class TokensSpaceSnapshotsTestsTestCase: XCTestCase {

    /// Tests all scaled `Scaled` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testScaledProperty(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.Scaled
        for namedToken in NamedSpace.Scaled.allCases {
            // Generate the illustration for the specified space token
            let illustration = OUDSThemeableView(theme: theme) {
                ScaledSpaceProperty.Illustration(for: namedToken)
                    .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }

    /// Tests all padding fixed `Fixed` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g., `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testFixedProperty(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Iterate through all background color cases defined in NamedSpace.PaddingInline
        for namedToken in NamedSpace.Fixed.allCases {

            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    FixedSpaceProperty.Illustration(token: token)
                }
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }

    /// Tests all padding inset `Inset` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testInset(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.Inset
        for namedToken in NamedSpace.Inset.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    InsetSpaceProperty.Illustration(token: token)
                }
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }

    /// Tests all padding inline `PaddingInline` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testPaddingInline(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Iterate through all background color cases defined in NamedSpace.PaddingInline
        for namedToken in NamedSpace.PaddingInline.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    PaddingInlineProperty.Illustration(token: token)
                }
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }

    /// Tests all padding block `PaddingBlock` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testPaddingBlock(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.PaddingBlock
        for namedToken in NamedSpace.PaddingBlock.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    PaddingBlockProperty.Illustration(token: token)
                }
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }

    /// Tests all Column Gap `ColumnGap` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testColumnGap(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.ColumnGap
        for namedToken in NamedSpace.ColumnGap.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    ColumnGapProperty.Illustration(token: token)
                }
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }

    /// Tests all `RowGap` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testRowGap(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.ColumnGap
        for namedToken in NamedSpace.RowGap.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    RowGapProperty.Illustration(token: token)
                }
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }
}

// swiftlint:enable required_deinit
