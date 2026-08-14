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

/// Tests the UI rendering of `OUDSStaticListItem` and `OUDSNavigationListItem` for each parameter for `SoshTheme`.
final class SoshThemeListItemSnapshotsTests: ListItemSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = SoshTheme()
    }

    // MARK: Styles

    /// Tests all content styles in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllStylesSoshThemeLight() {
        testAllStyles(theme: theme, interfaceStyle: .light)
    }

    /// Tests all content styles in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllStylesSoshThemeDark() {
        testAllStyles(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Alignments

    /// Tests all alignments in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllAlignmentsSoshThemeLight() {
        testAllAlignments(theme: theme, interfaceStyle: .light)
    }

    /// Tests all alignments in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllAlignmentsSoshThemeDark() {
        testAllAlignments(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Sizes

    /// Tests all sizes in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllSizesSoshThemeLight() {
        testAllSizes(theme: theme, interfaceStyle: .light)
    }

    /// Tests all sizes in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllSizesSoshThemeDark() {
        testAllSizes(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Rounded media

    /// Tests rounded media in the `SoshTheme` with the `light` color scheme.
    @MainActor func testRoundedMediaSoshThemeLight() {
        testRoundedMedia(theme: theme, interfaceStyle: .light)
    }

    /// Tests rounded media in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testRoundedMediaSoshThemeDark() {
        testRoundedMedia(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Leadings

    /// Tests all leading elements in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllLeadingsSoshThemeLight() {
        testAllLeadings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all leading elements in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllLeadingsSoshThemeDark() {
        testAllLeadings(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Trailings

    /// Tests all trailing elements in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllTrailingsSoshThemeLight() {
        testAllTrailings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all trailing elements in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllTrailingsSoshThemeDark() {
        testAllTrailings(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
