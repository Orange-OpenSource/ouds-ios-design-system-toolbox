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

struct ListItemNavigationElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init(type: ListItemConfigurationModel.ListType) {
        switch type {
            case .item:
                name = "app_components_listItem_item_tech".localized()
            case .card:
                name = "app_components_listItem_card_tech".localized()
        }

        illustration = AnyView(ListItemNavigationIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "",
            demoScreen: AnyView(ListItemNavigationGroupedPage(type: type))))
    }
}

struct ListItemNavigationIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            let data = OUDSListItemSizeSmallData(label: "Label",
                                                 description: "A description of the item to show in the list item view and its accessibility label and VoiceOver label if not provided.")
            OUDSListItemNavigation(data: data, affordanceType: .next)
        }
    }
}
