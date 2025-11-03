//
// Software Name: OUDSThemesContract iOS
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

/// To make UI tests on some radio picker from OUDSThemesContract.
/// Tests the accessibility identifier,s labels or values of the items depending to their states and user actions.
final class RadioPickerUITests: AppTestCase {

    /// Given the radio picker of the demo app,
    /// selects the items and checks if the others are unselected.
    @MainActor func testRadioPickerA11YSelection() throws {

        let selectedA11Yvalue = "core_common_selected_a11y"
        let unselectedA11Yvalue = "core_common_unselected_a11y"

        let firstItemA11YIdentifier = "Virgin Holy Lava"
        let secondItemA11YIdentifier = "IPA beer"
        let thirdItemA11YIdentifier = "Mineral water"

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        tapButton(withWording: "app_components_radioButton_label", app)
        tapButton(withWording: "app_components_radioPicker_label", app)

        check(value: selectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)

        // WHEN

        var itemToSelect = otherElements(withA11yIdentifier: secondItemA11YIdentifier, app).firstMatch
        itemToSelect.tap()

        // THEN

        check(value: unselectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: selectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)

        // WHEN

        itemToSelect = otherElements(withA11yIdentifier: thirdItemA11YIdentifier, app).firstMatch
        itemToSelect.tap()

        // THEN

        check(value: unselectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: selectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)

        // WHEN

        itemToSelect = otherElements(withA11yIdentifier: firstItemA11YIdentifier, app).firstMatch
        itemToSelect.tap()

        // THEN

        check(value: selectedA11Yvalue, ofElementWithIdentifier: firstItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: secondItemA11YIdentifier, app)
        check(value: unselectedA11Yvalue, ofElementWithIdentifier: thirdItemA11YIdentifier, app)
    }
}

// swiftlint:enable required_deinit
