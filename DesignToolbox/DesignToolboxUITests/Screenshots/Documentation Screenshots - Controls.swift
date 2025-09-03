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
// swiftlint:disable type_name

/// Walks across the application and make screenshots for documentation.
///
/// ## How to make screenshots
///
/// - Just select the *DesignToolboxUITests* scheme and the device you want.
/// - Ensure you already installed the app in debug mode and select the theme you want
/// - The screenshots won't override the color scheme, so yo should make two runs of the tests: one in light mode, one in dark mode.
/// - Run the UI tests
///
/// Maybe in the future we should move to [Fastlane snapshot](https://docs.fastlane.tools/actions/snapshot/), however running Fastlane
/// and launching from CLI the simulators is slow and heavy.
///
/// ## Which screenshots to do
///
/// The following screenshots must be done for:
/// - checkbox (all themes, in one image light and dark declinations)
/// - checkbox item (all themes, in one image light and dark declinations)
/// - checkbox picker (Orange theme, in one image light and dark declinations, 2nd option selected in lgiht, all on dark)
/// - radio (all themes, in one image light and dark declinations)
/// - radio item (all themes, in one image light and dark declinations)
/// - radio picker (Orange theme, in one image light and dark declinations) (1st option selected in light, 2nd in dark)
/// - switch (all themes, in one image light and dark declinations)
/// - switch item (all themes, in one image light and dark declinations)
/// - filter chip  (all themes, in one image light and dark declinations)
/// - suggestion chip  (all themes, in one image light and dark declinations)
/// - chip picker (Orange theme, in one image light and dark declinations) (1st and 2nd options selected both in light and dark, text only, multiple)
///
/// ## How to find screenshots
///
/// Screenshots can be found in tests attachements.
/// You can pick them in tests reports.
/// Then get the screenshots in attachments ; base name of the files are the ones defined in the tests.
final class 📄_ControlsDocumentationScreenshots: AppTestCase {

    // MARK: - Checkboxes

    @MainActor
    func testMakeScreenshotsForDocumentation_Checkbox() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkbox_label", app)
        waitForButtonToAppear(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkbox_label", app)

        takeScreenshot(named: "component_checkbox_",
                       ACDC.checkboxX,
                       ACDC.checkboxY,
                       ACDC.checkboxWidth,
                       ACDC.checkboxHeight,
                       app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_CheckboxItem() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkbox_label", app)
        waitForButtonToAppear(withWording: "app_components_checkbox_checkboxItem_label", app)
        tapButton(withWording: "app_components_checkbox_checkboxItem_label", app)

        takeScreenshot(named: "component_checkboxItem_",
                       ACDC.checkboxItemX,
                       ACDC.checkboxItemY,
                       ACDC.checkboxItemWidth,
                       ACDC.checkboxItemHeight,
                       app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_CheckboxPicker() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkbox_label", app)
        waitForButtonToAppear(withWording: "app_components_checkboxPicker_label", app)
        tapButton(withWording: "app_components_checkboxPicker_label", app)

        tapImage(withName: "dog.fill", indexed: 0, app)

        tapImage(withName: "waterbottle.fill", indexed: 1, app)
        tapImage(withName: "dog.fill", indexed: 1, app)
        tapImage(withName: "flame", indexed: 1, app)

        wait(2) // Let press animation ends

        takeScreenshot(named: "component_checkboxPicker_",
                       ACDC.checkboxPickerX,
                       ACDC.checkboxPickerY,
                       ACDC.checkboxPickerWidth,
                       ACDC.checkboxPickerHeight,
                       app)
    }

    // MARK: - Radios

    @MainActor
    func testMakeScreenshotsForDocumentation_Radio() {
        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_radioButton_label", app)
        tapButton(withWording: "app_components_radioButton_label", app)
        waitForButtonToAppear(withWording: "app_components_radioButton_label", app)
        tapButton(withWording: "app_components_radioButton_label", app)

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)

        wait(2)

        takeScreenshot(named: "component_radio_",
                       ACDC.radioX,
                       ACDC.radioY,
                       ACDC.radioWidth,
                       ACDC.radioHeight,
                       app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_RadioItem() {
        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_radioButton_label", app)
        tapButton(withWording: "app_components_radioButton_label", app)
        waitForButtonToAppear(withWording: "app_components_radioButton_radioButtonItem_label", app)
        tapButton(withWording: "app_components_radioButton_radioButtonItem_label", app)

        takeScreenshot(named: "component_radioItem_",
                       ACDC.radioItemX,
                       ACDC.radioItemY,
                       ACDC.radioItemWidth,
                       ACDC.radioItemHeight,
                       app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_RadioPicker() {
        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_radioButton_label", app)
        tapButton(withWording: "app_components_radioButton_label", app)
        waitForButtonToAppear(withWording: "app_components_radioPicker_label", app)
        tapButton(withWording: "app_components_radioPicker_label", app)

        tapImage(withName: "dog.fill", indexed: 0, app)

        tapImage(withName: "waterbottle.fill", indexed: 1, app)
        tapImage(withName: "dog.fill", indexed: 1, app)
        tapImage(withName: "flame", indexed: 1, app)

        wait(2) // Let press animation ends

        takeScreenshot(named: "component_radioPicker_",
                       ACDC.radioPickerX,
                       ACDC.radioPickerY,
                       ACDC.radioPickerWidth,
                       ACDC.radioPickerHeight,
                       app)
    }

    // MARK: - Switch

    @MainActor
    func testMakeScreenshotsForDocumentation_Switch() {
        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_switch_label", app)
        tapButton(withWording: "app_components_switch_label", app)
        waitForButtonToAppear(withWording: "app_components_switch_label", app)
        tapButton(withWording: "app_components_switch_label", app)

        takeScreenshot(named: "component_switch_",
                       ACDC.switchX,
                       ACDC.switchY,
                       ACDC.switchWidth,
                       ACDC.switchHeight,
                       app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_SwitchItem() {
        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_switch_label", app)
        tapButton(withWording: "app_components_switch_label", app)
        waitForButtonToAppear(withWording: "app_components_switch_switchItem_label", app)
        tapButton(withWording: "app_components_switch_switchItem_label", app)

        takeScreenshot(named: "component_switchItem_",
                       ACDC.switchItemX,
                       ACDC.switchItemY,
                       ACDC.switchItemWidth,
                       ACDC.switchItemHeight,
                       app)
    }

    // MARK: - Chips

    @MainActor
    func testMakeScreenshotsForDocumentation_SuggestionChip() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_chip_label", app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_chip_label", app)
        tapButton(withWording: "app_components_chip_label", app)
        waitForButtonToAppear(withWording: "app_components_chip_suggestionChip_label", app)
        tapButton(withWording: "app_components_chip_suggestionChip_label", app)

        tapButton(withWording: "Text + icon", app)

        wait(2)

        takeScreenshot(named: "component_suggestionChip_",
                       ACDC.suggestionChipX,
                       ACDC.suggestionChipY,
                       ACDC.suggestionChipWidth,
                       ACDC.suggestionChipHeight,
                       app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_FilterChip() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_chip_label", app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_chip_label", app)
        tapButton(withWording: "app_components_chip_label", app)
        waitForButtonToAppear(withWording: "app_components_chip_filterChip_label", app)
        tapButton(withWording: "app_components_chip_filterChip_label", app)

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        tapButton(withWording: "Text + icon", app)

        wait(2)

        takeScreenshot(named: "component_filterChip_",
                       ACDC.filterChipX,
                       ACDC.filterChipY,
                       ACDC.filterChipWidth,
                       ACDC.filterChipHeight,
                       app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_ChipPicker() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_chip_label", app)
        swipeFromDownToUp(app)
        tapButton(withWording: "app_components_chip_label", app)
        waitForButtonToAppear(withWording: "app_components_chip_chipPicker_label", app)
        tapButton(withWording: "app_components_chip_chipPicker_label", app)

        tapButton(withWording: "Multiple", app)
        tapImage(withName: "dog.fill", app)
        tapButton(withWording: "Text only", app)

        wait(2)

        takeScreenshot(named: "component_chipPicker_",
                       ACDC.chipPickerX,
                       ACDC.chipPickerY,
                       ACDC.chipPickerWidth,
                       ACDC.chipPickerHeight,
                       app)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
