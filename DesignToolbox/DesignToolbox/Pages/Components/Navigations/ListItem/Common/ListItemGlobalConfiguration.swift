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

    // swiftlint:disable closure_body_length
    var body: some View {
        VStack(spacing: 0) {
            OUDSSwitchItem("app_components_common_skeleton_tech",
                           isOn: $configurationModel.showSkeleton,
                           hasDivider: true)

            OUDSSwitchItem("app_components_common_edgeToEdge_tech",
                           isOn: $configurationModel.isEdgeToEdgeComponent,
                           hasDivider: true)

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
                    OUDSSwitchItem("app_components_controlItem_divider_tech",
                                   isOn: $configurationModel.hasDivider)

                    OUDSSwitchItem("app_components_listItem_background_tech",
                                   isOn: $configurationModel.hasBackground,
                                   hasDivider: true)
                }
            case .item:
                OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

                OUDSSwitchItem("app_components_listItem_background_tech", isOn: $configurationModel.hasBackground)
            }

            OUDSHorizontalDivider().gridMargin(.horizontal)

            OUDSChipPicker(title: "app_components_listItem_size_tech".localized(),
                           selection: $configurationModel.itemSize,
                           chips: OUDSListItemSize.chips)

            OUDSHorizontalDivider().gridMargin(.horizontal)

            OUDSChipPicker(title: "app_components_common_contentAlignment_tech".localized(),
                           selection: $configurationModel.containersAlignment,
                           chips: OUDSListItemContainersAlignment.chips)

            OUDSHorizontalDivider().gridMargin(.horizontal)

            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            if configurationModel.needRoundedMediaOption {
                OUDSHorizontalDivider().gridMargin(.horizontal)

                OUDSSwitchItem("app_components_listItem_roundedMedia_tech", isOn: $configurationModel.roundedMedia)
            }

            OUDSHorizontalDivider().gridMargin(.horizontal)

            #if !os(tvOS)
            Stepper("app_components_common_itemCount_label" <- "\($configurationModel.numberOfItems.wrappedValue)",
                    value: $configurationModel.numberOfItems,
                    in: 1 ... 15,
                    step: 1)
                .padding(.vertical, theme.spaces.fixedMedium)
                .gridMargin(.horizontal)
                .labelStrongMedium(theme)
            #endif
        }
    }
    // swiftlint:enable closure_body_length
}
