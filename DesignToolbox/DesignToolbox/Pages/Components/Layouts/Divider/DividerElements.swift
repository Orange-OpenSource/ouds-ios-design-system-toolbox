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
import SwiftUI

struct DividerElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            DividerElement(orientation: .horizontal),
            DividerElement(orientation: .vertical),
        ]

        name = "app_components_divider_label".localized()
        illustration = AnyView(DividerIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_divider_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct DividerIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack {
            Spacer()
            OUDSHorizontalDivider(color: .default)
            Spacer()
        }
        .padding(.horizontal, theme.spaces.spaceFixedMd)
    }
}
