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

// MARK: - Global configuration

struct ListItemGlobalSettingsConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(title: "app_components_listItem_size_tech".localized(),
                           selection: $configurationModel.itemSize,
                           chips: OUDSListItemSize.chips)

            OUDSHorizontalDivider()

            OUDSChipPicker(title: "app_components_listItem_contentAlignment_tech".localized(),
                           selection: $configurationModel.containersAlignment,
                           chips: OUDSListItemContainersAlignment.chips)

            OUDSHorizontalDivider()

            OUDSChipPicker(title: "app_components_common_type_tech".localized(),
                           selection: $configurationModel.type,
                           chips: ListItemConfigurationModel.ListType.chips)

            switch configurationModel.type {
            case .card:
                OUDSChipPicker(title: "app_components_listItem_backgroundContentStyle_tech".localized(),
                               selection: $configurationModel.contentCardStyleOption,
                               chips: ContentCardStyle.chips)

                if !(configurationModel is NavigationListItemConfigurationModel)
                    && (configurationModel.contentCardStyleOption == .backgroundOnInteraction
                        || configurationModel.contentCardStyleOption == .outlinedOnInteraction) {
                    OUDSInlineAlert("app_common_notImplementedYet", status: .warning)
                        .padding(.horizontal, theme.spaces.fixedSmall)
                }

                if configurationModel.contentCardStyleOption == .backgroundOnInteraction ||
                    configurationModel.contentCardStyleOption == .background
                {
                    OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)
                }

            case .standard:
                OUDSChipPicker(title: "app_components_listItem_backgroundContentStyle_tech".localized(),
                               selection: $configurationModel.contentStandardStyleOption,
                               chips: ContentStandardStyle.chips)

                if !(configurationModel is NavigationListItemConfigurationModel)
                    && configurationModel.contentStandardStyleOption == .backgroundOnInteraction {
                    OUDSInlineAlert("app_common_notImplementedYet", status: .warning)
                        .padding(.horizontal, theme.spaces.fixedSmall)
                }

                if configurationModel.contentStandardStyleOption == .backgroundOnInteraction ||
                    configurationModel.contentStandardStyleOption == .background
                {
                    OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)
                }
            }

            OUDSHorizontalDivider()

            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            if configurationModel.needRoundedMediaOption {
                OUDSHorizontalDivider()

                OUDSSwitchItem("app_components_listItem_roundedMedia_tech", isOn: $configurationModel.roundedMedia)
            }

            OUDSHorizontalDivider()

#if !os(tvOS)
            Stepper("app_components_common_itemCount_label" <- "\($configurationModel.numberOfItems.wrappedValue)",
                    value: $configurationModel.numberOfItems,
                    in: 1 ... 15,
                    step: 1)
            .padding(.all, theme.spaces.fixedMedium)
            .labelStrongMedium(theme)
#endif
        }
    }
}
