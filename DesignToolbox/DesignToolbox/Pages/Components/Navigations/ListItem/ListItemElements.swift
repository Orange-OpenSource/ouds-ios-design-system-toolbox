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

struct ListItemElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            StaticListItemElement(),
            NavigationListItemElement(),
        ]
        name = "app_components_listItem_tech".localized()
        illustration = AnyView(ListItemIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_listItem_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

struct ListItemIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            let data = OUDSListItemData(label: "Label",
                                        description: "A description of the item to show in the list item view.")
            OUDSStaticListItem(data: data)
                .oudsListItemStyle(divider: false, background: true)
        }
    }
}
