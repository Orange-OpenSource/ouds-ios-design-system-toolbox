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
import OUDSThemesOrange
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **space token** using reference images
final class OUDSTokensSpaceUITests: XCTestCase {

    // MARK: - Orange Theme Light Mode Space Tests

    /// This function tests all dimension tokens in the `OrangeTheme` with  the `light` color schemes.
    /// It iterates through all `NamedSpace` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. Each snapshot is saved with a name that indicates the spacing type, theme, and color scheme.
    @MainActor func testAllSpacesOrangeThemeLight() {
        // Testing for different types of spacing for light mode
        let theme = OrangeTheme()
        let interfaceStyle = UIUserInterfaceStyle.light
        testScaledProperty(theme: theme, interfaceStyle: interfaceStyle)
        testFixedProperty(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInline(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInset(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingStack(theme: theme, interfaceStyle: interfaceStyle)
        testColumnGap(theme: theme, interfaceStyle: interfaceStyle)
        testRowGap(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Orange Theme Dark Mode Space Tests

    /// This function tests all space tokens in the `OrangeTheme` with both the  `dark` color schemes.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the space type, theme, and interfaceStyle (i.e color scheme).
    @MainActor func testAllSpacesOrangeThemeDark() {
        // Testing for different types of spacing for dark mode
        let theme = OrangeTheme()
        let interfaceStyle = UIUserInterfaceStyle.dark
        testScaledProperty(theme: theme, interfaceStyle: interfaceStyle)
        testFixedProperty(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInline(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInset(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingStack(theme: theme, interfaceStyle: interfaceStyle)
        testColumnGap(theme: theme, interfaceStyle: interfaceStyle)
        testRowGap(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Helper Functions

    /// Tests all scaled `Scaled` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testScaledProperty(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.Scaled
        for namedToken in NamedSpace.Scaled.allCases {
            // Generate the illustration for the specified space token
            let illustration = OUDSThemeableView(theme: theme) {
                ScaledSpaceProperty.Illustration(for: namedToken)
                    .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
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
    @MainActor private func testFixedProperty(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Iterate through all background color cases defined in NamedSpace.PaddingInline
        for namedToken in NamedSpace.Fixed.allCases {

            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    FixedSpaceProperty.Illustration(token: token)
                }
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
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
    @MainActor private func testPaddingInline(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Iterate through all background color cases defined in NamedSpace.PaddingInline
        for namedToken in NamedSpace.PaddingInline.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    PaddingInlineProperty.Illustration(token: token)
                }
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
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

    /// Tests all padding inset `PaddingInset` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testPaddingInset(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.PaddingInset
        for namedToken in NamedSpace.PaddingInset.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    PaddingInsetProperty.Illustration(token: token)
                }
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
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

    /// Tests all padding stack `PaddingStack` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `OrangeTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testPaddingStack(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.PaddingStack
        for namedToken in NamedSpace.PaddingStack.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    PaddingStackProperty.Illustration(token: token)
                }
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
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
    @MainActor private func testColumnGap(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.ColumnGap
        for namedToken in NamedSpace.ColumnGap.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    ColumnGapProperty.Illustration(token: token)
                }
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
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
    @MainActor private func testRowGap(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.ColumnGap
        for namedToken in NamedSpace.RowGap.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = OUDSThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    RowGapProperty.Illustration(token: token)
                }
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
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
