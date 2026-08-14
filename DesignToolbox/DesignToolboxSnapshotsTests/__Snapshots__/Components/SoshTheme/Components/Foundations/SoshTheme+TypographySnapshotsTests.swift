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

/// Tests the UI rendering of the `OUDSDisplay`, `OUDSHeading`, `OUDSBody`, `OUDSLabel` and `OUDSCode`
/// typography components for each parameter with `SoshTheme`.
///
/// Note: `SoshTheme` does not support the `OUDSHeading` marker (`theme.hasTypographyHeadingLargeMarker == false`),
/// so the "Marker" snapshot for this theme captures a plain heading (the marker is silently skipped).
final class SoshThemeTypographySnapshotsTests: TypographySnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = SoshTheme()
    }

    @MainActor func testAllTypographySoshThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTypography(theme: theme, interfaceStyle: interfaceStyle)
    }

    @MainActor func testAllTypographySoshThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTypography(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
