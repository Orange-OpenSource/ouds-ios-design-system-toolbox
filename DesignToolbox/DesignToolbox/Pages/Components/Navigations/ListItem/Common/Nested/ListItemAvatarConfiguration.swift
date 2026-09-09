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

// MARK: - List Ite mAvatar Configuration Model

open class ListItemAvatarConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: OUDSListItemSize

    @Published var type: ListItemAvatarType {
        didSet { updateCode() }
    }

    @Published var size: OUDSListItemAvatar.Size {
        didSet { updateCode() }
    }

    @Published var badgeOption: ListItemAvatardBadge {
        didSet { updateCode() }
    }

    var standardBadgeModel: BadgeStandardConfigurationModel
    var iconBadgeModel: BadgeIconConfigurationModel

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        type = .icon
        size = .medium
        badgeOption = .none
        standardBadgeModel = BadgeStandardConfigurationModel()
        iconBadgeModel = BadgeIconConfigurationModel()

        super.init()

        register(standardBadgeModel)
        register(iconBadgeModel)
    }

    deinit {}

    // MARK: Builder

    private var badgePattern: String {
        switch badgeOption {
        case .none:
            ""
        case .standard:
            ", badgeType: .standard(\(standardBadgeModel.statusPattern))"
        case .icon:
            ", badgeType: .icon(\(iconBadgeModel.statusWithIconPattern))"
        }
    }

    @MainActor
    func avatar(for theme: OUDSTheme) -> OUDSListItemAvatar {
        let avatarType: OUDSListItemAvatar.AvatarType =
            switch type {
            case .image:
                .image(Image.decorativeImage(named: "il_placeholder_avatar", prefixedBy: theme.name))
            case .initials:
                .initials("MT")
            case .icon:
                .icon
            }

        return OUDSListItemAvatar(
            type: avatarType,
            size: size,
            badgeType: badgeType(for: theme))
    }

    @MainActor
    private func badgeType(for theme: OUDSTheme) -> OUDSListItemAvatar.BadgeType? {
        switch badgeOption {
        case .none:
            nil
        case .standard:
            OUDSListItemAvatar.BadgeType.standard(standardBadgeModel.status, accessibilityLabel: "")
        case .icon:
            OUDSListItemAvatar.BadgeType.icon(iconBadgeModel.statusWithIcon(from: theme))
        }
    }

    override func updateCode() {
        let imagePattern = "Image(decorative: \"ic_placeholder\")"
        let typePattern = switch type {
        case .image:
            ".image(asset: \(imagePattern))"
        case .initials:
            ".initials(\"MT\")"
        case .icon:
            ".icon"
        }

        code = ".init(type: \(typePattern), size: \(size.technicalDescription)\(badgePattern))"
    }
}

// MARK: - List Item Avatar Configuration

struct ListItemAvatarConfiguration: View {

    @ObservedObject var configurationModel: ListItemAvatarConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(title: "app_components_listItem_avatarType_tech".localized(),
                           selection: $configurationModel.type,
                           chips: ListItemAvatarType.chips)

            if configurationModel.itemSize == .default {
                OUDSChipPicker(title: "app_components_listItem_avatarSize_tech".localized(),
                               selection: $configurationModel.size,
                               chips: OUDSListItemAvatar.Size.chips)
            }

            OUDSChipPicker(title: "app_components_listItem_avatarBadge_label".localized(),
                           selection: $configurationModel.badgeOption,
                           chips: ListItemAvatardBadge.chips)

            switch configurationModel.badgeOption {
            case .none:
                EmptyView()
            case .standard:
                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.standardBadgeModel.status,
                               chips: OUDSBadgeStandard.Status.chips)
            case .icon:
                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.iconBadgeModel.statusKind,
                               chips: BadgeIconStatusKind.chips)
            }
        }
    }
}

// MARK: - List Item Avatar Type

enum ListItemAvatarType: DesignToolboxEnumRepresentable {
    case image, initials, icon
}

// MARK: - Extensions of OUDSListItemAvatar.Size

extension OUDSListItemAvatar.Size: @retroactive CaseIterable {}
extension OUDSListItemAvatar.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemAvatar.Size] = [
        .medium, .large, .extraLarge,
    ]
}

// MARK: - List Item Badge Type

enum ListItemAvatardBadge: DesignToolboxEnumRepresentable {
    case none, standard, icon
}
