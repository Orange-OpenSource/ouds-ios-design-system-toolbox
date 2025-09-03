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
/// - badge (all themes, in one image light and dark declinations, large, accent, +99)
/// - tag (all themes, in one image light and dark declinations, text and bullet, emphasized, accent, rounded)
///
/// ## How to find screenshots
///
/// Screenshots can be found in tests attachements.
/// You can pick them in tests reports.
/// Then get the screenshots in attachments ; base name of the files are the ones defined in the tests.
final class IndicatorsDocumentationScreenshots: AppTestCase {

    // MARK: - Badge

    @MainActor
    func testMakeScreenshotsForDocumentation_Badge() {
        let app = launchApp()
        goToComponentsSheet(app)
        waitForButtonToAppear(withWording: "app_components_badge_label", app)
        tapButton(withWording: "app_components_badge_label", app)

        tapButton(withWording: "Large", app)
        tapButton(withWording: "Accent", app)
        otherElements(write: "999", in: A11YIdentifiers.configurationTextField, app)
        swipeFromUpToDown(app) // Keyboard does not close, so swipe to get component to capture

        wait(2)
        takeScreenshot(named: "component_badge_",
                       ACDC.tagX,
                       ACDC.badgeY,
                       ACDC.tagWidth,
                       ACDC.badgeHeight,
                       app)
    }

    // MARK: - Tag

    @MainActor
    func testMakeScreenshotsForDocumentation_Tag() {
        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        waitForButtonToAppear(withWording: "app_components_tag_label", app)
        tapButton(withWording: "app_components_tag_label", app)

        tapButton(withWording: "Text + bullet", app)
        tapButton(withWording: "Accent", app)

        takeScreenshot(named: "component_tag_",
                       ACDC.tagX,
                       ACDC.tagY,
                       ACDC.tagWidth,
                       ACDC.tagHeight,
                       app)
    }
}

// swiftlint:enable required_deinit
