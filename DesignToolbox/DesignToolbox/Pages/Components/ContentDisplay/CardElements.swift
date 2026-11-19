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

struct CardElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            CardElement(),
            ActionCardElement(),
        ]

        name = "app_components_card_card_tech".localized()
        illustration = AnyView(OudsCardIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_card_card_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

// MARK: - Card Illustration

struct OudsCardIllustration: View {

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .center, spacing: theme.spaces.fixedNone) {
            OUDSCard(style: .elevated(useDefaultBackground: false)) {
                Rectangle().fill(theme.colors.surfaceStatusInfoMuted.color(for: colorScheme))
            }
        }
        .padding(.all, 50)
    }
}
