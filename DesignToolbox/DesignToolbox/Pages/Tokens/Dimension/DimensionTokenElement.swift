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

import SwiftUI

struct DimensionTokenElement: DesignToolboxElement {

    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            SizeTokenElement(),
            SpaceTokenElement(),
        ]

        name = "app_tokens_dimension_label".localized()
        illustration = AnyView(Image(decorative: "ic_dimension").renderingMode(.template))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_tokens_dimension_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants.sorted(by: { $0.name < $1.name })))))
    }
}
