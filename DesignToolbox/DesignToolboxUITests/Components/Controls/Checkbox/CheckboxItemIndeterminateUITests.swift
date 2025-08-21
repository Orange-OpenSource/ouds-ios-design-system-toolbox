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

/// To make UI tests on `OUDSCheckboxItemIndeterminate` to test some a11y configurations.
final class CheckboxitemIndeterminateUITests: AppTestCase {

    /// Check the a11y configurations of the checkbox item with three values depending to its state
    @MainActor func testCheckboxItemIndeterminateA11yConfigurations() throws {

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "Indeterminate checkbox item", app)

        let checkbox = otherElements(withA11yIdentifier: A11YIdentifiers.componentCheckboxItemIndeterminate, app).firstMatch
        XCTAssertTrue(checkbox.exists)
        tapButton(withWording: "Selected", app)
        check(value: "core_checkbox_checked_a11y", ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItemIndeterminate, app)

        // WHEN

        checkbox.tap()

        // THEN

        check(value: "core_checkbox_unchecked_a11y", ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItemIndeterminate, app)

        // WHEN

        checkbox.tap()

        // THEN

        check(value: "core_checkbox_checked_a11y", ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItemIndeterminate, app)

        // WHEN

        tapButton(withWording: "Indeterminate", app)

        // THEN

        check(value: "core_checkbox_indeterminate_a11y", ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItemIndeterminate, app)

        // WHEN

        checkbox.tap()

        // THEN

        check(value: "core_checkbox_checked_a11y", ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItemIndeterminate, app)
    }

    // TODO: Test hints and labels
}

// swiftlint:enable required_deinit
