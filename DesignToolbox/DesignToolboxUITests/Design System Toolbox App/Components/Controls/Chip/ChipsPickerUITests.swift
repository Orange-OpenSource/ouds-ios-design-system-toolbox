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

/// To make UI tests on some chips picker from OUDSThemesContract
/// Tests the accessibility identifiers, labels or values of the items depending to their states and user actions.
final class ChipsPickerUITests: AppTestCase {

    /// Test the selection of a unique item in the chips picker which can be undefined too
    @MainActor func testChipsPickerWithUniqueOptionalSelection() throws {

        let firstItemA11YIdentifier = "Virgin Holy Lava"
        let secondItemA11YIdentifier = "IPA beer"
        let thirdItemA11YIdentifier = "Mineral water"

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_chip_label", app)
        tapButton(withWording: "app_components_chip_chipPicker_label", app)
        tapButton(withWording: "SingleOrNone", app)

        // WHEN, THEN

        tapImage(withName: "flame", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)

        tapImage(withName: "flame", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)

        tapImage(withName: "dog.fill", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)

        tapImage(withName: "dog.fill", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)
    }

    /// Test the selection of a unique item in the chips picker
    @MainActor func testChipsPickerWithUniqueSelection() throws {

        let firstItemA11YIdentifier = "Virgin Holy Lava"
        let secondItemA11YIdentifier = "IPA beer"
        let thirdItemA11YIdentifier = "Mineral water"

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_chip_label", app)
        tapButton(withWording: "app_components_chip_chipPicker_label", app)

        // By default, first element is selected in the picker of the demo app
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)

        // WHEN, THEN

        tapImage(withName: "dog.fill", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)

        tapImage(withName: "flame", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)
    }

    /// Test the selection of a several items in the chips picker
    @MainActor func testChipsPickerWithSeveralSelections() throws {

        let firstItemA11YIdentifier = "Virgin Holy Lava"
        let secondItemA11YIdentifier = "IPA beer"
        let thirdItemA11YIdentifier = "Mineral water"

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_chip_label", app)
        tapButton(withWording: "app_components_chip_chipPicker_label", app)
        tapButton(withWording: "Multiple", app)

        // By default, first element is selected in the picker of the demo app
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)

        // WHEN, THEN

        tapImage(withName: "dog.fill", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)

        tapImage(withName: "flame", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: true, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)

        tapImage(withName: "dog.fill", app)
        isButton(withAccessibleIdentifier: firstItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: secondItemA11YIdentifier, selected: false, app)
        isButton(withAccessibleIdentifier: thirdItemA11YIdentifier, selected: false, app)
    }
}

// swiftlint:enable required_deinit
