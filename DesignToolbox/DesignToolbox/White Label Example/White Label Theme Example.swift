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

import OUDSSwiftUI
import SwiftUI

/*
 If you want to test your White Label configuration, feel free to change the tokens of colors or the fonts in this file.
 The White Label theme is already plugged in the themes selector; you jut need to change this very file by filling the functions and
 providers implementations.
 */

// MARK: - Theme settings

let kDesignToolboxWhiteLabelName = "WhiteLabel"

let kDesignToolboxWhiteLabelTuning = Tuning.Wireframe

// MARK: - Fonts

let kDesignToolboxWhiteLabelFontFamily = "SF Pro"

// swiftlint:disable identifier_name
nonisolated(unsafe) var designToolboxWhiteLabelFontAlreadyRegistered = false
// swiftlint:enable identifier_name

func registerDesignToolboxWhiteLabelFonts() {
    if !designToolboxWhiteLabelFontAlreadyRegistered {

        // For each weight available in the fonts file (TTF),
        // like light, regular, medium, etc.,
        // define the combination to apply with the PostScript identifier.
        //
        // For example, if the Winky Rough font is used, with TTF files to record,
        // and a PostScript identifier WinkyRough-Regular_Bold for a bold weight, call:
        //
        // registerFont(postScript: "WinkyRough-Regular_Bold", forCombination: PSFNMK(kDesignToolboxWhiteLabelFontFamily, Font.Weight.bold))
        //
        // You should read the setttings of the TTF files (e.g. with macOS Font Books) to known the PostScript identifiers.
        //
        // Then register the fonts file with TTF and update the flag to not do it again.

        let fonts = Bundle.main.urls(forResourcesWithExtension: "ttf", subdirectory: nil)
        fonts?.forEach {
            CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil)
        }

        designToolboxWhiteLabelFontAlreadyRegistered = true
    }
}

// MARK: - Colors (raw)

enum DesignToolboxWhiteLabelRawColors {

    // Define for example in an enum the raw values for your colors, in hexadedical format RRGGBBAA
    // For example:
    // static let concreteGrey = "#F0F0F0FF"
    // static let nearBlack = "#1C1C1EFF"
}

// MARK: - Colors (semantic)

final class DesignToolboxColorSemanticTokensProvider: WhiteLabelThemeColorSemanticTokensProvider {

    deinit {}

    // Override the tokens you want, with one value for ColorSemanticTokens
    // or up to two for MultipleColorSemanticToken (light and dark modes values)

    /*
     override open var bgPrimary: MultipleColorSemanticToken {
        MultipleColorSemanticToken(light: DesignToolboxWhiteLabelRawColors.concreteGrey, dark: DesignToolboxWhiteLabelRawColors.nearBlack)
     }
     */
}

nonisolated(unsafe) let kDesignToolboxWhiteLabelColors = DesignToolboxColorSemanticTokensProvider()

// MARK: - Theme instanciation

let kMyDesignToolboxWhiteLabelTheme = WhiteLabelTheme(colors: kDesignToolboxWhiteLabelColors,
                                                      name: kDesignToolboxWhiteLabelName,
                                                      fontFamily: kDesignToolboxWhiteLabelFontFamily,
                                                      tuning: kDesignToolboxWhiteLabelTuning)
