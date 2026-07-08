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

// MARK: - Navigation List Item Element

struct NavigationListItemElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_listItem_navigation_tech".localized()
        illustration = AnyView(NavigationListItemIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_listItem_navigation_description", // TODO: #265 - Display version
            demoScreen: AnyView(NavigationListItemPage())))
    }
}

// MARK: - Navigation List Item Illustration

struct NavigationListItemIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            let data = OUDSListItemData(label: "Label",
                                        description: "A description of the item to show in the list item view.")
            OUDSNavigationListItem(data: data, indicatorType: .next)
                .oudsListItemStandardStyle(.backgroundOnInteractionOnly(withDivider: false))
        }
    }
}
