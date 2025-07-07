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

import XCTest

// swiftlint:disable required_deinit

/// To make UI tests on `OUDSSwitch` to test some a11y configurations.
final class SwitchUITests: AppTestCase {

    /// Check the a11y configurations of the switch depending to its state
    @MainActor func testSwitchA11yConfigurations() throws {

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        tapButton(withWording: "app_components_switch_label", app)
        tapButton(withWording: "app_components_switch_label", app)

        let `switch` = otherElements(withA11yIdentifier: A11YIdentifiers.componentSwitch, app).firstMatch
        XCTAssertTrue(`switch`.exists)
        check(value: "core_common_selected_a11y", ofElementWithIdentifier: A11YIdentifiers.componentSwitch, app)

        // WHEN

        `switch`.tap()

        // THEN

        check(value: "core_common_unselected_a11y", ofElementWithIdentifier: A11YIdentifiers.componentSwitch, app)

        // WHEN

        `switch`.tap()

        // THEN

        check(value: "core_common_selected_a11y", ofElementWithIdentifier: A11YIdentifiers.componentSwitch, app)
    }

    // TODO: Test hints and labels
}

// swiftlint:enable required_deinit
