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

    @Published var badgeOption: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        type = .icon
        size = .medium
        badgeOption = false

        super.init()
    }

    deinit {}

    // MARK: Builder

    private var badgePattern: String {
        badgeOption ? ", badgeType: .standard(.negative)" : ""
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
            badgeType: badgeOption ? .standard(.negative) : nil)
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

            OUDSSwitchItem("app_components_listItem_avatarBadge_label", isOn: $configurationModel.badgeOption)
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
