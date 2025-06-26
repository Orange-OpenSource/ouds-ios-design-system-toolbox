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

/// To make UI tests on some checkbox picker from OUDS
/// Tests the accessibility identifiers, labels or values of the items depending to their states and user actions.
final class CheckboxPickerUITests: AppTestCase {

    /// Select several items and checks if the counter in the root item is updated with the suitable value
    @MainActor func testCheckboxPickerRootItemCount() throws {

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkboxPicker_label", app)

        // By default, one element is selected in the picker, wording cannot be used as is
        var expectedPickerRootItemString = wording(for: "app_components_checkboxPicker_root") + " (1)"
        assertStaticTextExists(expectedPickerRootItemString, app)

        // WHEN, THEN

        // Select all
        tapImage(withName: "dog.fill", app)
        tapImage(withName: "waterbottle.fill", app)
        expectedPickerRootItemString = wording(for: "app_components_checkboxPicker_root") + " (3)"
        assertStaticTextExists(expectedPickerRootItemString, app)

        // Unselect some
        tapImage(withName: "dog.fill", app)
        expectedPickerRootItemString = wording(for: "app_components_checkboxPicker_root") + " (2)"
        assertStaticTextExists(expectedPickerRootItemString, app)

        // Unselect all
        tapImage(withName: "flame", app)
        tapImage(withName: "waterbottle.fill", app)
        expectedPickerRootItemString = wording(for: "app_components_checkboxPicker_root")
    }

    /// Given the checkbox picker of the demo app,
    /// selects the items and checks if the others ahvec the suitable states
    @MainActor func testCheckboxPickerA11YSelection() throws {

        let selectedA11Yvalue = "core_checkbox_checked_a11y"
        let unselectedA11Yvalue = "core_checkbox_unchecked_a11y"

        let rootItemA11YLabel = wording(for: "app_components_checkboxPicker_root")
        let firstItemA11YIdentifier = "Virgin Holy Lava"
        let secondItemA11YIdentifier = "IPA beer"
        let thirdItemA11YIdentifier = "Mineral water"

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkboxPicker_label", app)

        check(value: selectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)

        // WHEN

        var itemToSelect = otherElements(withA11yIdentifier: firstItemA11YIdentifier, app).firstMatch
        itemToSelect.tap()

        // THEN

        check(value: pickerRootItemA11yValue(with: 0), ofElementWithLabel: rootItemA11YLabel, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)

        // WHEN

        itemToSelect = otherElements(withA11yIdentifier: firstItemA11YIdentifier, app).firstMatch
        itemToSelect.tap()

        // THEN

        check(value: pickerRootItemA11yValue(with: 1), ofElementWithLabel: rootItemA11YLabel, app)
        check(value: selectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)

        // WHEN

        itemToSelect = otherElements(withA11yIdentifier: secondItemA11YIdentifier, app).firstMatch
        itemToSelect.tap()

        // THEN

        check(value: pickerRootItemA11yValue(with: 2), ofElementWithLabel: rootItemA11YLabel, app)
        check(value: selectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: selectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)

        // WHEN

        itemToSelect = otherElements(withA11yIdentifier: thirdItemA11YIdentifier, app).firstMatch
        itemToSelect.tap()

        // THEN

        check(value: pickerRootItemA11yValue(with: 3), ofElementWithLabel: rootItemA11YLabel, app)
        check(value: selectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: selectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: selectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)

        // WHEN

        itemToSelect = otherElements(withA11yIdentifier: pickerRootItemA11yIdentifier(with: 3), app).firstMatch
        itemToSelect.tap()

        // THEN

        check(value: pickerRootItemA11yValue(with: 0), ofElementWithLabel: rootItemA11YLabel, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)
    }

    // MARK: - Helpers

    private func pickerRootItemA11yValue(with param: Int) -> String {
        ", " + (wording(for: "core_checkboxPicker_description_a11y") <- param)
    }

    private func pickerRootItemA11yIdentifier(with param: Int) -> String {
        "\(wording(for: "app_components_checkboxPicker_root")) (\(param))"
    }
}

// swiftlint:enable required_deinit
