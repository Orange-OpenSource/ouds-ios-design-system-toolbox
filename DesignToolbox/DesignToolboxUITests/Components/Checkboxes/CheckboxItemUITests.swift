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

/// To make UI tests on `OUDSCheckboxItem` to test some a11y configurations.
final class CheckboxItemUITests: AppTestCase {

    /// Check the a11y configurations of the checkbox depending to its state
    @MainActor func testCheckboxItemA11yConfigurations() throws {

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_checkbox_label", app)
        waitForButtonToAppear(withWording: "Checkbox Item", app)
        tapButton(withWording: "Checkbox Item", app)

        let checkbox = otherElements(withA11yIdentifier: A11YIdentifiers.componentCheckboxItem, app).firstMatch
        XCTAssertTrue(checkbox.exists)
        check(value: "core_checkbox_checked_a11y", ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItem, app)

        // WHEN

        checkbox.tap()

        // THEN

        check(value: "core_checkbox_unchecked_a11y", ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItem, app)

        // WHEN

        checkbox.tap()

        // THEN

        check(value: "core_checkbox_checked_a11y", ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItem, app)
    }

    // TODO: Test hints and labels
}

// swiftlint:enable required_deinit
