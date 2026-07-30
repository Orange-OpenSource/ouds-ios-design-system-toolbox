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

struct ListItemAvatarDemo: View {

    @ObservedObject var configuration: ListItemAvatarConfigurationModel

    var body: some View {
        OUDSListItemAvatar(
            type: configuration.type,
            size: configuration.size,
            badgeType: configuration.badgeOption ? .standard(.negative) : nil)
    }
}

open class ListItemAvatarConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: OUDSListItemSize

    @Published var type: OUDSListItemAvatar.AvatarType {
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

    // MARK: Builder

    @MainActor
    var avatar: OUDSListItemAvatar {
        OUDSListItemAvatar(
            type: type,
            size: size,
            badgeType: badgeOption ? .standard(.negative) : nil)
    }

    // MARK: Code helepr
    var avatarPattern: String {
        ".init(type: \(type.technicalDescription), size: \(size.technicalDescription)\(badgePattern))"
    }

    private var badgePattern: String {
        badgeOption ? ", badgeType: .standard(.negative)" : ""
    }
}

struct ListItemAvatarConfiguration: View {

    @ObservedObject var configurationModel: ListItemAvatarConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(title: "app_components_listItem_avatarType_tech".localized(),
                           selection: $configurationModel.type,
                           chips: OUDSListItemAvatar.AvatarType.chips)

            if configurationModel.itemSize == .standard {
                OUDSChipPicker(title: "app_components_listItem_avatarSize_tech".localized(),
                               selection: $configurationModel.size,
                               chips: OUDSListItemAvatar.Size.chips)
            }

            OUDSSwitchItem("app_components_listItem_avatarBadge_label", isOn: $configurationModel.badgeOption)
        }
    }
}

// MARK: - Extensions of OUDSListItemAvatar.AvatarType

extension OUDSListItemAvatar.AvatarType: @retroactive Equatable {}
extension OUDSListItemAvatar.AvatarType: @retroactive Hashable {}
extension OUDSListItemAvatar.AvatarType: @retroactive CaseIterable {}
extension OUDSListItemAvatar.AvatarType: DesignToolboxEnumRepresentable {

    public static let allCases: [OUDSListItemAvatar.AvatarType] =
    [
        .icon,
        .image(Image(decorative: "il_placeholder")),
        .initials("MT"),
    ]

    var formattedName: String {
        switch self {
        case .image:
            "Image"
        case .initials:
            "Initials"
        case .icon:
            "Icon"
        }
    }

    var technicalDescription: String {
        switch self {
        case .icon:
            ".icon"
        case .image:
            ".image(asset: \(Image.placeholderImageSample()))"
        case let .initials(initials):
            ".initials(\"\(initials)\")"
        }
    }

    public static func == (
        lhs: OUDSListItemAvatar.AvatarType,
        rhs: OUDSListItemAvatar.AvatarType) -> Bool
    {
        lhs.formattedName == rhs.formattedName
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(formattedName)
    }
}

// MARK: - Extensions of OUDSListItemAvatar.Size

extension OUDSListItemAvatar.Size: @retroactive CaseIterable {}
extension OUDSListItemAvatar.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemAvatar.Size] = [
        .medium, .large, .extraLarge,
    ]
}
