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

// MARK: - Static List Item Page

struct StaticListItemPage: View {

    @StateObject private var configurationModel = ListItemConfigurationModel()

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            StaticListItemDemo(configurationModel: configurationModel)
        } configurationView: {
            ListItemConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Static List Item Demo

private struct StaticListItemDemo: View {

    @ObservedObject private var configurationModel: ListItemConfigurationModel
    @ObservedObject private var textsModel: ListItemTextsConfigurationModel
    @ObservedObject private var leadingModel: ListItemLeadingConfigurationModel
    @ObservedObject private var trailingModel: ListItemTrailingConfigurationModel

    @Environment(\.theme) private var theme

    init(configurationModel: ListItemConfigurationModel) {
        self.configurationModel = configurationModel
        textsModel = configurationModel.textsModel
        leadingModel = configurationModel.leadingModel
        trailingModel = configurationModel.trailingModel
    }

    var body: some View {
        VStack(spacing: rowGap) {
            ForEach(Array(configurationModel.dataItems.enumerated()), id: \.offset) { _, data in
                if textsModel.hasSlot {
                    OUDSStaticListItem(data: data,
                                       slot: textsModel.slot(),
                                       leading: leadingModel.item(for: theme),
                                       trailing: trailingModel.item(for: theme))
                } else {
                    OUDSStaticListItem(data: data,
                                       leading: leadingModel.item(for: theme),
                                       trailing: trailingModel.item(for: theme))
                }
            }
        }
        .oudsListItemStyle(configurationModel.contentStyle)
        .oudsListItemContainerAlignment(configurationModel.containersAlignment)
        .oudsListItemRoundedMedia(configurationModel.roundedMedia)
        .oudsListItemSize(configurationModel.itemSize)
        .disabled(!configurationModel.enabled)
    }

    private var rowGap: CGFloat {
        configurationModel.type == .card ? theme.spaces.fixedSmall : theme.spaces.fixedNone
    }
}
