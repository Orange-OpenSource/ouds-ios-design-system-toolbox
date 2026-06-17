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

/// Tests the UI rendering of `OUDSStaticListItem` and `OUDSNavigationListItem` for each parameter for `WireframeTheme`.
final class WireframeThemeListItemSnapshotsTests: ListItemSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = WireframeTheme()
    }

    // MARK: Styles

    /// Tests all content styles in the `WireframeTheme` with the `light` color scheme.
    @MainActor func testAllStylesWireframeThemeLight() {
        testAllStyles(theme: theme, interfaceStyle: .light)
    }

    /// Tests all content styles in the `WireframeTheme` with the `dark` color scheme.
    @MainActor func testAllStylesWireframeThemeDark() {
        testAllStyles(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Alignments

    /// Tests all alignments in the `WireframeTheme` with the `light` color scheme.
    @MainActor func testAllAlignmentsWireframeThemeLight() {
        testAllAlignments(theme: theme, interfaceStyle: .light)
    }

    /// Tests all alignments in the `WireframeTheme` with the `dark` color scheme.
    @MainActor func testAllAlignmentsWireframeThemeDark() {
        testAllAlignments(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Sizes

    /// Tests all sizes in the `WireframeTheme` with the `light` color scheme.
    @MainActor func testAllSizesWireframeThemeLight() {
        testAllSizes(theme: theme, interfaceStyle: .light)
    }

    /// Tests all sizes in the `WireframeTheme` with the `dark` color scheme.
    @MainActor func testAllSizesWireframeThemeDark() {
        testAllSizes(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Rounded media

    /// Tests rounded media in the `WireframeTheme` with the `light` color scheme.
    @MainActor func testRoundedMediaWireframeThemeLight() {
        testRoundedMedia(theme: theme, interfaceStyle: .light)
    }

    /// Tests rounded media in the `WireframeTheme` with the `dark` color scheme.
    @MainActor func testRoundedMediaWireframeThemeDark() {
        testRoundedMedia(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Leadings

    /// Tests all leading elements in the `WireframeTheme` with the `light` color scheme.
    @MainActor func testAllLeadingsWireframeThemeLight() {
        testAllLeadings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all leading elements in the `WireframeTheme` with the `dark` color scheme.
    @MainActor func testAllLeadingsWireframeThemeDark() {
        testAllLeadings(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Trailings

    /// Tests all trailing elements in the `WireframeTheme` with the `light` color scheme.
    @MainActor func testAllTrailingsWireframeThemeLight() {
        testAllTrailings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all trailing elements in the `WireframeTheme` with the `dark` color scheme.
    @MainActor func testAllTrailingsWireframeThemeDark() {
        testAllTrailings(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
