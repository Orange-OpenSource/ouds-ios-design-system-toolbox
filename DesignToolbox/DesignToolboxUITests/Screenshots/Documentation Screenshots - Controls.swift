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
/// - chip picker (Orange theme, in one image light and dark declinations) (1st and 2nd options selected both in light and dark)
///
/// ## How to find screenshots
///
/// Screenshots can be found in tests attachements.
/// You can pick them in tests reports.
/// Then get the screenshots in attachments ; base name of the files are the ones defined in the tests.
///
/// ## Device for test
///
/// Use the iPhone you want, in english mode.
/// Configuration with current values is;
/// - iPhone 12 Pro
/// - portrait mode
/// - english app
/// - no increased text
///
final class ControlsDocumentationScreenshots: AppTestCase {

    // MARK: Checkboxes

    @MainActor
    func testMakeScreenshotsForDocumentation_Checkbox() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkbox_label", app)
        waitForButtonToAppear(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkbox_label", app)

        takeScreenshot(named: "component_checkbox", AppTestCase.screenStartX, 480, AppTestCase.deviceWidth, 560, app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_CheckboxItem() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkbox_label", app)
        waitForButtonToAppear(withWording: "app_components_checkbox_checkboxItem_label", app)
        tapButton(withWording: "app_components_checkbox_checkboxItem_label", app)

        takeScreenshot(named: "component_checkboxitem", AppTestCase.screenStartX, 480, AppTestCase.deviceWidth, 560, app)
    }

    @MainActor
    func testMakeScreenshotsForDocumentation_CheckboxPicker() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_checkbox_label", app)
        tapButton(withWording: "app_components_checkbox_label", app)
        waitForButtonToAppear(withWording: "app_components_checkboxPicker_label", app)
        tapButton(withWording: "app_components_checkboxPicker_label", app)

        takeScreenshot(named: "component_checkboxpicker", AppTestCase.screenStartX, 480, AppTestCase.deviceWidth, 560, app)
    }
}

// swiftlint:enable required_deinit
