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

struct ListItemPage: View {

    @StateObject private var configurationModel = ListItemConfigurationModel()

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ListItemDemo(configurationModel: configurationModel)
        } configurationView: {
            ListItemConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - ListItem Demo

private struct ListItemDemo: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack {
            OUDSListItemNavigationGrouped(label: "\(configurationModel.labelText)_1",
                                          overline: configurationModel.overlineText.isEmpty ? nil : configurationModel.overlineText,
                                          extraLabel: configurationModel.extraLabelText.isEmpty ? nil : configurationModel.extraLabelText,
                                          description: configurationModel.descriptionText.isEmpty ? nil : configurationModel.descriptionText,
                                          helperText: configurationModel.helperText.isEmpty ? nil : configurationModel.helperText,
                                          isOutlined: configurationModel.isOutlined,
                                          isReadOnly: configurationModel.isReadOnly,
                                          hasDivider: configurationModel.hasDivider,
                                          affordanceType: configurationModel.affordanceType)
            OUDSListItemNavigationGrouped(label: "\(configurationModel.labelText)_2",
                                          overline: configurationModel.overlineText.isEmpty ? nil : configurationModel.overlineText,
                                          extraLabel: configurationModel.extraLabelText.isEmpty ? nil : configurationModel.extraLabelText,
                                          description: configurationModel.descriptionText.isEmpty ? nil : configurationModel.descriptionText,
                                          helperText: configurationModel.helperText.isEmpty ? nil : configurationModel.helperText,
                                          isOutlined: configurationModel.isOutlined,
                                          isReadOnly: configurationModel.isReadOnly,
                                          hasDivider: configurationModel.hasDivider,
                                          affordanceType: configurationModel.affordanceType)
            OUDSListItemNavigationGrouped(label: "\(configurationModel.labelText)_3",
                                          overline: configurationModel.overlineText.isEmpty ? nil : configurationModel.overlineText,
                                          extraLabel: configurationModel.extraLabelText.isEmpty ? nil : configurationModel.extraLabelText,
                                          description: configurationModel.descriptionText.isEmpty ? nil : configurationModel.descriptionText,
                                          helperText: configurationModel.helperText.isEmpty ? nil : configurationModel.helperText,
                                          isOutlined: configurationModel.isOutlined,
                                          isReadOnly: configurationModel.isReadOnly,
                                          hasDivider: configurationModel.hasDivider,
                                          affordanceType: configurationModel.affordanceType)
        }
        .oudsListItemContainersAlignment(configurationModel.containersAlignment)
        .disabled(!configurationModel.enabled)
    }
}
