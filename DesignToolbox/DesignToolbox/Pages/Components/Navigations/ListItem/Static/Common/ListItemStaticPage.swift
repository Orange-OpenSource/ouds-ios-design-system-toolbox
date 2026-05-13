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

struct ListItemStaticPage: View {

    @StateObject private var configurationModel: ListItemStaticConfigurationModel

    init(type: ListItemConfigurationModel.ListType) {
        self._configurationModel = StateObject(wrappedValue: ListItemStaticConfigurationModel(type: type))
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ListItemStaticDemo(configurationModel: configurationModel)
        } configurationView: {
            ListItemStaticConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - ListItem Demo

private struct ListItemStaticDemo: View {

    @ObservedObject var configurationModel: ListItemStaticConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedNone) {
            ForEach(Array(configurationModel.dataItems.enumerated()), id: \.offset) { _, data in
                OUDSListStaticItem(data: data, leading: configurationModel.leading(for: theme))
            }
        }
        .modifier(ListStyleModifier(configurationModel: configurationModel))
        .oudsListItemContainerAlignment(configurationModel.containersAlignment)
        .disabled(!configurationModel.enabled)
    }
}
