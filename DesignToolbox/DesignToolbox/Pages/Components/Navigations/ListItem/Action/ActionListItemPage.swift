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

// MARK: - Action List Item Configuration Model

final class ActionListItemConfigurationModel: ListItemConfigurationModel {

    override init() {
        super.init()
        componentInitCode = "OUDSActionListItem"
        updateCode()
    }

    deinit {}

    override var trailingClosurePattern: String {
        " {\n    // Action to perform on tap\n}"
    }
}

// MARK: - Action List Item Page

struct ActionListItemPage: View {

    @StateObject private var configurationModel = ActionListItemConfigurationModel()

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ActionListItemDemo(configurationModel: configurationModel)
        } configurationView: {
            ListItemConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Action List Item Demo

private struct ActionListItemDemo: View {

    @ObservedObject private var configurationModel: ActionListItemConfigurationModel
    @ObservedObject private var textsModel: ListItemTextsConfigurationModel
    @ObservedObject private var leadingModel: ListItemLeadingConfigurationModel
    @ObservedObject private var trailingModel: ListItemTrailingConfigurationModel

    @Environment(\.theme) private var theme

    init(configurationModel: ActionListItemConfigurationModel) {
        self.configurationModel = configurationModel
        textsModel = configurationModel.textsModel
        leadingModel = configurationModel.leadingModel
        trailingModel = configurationModel.trailingModel
    }

    var body: some View {
        VStack(spacing: rowGap) {
            ForEach(Array(configurationModel.dataItems.enumerated()), id: \.offset) { _, data in
                OUDSActionListItem(data: data,
                                   leading: leadingModel.item(for: theme),
                                   trailing: trailingModel.item(for: theme)) {}
            }
        }
        .oudsListContentStyle(configurationModel.contentStyle)
        .oudsListItemContainerAlignment(configurationModel.containersAlignment)
        .oudsListItemRoundedMedia(configurationModel.roundedMedia)
        .oudsListItemSize(configurationModel.itemSize)
        .disabled(!configurationModel.enabled)
        .isEdgeToEdge(configurationModel.isEdgeToEdgeComponent)
        .showSkeleton(isVisible: configurationModel.showSkeleton)
    }

    private var rowGap: CGFloat {
        switch configurationModel.contentStyle {
        case .card:
            theme.spaces.fixedLarge
        case .item:
            theme.spaces.fixedNone
        }
    }
}
