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

import OUDS
import OUDSComponents
import OUDSThemesOrange
import OUDSTokensRaw
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest


// MARK: - Test Cases

// swiftlint:disable required_deinit
/// Tests the UI rendering of the `OUDSTextInput` for each parameter
open class TextInputUITestsTestCase: XCTestCase {

    /// This function tests all Text input configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all combinations of configuration.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTextInputs(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {

        var model = TextInputConfigurationModel()
        for rounded in [true, false] {
            for style in OUDSTextInput.Style.allCases {
                for status in OUDSTextInput.Status.allCases {
                    for layout in OUDSTextInput.Layout.allCases {
                        for helperText in ["", model.defaultHelperText] {
                            for leadingIcon in [true, false] {
                                for trailingAction in [true, false] {
                                    for placeHoldedText in ["", model.defaultPlaceHolderText] {
                                        for prefixText in ["", model.defaultPrefix] {
                                            for suffixText in ["", model.defaultSuffix] {
                                                for enteredText in ["", model.defaultlabel] {
                                                    for helperLinkText in ["", model.defaultHelperLinkText] {

                                                        model.rounded = rounded
                                                        model.style = style
                                                        model.status = status
                                                        model.layout = layout
                                                        model.helperText = helperText
                                                        model.leadingIcon = leadingIcon
                                                        model.trailingAction = trailingAction
                                                        model.placeHolderText = placeHoldedText
                                                        model.prefixText = prefixText
                                                        model.suffixText = suffixText
                                                        model.text = enteredText
                                                        model.helperLinkText = helperLinkText

                                                        if canDoTest(model: model) {
                                                            testTextInput(theme: theme, interfaceStyle: interfaceStyle, model: model)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    // Defines if test can be done because some configurations are not allowed:
    // - suffix and prefix with empty placeholder
    // - loading status with empty text
    func canDoTest(model: TextInputConfigurationModel) -> Bool {

        // Don't test suffix and prefix if placeholder is empty
        if model.placeHolderText.isEmpty {
            if !model.suffixText.isEmpty || !model.suffixText.isEmpty {
                return false
            }
        }

        // if text isEmpty
        if model.text.isEmpty {
            //  loading status not allowed if text is not filled
            if model.status == .loading {
                return false
            }


        }

        return true
    }

    /// This function tests `OUDSTextInput` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor func testTextInput(theme: OUDSTheme,
                              interfaceStyle: UIUserInterfaceStyle,
                              model: TextInputConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            TextInputDemo(configurationModel: model)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<layoutPattern><stylePattern><statusPattern><sizePattern><roundedPattern><helperTextPattern>
        // <leadingIconPattern><trailingAction><placeholderPattern><prefixPattern><suffixPattern>
        let testName = "testTextInput_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let roundedPettern = model.rounded ? ".rounded" : ""
        let layoutPattern = model.layout.technicalDescription.localized()
        let stylePattern = model.style.technicalDescription.localized()
        let statusPattern = model.status.technicalDescription
        let helperTextPattern = model.helperText.isEmpty ? "" : ".helperText"
        let leadingIconPattern = model.leadingIcon ? ".leadingIcon" : ""
        let trailingActionPattern = model.trailingAction ? ".trailingAction" : ""
        let placeholderPattern = model.placeHolderText.isEmpty ? "" : ".placeholder"
        let prefixPattern = model.prefixText.isEmpty ? "" :  "_prefix"
        let suffixPattern = model.suffixText.isEmpty ? "" : "_sufffix"
        let enteredTextPattern = model.text.isEmpty ? "" : ".enteredText"
        let helperLinkPattern = model.helperLinkText.isEmpty ? "" : ".helperLink"

        let named = "\(roundedPettern)\(layoutPattern)\(stylePattern)\(statusPattern)\(helperTextPattern)\(leadingIconPattern)\(trailingActionPattern)\(placeholderPattern)\(prefixPattern)\(suffixPattern)\(enteredTextPattern)\(helperLinkPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: named,
                           testName: testName)
    }
}
// swiftlint:enable required_deinit
