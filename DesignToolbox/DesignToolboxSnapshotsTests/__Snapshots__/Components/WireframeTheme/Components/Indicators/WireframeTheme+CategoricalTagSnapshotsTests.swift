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

/// Tests the UI rendering of the `OUDSCategoricalTag` for each parameter with `WireframeTheme`.
final class WireframeThemeCategoricalTagSnapshotsTests: CategoricalTagSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = WireframeTheme()
    }

    /// Tests all categorical tags configuration in the `WireframeTheme` with the `light` color scheme.
    @MainActor func testAllCategoricalTagsWireframeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllCategoricalTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all categorical tags configuration in the `WireframeTheme` with the `dark` color scheme.
    @MainActor func testAllCategoricalTagsWireframeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllCategoricalTags(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
