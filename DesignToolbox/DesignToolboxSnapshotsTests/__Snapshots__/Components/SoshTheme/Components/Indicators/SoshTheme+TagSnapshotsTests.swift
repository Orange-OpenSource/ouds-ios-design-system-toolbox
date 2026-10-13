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

/// Tests the UI rendering of the `OUDSTag`  for each parameter with `SoshTheme`.
final class SoshThemeTagSnapshotsTests: TagSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = SoshTheme()
    }

    /// Tests all tags configuration in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllTagsSoshThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllTagsSoshThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `SoshTheme` with the `light` color scheme.
    @MainActor func testAllInputTagsSoshThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testAllInputTagsSoshThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `OUDSTag` skeleton state in the `SoshTheme` with the `light` color scheme.
    @MainActor func testTagSkeletonSoshThemeLight() {
        testTagSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `OUDSTag` skeleton state in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testTagSkeletonSoshThemeDark() {
        testTagSkeleton(theme: theme, interfaceStyle: .dark)
    }

    /// Tests the `OUDSInputTag` skeleton state in the `SoshTheme` with the `light` color scheme.
    @MainActor func testInputTagSkeletonSoshThemeLight() {
        testInputTagSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `OUDSInputTag` skeleton state in the `SoshTheme` with the `dark` color scheme.
    @MainActor func testInputTagSkeletonSoshThemeDark() {
        testInputTagSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
