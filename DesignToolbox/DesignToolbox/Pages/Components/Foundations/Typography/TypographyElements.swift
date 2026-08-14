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

struct TypographyElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            DisplayElement(),
            HeadingElement(),
            BodyElement(),
            LabelElement(),
            CodeElement(),
        ]

        name = "app_components_typography_tech".localized()
        illustration = AnyView(TypographyIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_typography_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

struct TypographyIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        if theme.hasTypographyHeadingLargeMarker {
            OUDSHeading(text: "Welcome here!", size: .large, hasMarker: theme.hasTypographyHeadingLargeMarker)
        } else {
            OUDSHeading(text: "Welcome here!", coloredText: "here!")
        }
    }
}
