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

struct ListItemGlobalSettingsConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(title: "app_components_common_type_tech".localized(),
                           selection: $configurationModel.contentStyleOption,
                           chips: ListItemConfigurationModel.ListContentStyle.chips)

            switch configurationModel.contentStyleOption {
            case .card:
                OUDSChipPicker(title: "app_components_listItem_cardDecoration_tech".localized(),
                               selection: $configurationModel.contentCardDecorationOption,
                               chips: ListItemContentCardStyle.chips)
                switch configurationModel.contentCardDecorationOption {
                case .outlined:
                    if configurationModel is NavigationListItemConfigurationModel {
                        OUDSSwitchItem("app_components_listItem_outlinedOnInteraction_tech", isOn: $configurationModel.outlinedOnInteractionOnly)
                    }

                case .strandard:
                    OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

                    OUDSSwitchItem("app_components_listItem_background_tech", isOn: $configurationModel.hasBackground)
                }

            case .item:
                OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

                OUDSSwitchItem("app_components_listItem_background_tech", isOn: $configurationModel.hasBackground)
            }

            OUDSHorizontalDivider()

            OUDSChipPicker(title: "app_components_listItem_size_tech".localized(),
                           selection: $configurationModel.itemSize,
                           chips: OUDSListItemSize.chips)

            OUDSHorizontalDivider()

            OUDSChipPicker(title: "app_components_common_contentAlignment_tech".localized(),
                           selection: $configurationModel.containersAlignment,
                           chips: OUDSListItemContainersAlignment.chips)

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
