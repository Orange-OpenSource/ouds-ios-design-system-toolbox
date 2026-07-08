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

// MARK: - Navigation List Item Page

struct NavigationListItemPage: View {

    @StateObject private var configurationModel = NavigationListItemConfigurationModel()

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            NavigationListItemDemo(configurationModel: configurationModel)
        } configurationView: {
            NavigationListItemConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Navigation List Item Demo

private struct NavigationListItemDemo: View {

    @ObservedObject var configurationModel: NavigationListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: rowGap) {
            ForEach(Array(configurationModel.dataItems.enumerated()), id: \.offset) { _, data in
                if configurationModel.hasSlot {
                    OUDSNavigationListItem(data: data,
                                           slot: configurationModel.slot(),
                                           indicatorType: configurationModel.indicatorType,
                                           leading: configurationModel.leading(for: theme),
                                           trailing: configurationModel.trailing(for: theme)) {}
                } else {
                    OUDSNavigationListItem(data: data,
                                           indicatorType: configurationModel.indicatorType,
                                           leading: configurationModel.leading(for: theme),
                                           trailing: configurationModel.trailing(for: theme)) {}
                }
            }
            .oudsListItemStyle(configurationModel.contentStyle)
            .oudsListItemContainerAlignment(configurationModel.containersAlignment)
            .oudsListItemRoundedMedia(configurationModel.roundedMedia)
            .oudsListItemSize(configurationModel.itemSize)
            .disabled(!configurationModel.enabled)
        }
    }

    private var rowGap: CGFloat {
        configurationModel.type == .card ? theme.spaces.fixedLarge : theme.spaces.fixedNone
    }
}
