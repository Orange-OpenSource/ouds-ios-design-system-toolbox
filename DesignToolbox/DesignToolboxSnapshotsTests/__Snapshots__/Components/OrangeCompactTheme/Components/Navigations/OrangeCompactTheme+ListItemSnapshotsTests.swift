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
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of `OUDSStaticListItem` and `OUDSNavigationListItem` for each parameter for `OrangeCompactTheme`.
final class OrangeCompactThemeListItemSnapshotsTests: ListItemSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeCompactTheme()
    }

    // MARK: Styles

    /// Tests all content styles in the `OrangeCompactTheme` with the `light` color scheme.
    @MainActor func testAllStylesOrangeCompactThemeLight() {
        testAllStyles(theme: theme, interfaceStyle: .light)
    }

    /// Tests all content styles in the `OrangeCompactTheme` with the `dark` color scheme.
    @MainActor func testAllStylesOrangeCompactThemeDark() {
        testAllStyles(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Alignments

    /// Tests all alignments in the `OrangeCompactTheme` with the `light` color scheme.
    @MainActor func testAllAlignmentsOrangeCompactThemeLight() {
        testAllAlignments(theme: theme, interfaceStyle: .light)
    }

    /// Tests all alignments in the `OrangeCompactTheme` with the `dark` color scheme.
    @MainActor func testAllAlignmentsOrangeCompactThemeDark() {
        testAllAlignments(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Sizes

    /// Tests all sizes in the `OrangeCompactTheme` with the `light` color scheme.
    @MainActor func testAllSizesOrangeCompactThemeLight() {
        testAllSizes(theme: theme, interfaceStyle: .light)
    }

    /// Tests all sizes in the `OrangeCompactTheme` with the `dark` color scheme.
    @MainActor func testAllSizesOrangeCompactThemeDark() {
        testAllSizes(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Rounded media

    /// Tests rounded media in the `OrangeCompactTheme` with the `light` color scheme.
    @MainActor func testRoundedMediaOrangeCompactThemeLight() {
        testRoundedMedia(theme: theme, interfaceStyle: .light)
    }

    /// Tests rounded media in the `OrangeCompactTheme` with the `dark` color scheme.
    @MainActor func testRoundedMediaOrangeCompactThemeDark() {
        testRoundedMedia(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Leadings

    /// Tests all leading elements in the `OrangeCompactTheme` with the `light` color scheme.
    @MainActor func testAllLeadingsOrangeCompactThemeLight() {
        testAllLeadings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all leading elements in the `OrangeCompactTheme` with the `dark` color scheme.
    @MainActor func testAllLeadingsOrangeCompactThemeDark() {
        testAllLeadings(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Trailings

    /// Tests all trailing elements in the `OrangeCompactTheme` with the `light` color scheme.
    @MainActor func testAllTrailingsOrangeCompactThemeLight() {
        testAllTrailings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all trailing elements in the `OrangeCompactTheme` with the `dark` color scheme.
    @MainActor func testAllTrailingsOrangeCompactThemeDark() {
        testAllTrailings(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
