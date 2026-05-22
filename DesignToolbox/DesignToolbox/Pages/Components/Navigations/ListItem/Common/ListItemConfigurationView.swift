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


// MARK: - ListItem Configuration

struct ListItemConfiguration: View {

    let configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            ListItemGlobalSettingsConfiguration(configurationModel: configurationModel)

            Divider().horizontal()

            ListItemContentConfiguration(configurationModel: configurationModel)

            Divider().horizontal()

            ListItemTextsConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Global configuration

private struct ListItemGlobalSettingsConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        DesignToolboxEditContentDisclosure("app_components_listItem_globalConfiguration_label", isContentVisible: true) {
            VStack (spacing: 0) {
                OUDSChipPicker(title: "app_components_common_type_tech".localized(),
                               selection: $configurationModel.`type`,
                               chips: ListItemConfigurationModel.ListType.chips)

                OUDSChipPicker(title: "app_components_listItem_size_tech".localized(),
                               selection: $configurationModel.itemSize,
                               chips: OUDSListItemSize.chips)

                Divider().horizontal()

                if configurationModel.type == .card {
                    OUDSSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)
                }

                if configurationModel.type == .item ||
                    (configurationModel.type == .card && !configurationModel.isOutlined) {
                    OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)
                    OUDSSwitchItem("app_components_listItem_background_tech", isOn: $configurationModel.hasBackground)
                }

                Divider().horizontal()

                OUDSSwitchItem("app_components_listItem_boldLabel_tech", isOn: $configurationModel.isBoldLabel)

                OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

                Stepper("app_components_common_itemCount_label" <- "\($configurationModel.numberOfItems.wrappedValue)",
                        value: $configurationModel.numberOfItems)
                .padding(.all, theme.spaces.fixedMedium)
                .labelStrongMedium(theme)
            }
        }
    }
}

// MARK: - Texts configuration

private struct ListItemTextsConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        DesignToolboxEditContentDisclosure("app_components_listItem_labelsConfiguration_label"){
            DesignToolboxTextField(text: $configurationModel.labelText, label: "app_components_common_label_tech")

            if configurationModel.itemSize == .standard {
                DesignToolboxTextField(text: $configurationModel.overlineText, label: "app_components_listItem_overline_tech")
                DesignToolboxTextField(text: $configurationModel.extraLabelText, label: "app_components_controlItem_extraLabel_tech")
            }

            DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")

            DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")
        }
    }
}

// MARK: - Content configuration

private struct ListItemContentConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        DesignToolboxEditContentDisclosure("app_components_listItem_contentConfiguration_label", isContentVisible: true) {
            VStack (spacing: 0) {
                OUDSChipPicker(title: "app_components_listItem_leading_tech".localized(),
                               selection: $configurationModel.leadingOption,
                               chips: Leading.chips)

                OUDSChipPicker(title: "app_components_listItem_trailing_tech".localized(),
                               selection: $configurationModel.trailingOption,
                               chips: Trailing.chips)

                if configurationModel.trailingOption == .avatar || configurationModel.leadingOption == .avatar {

                    Divider().horizontal()

                    OUDSChipPicker(title: "app_components_listItem_avatarType_tech".localized(),
                                   selection: $configurationModel.avatarType,
                                   chips: OUDSListItemAvatar.AvatarType.chips)
                    OUDSChipPicker(title: "app_components_listItem_avatarSize_tech".localized(),
                                   selection: $configurationModel.avatarSize,
                                   chips: OUDSListItemAvatar.Size.chips)

                    OUDSSwitchItem("app_components_listItem_avatarBadge_label", isOn: $configurationModel.avatarBadgeOption)
                }

                if configurationModel.trailingOption == .text {

                    Divider().horizontal()

                    OUDSChipPicker(title: "app_components_listItem_trailing_textType_tech".localized(),
                                   selection: $configurationModel.trailingTextType,
                                   chips: OUDSListItemTrailing.TextType.chips)
                }

                if configurationModel.trailingOption == .icon || configurationModel.leadingOption == .icon {

                    Divider().horizontal()

                    OUDSChipPicker(title: "app_components_listItem_iconType_tech".localized(),
                                   selection: $configurationModel.iconType,
                                   chips: IconType.chips)

                    OUDSChipPicker(title: "app_components_listItem_iconSize_tech".localized(),
                                   selection: $configurationModel.iconSize,
                                   chips: OUDSLIstItemIcon.Size.chips)

                    if configurationModel.iconType == .neutral {
                        OUDSSwitchItem("app_components_listItem_badgeOnIcon_tech", isOn: $configurationModel.bageOnNeutralIcon)
                    }
                }

                if !(configurationModel.leadingOption == .none)
                    || !(configurationModel.trailingOption == .none) {

                    Divider().horizontal()

                    OUDSChipPicker(title: "app_components_listItem_alignment_tech".localized(),
                                   selection: $configurationModel.containersAlignment,
                                   chips: OUDSListItemContainersAlignment.chips)

                    if configurationModel.needRoundedMediaOption {
                        OUDSSwitchItem("app_components_listItem_roundedMedia_tech", isOn: $configurationModel.roundedMedia)
                    }
                }
            }
        }
    }
}
