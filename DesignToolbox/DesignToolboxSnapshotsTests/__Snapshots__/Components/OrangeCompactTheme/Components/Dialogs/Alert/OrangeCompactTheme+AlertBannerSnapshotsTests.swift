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
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSAlertBanner` components for each parameter with `OrangeCompactTheme`
final class OrangeCompactThemeAlertBannerSnapshotsTests: AlertBannerSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeCompactTheme()
    }

    /// Tests all alert Banners configurations in the `OrangeCompactTheme` with the `light` color schemes.
    @MainActor func testAllAlertBannerOrangeCompactThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllAlertBanners(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all alert Banners configurations in the `OrangeCompactTheme` with the `dark` color schemes.
    @MainActor func testAllAlertBannersOrangeCompactThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllAlertBanners(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `OUDSAlertBanner` skeleton state in the `OrangeCompactTheme` with the `light` color scheme.
    @MainActor func testAlertBannerSkeletonOrangeCompactThemeLight() {
        testAlertBannerSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `OUDSAlertBanner` skeleton state in the `OrangeCompactTheme` with the `dark` color scheme.
    @MainActor func testAlertBannerSkeletonOrangeCompactThemeDark() {
        testAlertBannerSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
