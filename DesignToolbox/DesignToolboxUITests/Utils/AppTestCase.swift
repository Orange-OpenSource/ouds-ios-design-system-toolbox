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

import OUDSComponents
import XCTest

// swiftlint:disable nslocalizedstring_key
// swiftlint:disable required_deinit
// swiftlint:disable empty_xctest_method

/// Provides utility functions and tools for tests like actions on views and components
open class AppTestCase: XCTestCase {

    // MARK: - l10n

    private let testBundle = Bundle(for: AppTestCase.self)

    func wording(for key: String) -> String {
        let wording = key.localized(bundle: testBundle)
        if wording != key {
            return wording
        } else { // If wording and key are the same, possible to have a key and not a wording, check the other bundle
            return key.localized(bundle: Bundle.OUDSComponents)
        }
    }

    // MARK: - Tuning

    override open func setUpWithError() throws {
        continueAfterFailure = false
    }

    override open func tearDownWithError() throws {}

    // MARK: - Application

    @MainActor
    func launchApp() -> XCUIApplication {
        let app = XCUIApplication()
        app.launch()
        return app
    }

    // MARK: - Button

    /// Tap on a UI element seen as a button (cf *Accessibility Inspector* with the given string as  wording key
    @MainActor func tapButton(withWording key: String, _ app: XCUIApplication) {
        let wording = wording(for: key)
        let buttonToTap = app.buttons[wording]
        XCTAssertTrue(buttonToTap.exists, "The button with wording key '\(key)' (value '\(wording)') does not exist")
        buttonToTap.tap()
    }

    // MARK: - Texts

    @MainActor func assertStaticTextExists(_ content: String, _ app: XCUIApplication) {
        let text = app.staticTexts[content]
        XCTAssertTrue(text.exists, "The expected text content '\(content)' does not exist")
    }

    // MARK: - Images

    /// Tap on a UI element seen as a image with the given name
    @MainActor func tapImage(withName name: String, _ app: XCUIApplication) {
        let imageToTap = app.images[name].firstMatch
        XCTAssertTrue(imageToTap.exists, "The image with name '\(name)' does not exist")
        imageToTap.tap()
    }

    // MARK: - Other elements

    // swiftlint:disable empty_count
    /// Returns buttons with the given accessiiblity identifier
    @MainActor func buttons(withA11yIdentifier id: String, _ app: XCUIApplication) -> XCUIElementQuery {
        let elements = app.buttons.matching(identifier: id)
        XCTAssertTrue(elements.count > 0, "No matching button with accessibility identifier '\(id)'")
        return elements
    }

    /// Returns elements with the given accessiiblity identifier
    @MainActor func otherElements(withA11yIdentifier id: String, _ app: XCUIApplication) -> XCUIElementQuery {
        let elements = app.otherElements.matching(identifier: id)
        XCTAssertTrue(elements.count > 0, "No matching element with accessibility identifier '\(id)'")
        return elements
    }

    // swiftlint:enable empty_count

    /// Returns element with the given accessiiblity label
    @MainActor func otherElement(withA11yLabel label: String, _ app: XCUIApplication) -> XCUIElement {
        let element = app.otherElements[label]
        XCTAssertTrue(element.exists, "No matching element with accessibility label '\(label)'")
        return element
    }

    // MARK: - Navigations helpers

    /// Opens the page of the components, i.e. tap on the 2nd of the tab bar
    @MainActor func goToComponentsSheet(_ app: XCUIApplication) {
        app.tabBars.buttons.element(boundBy: 1).tap()
    }

    @MainActor
    func swipeFromDownToUp(_ app: XCUIApplication) {
        app.swipeUp()
    }

    // MARK: - Helpers

    /// Checks if the first element with this a11y identifier exists and has the wording with the given value as key
    @MainActor func check(value: String, ofElementWithIdentifier identifier: String, _ app: XCUIApplication) {
        let element = otherElements(withA11yIdentifier: identifier, app).firstMatch
        let expectedValue = wording(for: value)
        if element.exists {
            if let currentValue = element.value as? String {
                XCTAssertTrue(currentValue == expectedValue,
                              "The expected accessible value for the element is '\(expectedValue)' and not '\(currentValue)'")
            } else {
                XCTFail("The value to comapre does not exist!")
            }
        } else {
            XCTFail("The element does not exists or the demo has been changed since!")
        }
    }

    /// Checks if the first element with this a11y label exists and has the wording with the given value as key
    @MainActor func check(value: String, ofElementWithLabel label: String, _ app: XCUIApplication) {
        let element = otherElement(withA11yLabel: label, app).firstMatch
        if element.exists, let currentValue = element.value as? String {
            let expectedValue = wording(for: value)
            XCTAssertTrue(currentValue == expectedValue,
                          "The expected accessible value for the element is '\(expectedValue)' and not '\(currentValue)'")
        } else {
            XCTFail("The element is not the expected one or does not exist or has no value, or the demo has been changed since!")
        }
    }

    /// Checks fior the given element the value and a11y hint and a11y label
    @MainActor func assert(element: XCUIElement, value: String? = nil, a11yHint: String? = nil) {
        // Element must exist
        XCTAssertTrue(element.exists)

        // If a value is under test, check
        if let value {
            if let elementValue = element.value, let elementValueAsString = elementValue as? String {
                XCTAssertTrue(value == elementValueAsString, "'\(elementValueAsString)' is not equal to '\(value)'")
            } else {
                XCTFail("Element value is not the expected one")
            }
        } else {
            if let elementValue = element.value, let elementValueAsString = elementValue as? String {
                XCTAssertTrue(elementValueAsString.isEmpty, "'\(elementValueAsString)' is not empty value")
            } else {
                XCTFail("Element value is not in the expected state (nil or not empty or not convertible to String")
            }
        }

        // If an A11Y hint is under test, check
        if let a11yHint {
            if let elementA11YHint = element.accessibilityHint {
                XCTAssertTrue(a11yHint == elementA11YHint, "'\(elementA11YHint)' is not equal to '\(a11yHint)'")
            } else {
                XCTFail("Element a11y hint is not defined")
            }
        } else {
            XCTAssertNil(element.accessibilityHint)
        }
    }
}

// MARK: - Extension of String

extension String {

    /// Returns the localized result string using `self` as key.
    /// - Parameter bundle: The `Bundle` from which the wording must be loaded
    /// - Returns String: The conversion of `self` as `NSLocalizedString`
    func localized(bundle: Bundle) -> String {
        NSLocalizedString(self, bundle: bundle, comment: "")
    }
}

// swiftlint:enable nslocalizedstring_key
// swiftlint:enable required_deinit
// swiftlint:enable empty_xctest_method
