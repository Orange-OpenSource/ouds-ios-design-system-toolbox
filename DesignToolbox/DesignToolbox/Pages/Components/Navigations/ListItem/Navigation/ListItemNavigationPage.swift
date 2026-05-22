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

// MARK: - ListItem Page

struct ListItemNavigationPage: View {

    @StateObject private var configurationModel = ListItemNavigationConfigurationModel()

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ListItemNavigationDemo(configurationModel: configurationModel)
        } configurationView: {
            ListItemNavigationConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - ListItem Demo

private struct ListItemNavigationDemo: View {

    @ObservedObject var configurationModel: ListItemNavigationConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: rowGap) {
            ForEach(Array(configurationModel.dataItems.enumerated()), id: \.offset) { _, data in
                OUDSListItemNavigation(data: data,
                                       affordanceType: configurationModel.affordanceType,
                                       leading: configurationModel.leading(for: theme),
                                       trailing: configurationModel.trailing(for: theme)) {
                    print("Element \(data.label) clicked")
                }
            }
            .modifier(ListStyleModifier(configurationModel: configurationModel))
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
