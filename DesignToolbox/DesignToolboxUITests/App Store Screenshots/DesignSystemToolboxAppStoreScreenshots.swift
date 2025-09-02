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

/// Walks across the application and make screenshots for the App Store.
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
/// The following screenshots must be done:
/// - button page
/// - colors page (dark color scheme, Orange theme)
/// - colors page (light color scheme, Orange theme)
/// - components list page, aligned to top (light color scheme, Orange theme)
/// - switch item page (light color scheme, Orange theme)
/// - tokens list page item page, aligned to top (light color scheme, Orange theme)
///
/// ## How to find screenshots
///
/// Screenshots can be found in tests attachements.
/// You can pick them in tests reports.
/// Then get the screenshots in attachments ; base name of the files are the ones defined in the tests.
///
/// ## App Store devices configurations to use
///
/// The expected devices to use for App Store submissions are:
/// - iPad Pro 2nd generation / 12.9-inch
/// - iPad Pro 3rd generation (2018) / 12.9-inch
/// - iPhone 5.5-inch devices (iPhone 6/7/8 Plus) 1242 x 2208
/// - iPhone 6.5-inch (iPhone XS Max) 1242 x 2688
///
final class DesignSystemToolboxAppStoreScreenshots: AppTestCase {

    // MARK: - Pages

    @MainActor
    func testMakeScreenshotsForAppStore_Tokens() throws {
        let app = launchApp()

        takeScreenshot(named: "Tokens", app)
    }

    @MainActor
    func testMakeScreenshotsForAppStore_Components() throws {
        let app = launchApp()
        goToComponentsSheet(app)

        takeScreenshot(named: "Components", app)
    }

    // MARK: - Tokens

    @MainActor
    func testMakeScreenshotsForAppStore_Tokens_Colors() throws {
        let app = launchApp()
        waitForButtonToAppear(withWording: "app_tokens_color_label", app)
        tapButton(withWording: "app_tokens_color_label", app)

        takeScreenshot(named: "Colors", app)
    }

    // MARK: - Components

    @MainActor
    func testMakeScreenshotsForAppStore_Button() throws {
        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_button_label", app)

        takeScreenshot(named: "Component - Button", app)
    }

    @MainActor
    func testMakeScreenshotsForAppStore_SwitchItem() throws {
        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_switch_label", app)
        tapButton(withWording: "app_components_switch_label", app)

        takeScreenshot(named: "Component - Switch item", app)
    }

    // MARK: - Helpers

    @MainActor
    private func takeScreenshot(named name: String, _ app: XCUIApplication) {
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
        print("📸 Screenshot of application done, put in attachments and avaialble in reports: '\(name)'")
    }
}

// swiftlint:enable required_deinit
