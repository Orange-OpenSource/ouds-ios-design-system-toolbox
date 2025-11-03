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

extension AppTestCase {

    /// Takes a screenshot form the current device or simulator in use and use the given `name`
    /// fir the screenshot file in attachement
    @MainActor func takeScreenshot(named name: String, _ app: XCUIApplication) {
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
        print("📸 Screenshot of application done, put in attachments and available in reports: '\(name)'")
    }

    /// Takes a screenshot form the current device or simulator in use and use the given `name`
    /// fir the screenshot file in attachement. Crops the result image using given 2D coordinates and dimensions.
    @MainActor func takeScreenshot(named name: String, _ x: Int, _ y: Int, _ width: Int, _ height: Int, _ app: XCUIApplication) {
        takeScreenshot(named: name, cropped: CGRect(x: x, y: y, width: width, height: height), app)
    }

    /// Takes a screenshot form the current device or simulator in use and use the given `name`
    /// fir the screenshot file in attachement. Crops the result image using given a rectangle.
    @MainActor func takeScreenshot(named name: String, cropped rect: CGRect, _ app: XCUIApplication) {
        let fullScreenshot = app.windows.firstMatch.screenshot()

        guard let image = UIImage(data: fullScreenshot.pngRepresentation) else {
            print("❌ Impossible to convert screenshot to UIImage")
            return
        }

        guard let cgImage = image.cgImage?.cropping(to: rect) else {
            print("❌ Impossible to crop the image")
            return
        }

        let croppedImage = UIImage(cgImage: cgImage)
        let attachment = XCTAttachment(image: croppedImage)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
        print("📸 Cropped screenshot of application done, put in attachments and available in reports: '\(name)'")
    }
}
