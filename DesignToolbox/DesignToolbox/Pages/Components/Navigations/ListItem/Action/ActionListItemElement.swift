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

// MARK: - Action List Item Element

struct ActionListItemElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView
    let status: DesignToolboxComponentStatus = .draft

    init() {
        name = "app_components_listItem_action_tech".localized()
        illustration = AnyView(ActionListItemIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_listItem_action_description",
            version: "0.0.0 (draft)",
            status: status,
            demoScreen: AnyView(ActionListItemPage())))
    }
}

// MARK: - Action List Item Illustration

struct ActionListItemIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            let data = OUDSListItemData(label: .textual("Label"),
                                        description: "A description of the item to show in the list item view.")
            OUDSActionListItem(data: data) {}
                .oudsListItemStyle(divider: false, background: false)
        }
    }
}
