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

// MARK: - List Item Configuration

struct ListItemConfiguration: View {

    enum Configuration: String, CaseIterable {
        case global, texts, leading, trailing

        var description: String {
            switch self {
            case .global:
                "app_components_listItem_globalConfiguration_label"
            case .texts:
                "app_components_listItem_labelsConfiguration_label"
            case .leading:
                "app_components_listItem_leading_tech"
            case .trailing:
                "app_components_listItem_trailing_tech"
            }
        }
    }

    // MARK: Properties

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @State var configuration: Configuration = .global

    @Environment(\.theme) private var theme

    // MARK: - Body

    var body: some View {
        Picker("app_common_configuration_label", selection: $configuration) {
            ForEach(Configuration.allCases, id: \.self) { configuration in
                Text(configuration.description.localized()).tag(configuration)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, theme.spaces.fixedSmall)

        switch configuration {
        case .global:
            ListItemGlobalSettingsConfiguration(configurationModel: configurationModel)
        case .texts:
            ListItemTextsConfiguration(configurationModel: configurationModel.textsModel)
        case .trailing:
            ListItemTrailingConfiguration(configurationModel: configurationModel.trailingModel)
        case .leading:
            ListItemLeadingConfiguration(configurationModel: configurationModel.leadingModel)
        }
    }
}
