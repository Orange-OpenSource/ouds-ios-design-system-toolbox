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

import Combine
import OUDSSwiftUI
import SwiftUI

// MARK: - List Item Trailing Configuration Model

open class ListItemTrailingConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var option: ListItemTrailingType {
        didSet { updateCode() }
    }

    @Published var textTypeOption: ListItemTextType {
        didSet { updateCode() }
    }

    @Published var label: String {
        didSet { updateCode() }
    }

    @Published var extraLabel: String {
        didSet { updateCode() }
    }

    var avatarModel: ListItemAvatarConfigurationModel
    var badgeModel: ListItemBadgeConfigurationModel
    var flagModel: ListItemFlagConfigurationModel
    var iconModel: ListItemIconConfigurationModel
    var imageModel: ListItemImageConfigurationModel

    var itemSize: OUDSListItemSize {
        didSet {
            avatarModel.itemSize = itemSize
            iconModel.itemSize = itemSize
            imageModel.itemSize = itemSize
        }
    }

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        option = .none
        textTypeOption = .label
        label = String(localized: "app_components_common_label_label")
        extraLabel = String(localized: "app_components_common_extraLabel_label")

        avatarModel = ListItemAvatarConfigurationModel(itemSize: itemSize)
        flagModel = ListItemFlagConfigurationModel()
        iconModel = ListItemIconConfigurationModel(itemSize: itemSize)
        imageModel = ListItemImageConfigurationModel(itemSize: itemSize)
        badgeModel = ListItemBadgeConfigurationModel()

        super.init()

        register(avatarModel)
        register(badgeModel)
        register(flagModel)
        register(iconModel)
        register(imageModel)
    }

    deinit {}

    // MARK: Builders

    @MainActor
    func item(for theme: OUDSTheme) -> OUDSListItemTrailing? {
        switch option {
        case .none:
            nil
        case .text:
            .text(textType)
        case .badge:
            .badge(badgeModel.badgeType)
        case .tag:
            .tag(.init(label: "Label", size: .small))
        case .icon:
            .icon(iconModel.icon(for: theme))
        case .image:
            .image(imageModel.image(for: theme))
        case .flag:
            .flag(flagModel.flag)
        case .avatar:
            .avatar(avatarModel.avatar(for: theme))
        }
    }

    private var textType: OUDSListItemTrailing.TextType {
        switch textTypeOption {
        case .label:
            .label(label)
        case .labelStrong:
            .labelStrong(label)
        case .labelMuted:
            .labelMuted(label)
        case .labelAndExtraLabel:
            .labelAndExtraLabel(label, extraLabel)
        }
    }

    // MARK: Media helper

    var needRoundedMediaOption: Bool {
        option == .image
    }

    // MARK: Code helper

    override func updateCode() {
        let pattern =
            switch option {
            case .none:
                ""
            case .text:
                ".text(\(textPattern))"
            case .badge:
                ".badge(\(badgeModel.code)"
            case .tag:
                ".tag(OUDSTag(label: \"Label\", size: .small)"
            case .icon:
                ".icon(\(iconModel.code)"
            case .image:
                ".image(\(imageModel.code))"
            case .flag:
                ".flag(\(flagModel.code))"
            case .avatar:
                ".avatar(\(avatarModel.code))"
            }

        code = option == .none ? "" : "\n\nlet trailing: OUDSListItemTrailing = \n \(pattern)"
    }

    private var textPattern: String {
        switch textType {
        case .label:
            ".label(\"\(label)\")"
        case .labelMuted:
            ".labelMuted(\"\(label)\")"
        case .labelStrong:
            ".labelStrong(\"\(label)\")"
        case .labelAndExtraLabel:
            ".labelMuted(\"\(label)\", \"\(extraLabel)\")"
        }
    }
}

struct ListItemTrailingConfiguration: View {

    @ObservedObject var configurationModel: ListItemTrailingConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            OUDSChipPicker(title: "",
                           selection: $configurationModel.option,
                           chips: ListItemTrailingType.chips)

            switch configurationModel.option {
            case .text:
                OUDSChipPicker(title: "app_components_listItem_trailing_textType_tech".localized(),
                               selection: $configurationModel.textTypeOption,
                               chips: ListItemTextType.chips)
                Group {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")

                    if configurationModel.textTypeOption == .labelAndExtraLabel {
                        DesignToolboxTextField(text: $configurationModel.extraLabel, label: "app_components_common_extraLabel_tech")
                    }
                }
                .padding(.horizontal, theme.spaces.fixedSmall)
            case .image:
                ListItemImageConfiguration(configurationModel: configurationModel.imageModel)
            case .icon:
                ListItemIconConfiguration(configurationModel: configurationModel.iconModel)
            case .avatar:
                ListItemAvatarConfiguration(configurationModel: configurationModel.avatarModel)
            case .flag:
                EmptyView()
            case .badge:
                ListItemBadgeConfiguration(configurationModel: configurationModel.badgeModel)
            default:
                EmptyView()
            }
        }
    }
}

// MARK: List Item Trailing Type

enum ListItemTrailingType: DesignToolboxEnumRepresentable {
    case none, text, badge, tag, icon, image, flag, avatar
}

// MARK: List Item Text Type

enum ListItemTextType: DesignToolboxEnumRepresentable {
    case label, labelStrong, labelMuted, labelAndExtraLabel
}
