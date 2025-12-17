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

/// To make UI tests on `OUDSRadioItem` to test some a11y configurations.
final class RadioItemUITests: AppTestCase {

    /// Check the a11y configurations of the radio item depending to its state
    @MainActor func testRadioItemA11yConfigurations() throws {

        // 'Radio button. Selected. . '
        let selectedRadioA11YValue = wording(for: "core_radio_trait_a11y") + ". " + wording(for: "core_common_selected_a11y") + ". . "
        // 'Radio button. Unselected. . '
        let unselectedRadioA11YValue = wording(for: "core_radio_trait_a11y") + ". " + wording(for: "core_common_unselected_a11y") + ". . "

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        tapButton(withWording: "app_components_radioButton_label", app)
        tapButton(withWording: "Radio button item", app)

        let radioItem = otherElements(withA11yIdentifier: A11YIdentifiers.componentRadioItem, app).firstMatch
        XCTAssertTrue(radioItem.exists)
        check(value: selectedRadioA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentRadioItem, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: unselectedRadioA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentRadioItem, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: selectedRadioA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentRadioItem, app)
    }

    // TODO: Test hints and labels
}

// swiftlint:enable required_deinit
