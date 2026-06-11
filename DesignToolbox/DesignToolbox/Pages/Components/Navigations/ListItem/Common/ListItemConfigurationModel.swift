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

// swiftlint:disable file_length
// swiftlint:disable type_body_length

// MARK: - List Item Configuration Model

open class ListItemConfigurationModel: ComponentConfiguration {

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var labelText: String {
        didSet { updateCode() }
    }

    @Published var overlineText: String {
        didSet { updateCode() }
    }

    @Published var extraLabelText: String {
        didSet { updateCode() }
    }

    @Published var descriptionText: String {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var isBoldLabel: Bool {
        didSet { updateCode() }
    }

    @Published var itemSize: OUDSListItemSize {
        didSet { updateCode() }
    }

    @Published var containersAlignment: OUDSListItemContainersAlignment {
        didSet { updateCode() }
    }

    @Published var isOutlined: Bool {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
        didSet { updateCode() }
    }

    @Published var hasBackground: Bool {
        didSet { updateCode() }
    }

    @Published var leadingOption: Leading {
        didSet { updateCode() }
    }

    @Published var trailingOption: Trailing {
        didSet { updateCode() }
    }

    @Published var trailingTextType: OUDSListItemTrailing.TextType {
        didSet { updateCode() }
    }

    @Published var avatarType: OUDSListItemAvatar.AvatarType {
        didSet { updateCode() }
    }

    @Published var avatarSize: OUDSListItemAvatar.Size {
        didSet { updateCode() }
    }

    @Published var avatarBadgeOption: Bool {
        didSet { updateCode() }
    }

    @Published var iconType: IconType {
        didSet { updateCode() }
    }

    @Published var iconSize: OUDSListItemIcon.Size {
        didSet { updateCode() }
    }

    @Published var bageOnNeutralIcon: Bool {
        didSet { updateCode() }
    }

    @Published var roundedMedia: Bool {
        didSet { updateCode() }
    }

    @Published var hasSlot: Bool {
        didSet { updateCode() }
    }

    @Published var numberOfItems: Int

    @Published var type: ListType {
        didSet {
            if type == .card {
                hasBackground = true
            } else {
                hasBackground = false
            }
            updateCode()
        }
    }

    enum ListType: CaseIterable, CustomStringConvertible {
        case item
        case card

        var description: String {
            switch self {
            case .item:
                "app_components_listItem_itemType_tech"
            case .card:
                "app_components_listItem_cardType_tech"
            }
        }

        var chipData: OUDSChipPickerData<Self> {
            OUDSChipPickerData(tag: self, layout: .text(text: description))
        }

        static var chips: [OUDSChipPickerData<Self>] {
            allCases.map(\.chipData)
        }
    }

    override init() {
        type = .item
        numberOfItems = 1

        // Item content
        labelText = String(localized: "app_components_common_label_label")

        helperText = ""
        overlineText = ""
        extraLabelText = ""
        descriptionText = ""

        isBoldLabel = false

        // Item interaction
        enabled = true

        // Item Style
        itemSize = .standard
        containersAlignment = .center
        leadingOption = .none
        trailingOption = .avatar
        trailingTextType = .label(Text("Label"))

        avatarType = .icon
        avatarSize = .medium
        avatarBadgeOption = false

        iconType = .negative
        bageOnNeutralIcon = false
        iconSize = .medium

        roundedMedia = false

        hasSlot = false

        isOutlined = false
        hasDivider = true
        hasBackground = false

        super.init()
    }

    deinit {}

    // MARK: - Data

    var dataItems: [OUDSListItemData] {
        (0 ..< numberOfItems).map { index in
            OUDSListItemData(
                label: index == 0 ? labelText : "\(labelText)_\(index)",
                isBoldLabel: isBoldLabel,
                description: descriptionText.isEmpty ? nil : descriptionText,
                overline: overlineText.isEmpty ? nil : overlineText,
                extraLabel: extraLabelText.isEmpty ? nil : extraLabelText,
                helperText: helperText.isEmpty ? nil : helperText)
        }
    }

    var listStyle: OUDSListItemContentStyle {
        isOutlined ? .outlined : .standard(divider: hasDivider, background: hasBackground)
    }

    @MainActor
    func slot(for theme: OUDSTheme) -> some View {
        OUDSInlineAlert(label: "Label", status: .warning)
    }

    // swiftlint:disable force_unwrapping
    @MainActor
    func leading(for theme: OUDSTheme) -> OUDSListItemLeading? {
        switch leadingOption {
        case .none:
            nil
        case .icon:
            .icon(icon(for: theme))
        case .image:
            .image(asset: Image("il_placeholder"))
        case .flag:
            .flag(asset: Image("il_flag_fr"))
        case .avatar:
            .avatar(OUDSListItemAvatar(type: avatarType,
                                       size: avatarSize,
                                       badge: avatarBadge))
        #if os(iOS)
        case .video:
            // swiftlint:disable:next line_length
            // .video(URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8")!)
            // .video(URL(string: "https://mastermedia.orange.com/publicMedia?t=pmHGomBcoc&o=517502")!)
            .video(URL(string: "https://assets.orange.com/medias/domain12751/media101721/516402-fgepu9uf6k-480.m3u8")!,
                   autoplay: true,
                   muted: false,
                   tapToTogglePlay: false,
                   tapToToggleMute: false)
        #endif
        }
    }

    @MainActor
    func trailing(for theme: OUDSTheme) -> OUDSListItemTrailing? {
        switch trailingOption {
        case .none:
            nil
        case .text:
            .text(trailingTextType)
        case .badge:
            .badge(OUDSBadge(count: 1, accessibilityLabel: "", status: .negative, size: .medium))
        case .tag:
            .tag(OUDSTag(label: "Label", size: .small))
        case .icon:
            .icon(icon(for: theme))
        case .image:
            .image(asset: Image("il_placeholder"))
        #if os(iOS)
        case .video:
            .video(URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8")!)
        #endif
        case .flag:
            .flag(asset: Image("il_flag_fr"))
        case .avatar:
            .avatar(OUDSListItemAvatar(type: avatarType,
                                       size: avatarSize,
                                       badge: avatarBadge))
        }
    }

    // swiftlint:enable force_unwrapping

    @MainActor
    private var avatarBadge: OUDSBadge? {
        let badgeSize: OUDSBadge.StandardSize = switch avatarSize {
        case .medium:
            .extraSmall
        case .large:
            .small
        case .extraLarge:
            .medium
        }

        return avatarBadgeOption ? OUDSBadge(accessibilityLabel: "", status: .negative, size: badgeSize) : nil
    }

    @MainActor
    private func icon(for theme: OUDSTheme) -> OUDSListItemIcon {
        let type: OUDSListItemIcon.IconType = switch iconType {
        case .neutral:
            .neutral(asset: Image(decorative: "ic_heart", bundle: theme.resourcesBundle), badge: bageOnNeutralIcon)
        case .info:
            .info
        case .warning:
            .warning
        case .negative:
            .negative
        case .positive:
            .positive
        }

        return OUDSListItemIcon(type: type, size: iconSize)
    }

    var trailingText: OUDSListItemTrailing.TextType {
        switch trailingTextType {
        case .label:
            .label(Text("Label"))
        case .labelStrong:
            .labelStrong(Text("Label"))
        case .labelMuted:
            .labelMuted(Text("Label"))
        case .labelAndExtraLabel:
            .labelAndExtraLabel(Text("Label"), Text("Extra label"))
        }
    }

    var needRoundedMediaOption: Bool {
        let leadingMedia = switch leadingOption {
        case .image:
            true
        #if os(iOS)
        case .video:
            true
        #endif
        default:
            false
        }

        let trailingMedia = switch trailingOption {
        case .image:
            true
        #if os(iOS)
        case .video:
            true
        #endif
        default:
            false
        }

        return leadingMedia || trailingMedia
    }

    // MARK: - Code generation
    override func updateCode() {
        let leadingPart = leadingPattern.isEmpty ? "" : ", leading: leading"
        let trailingPart = trailingPattern.isEmpty ? "" : ", trailing: trailing"

        code = """
        \(dataPattern) \(leadingPattern) \(trailingPattern)

        OUDSListItem(data: data\(leadingPart)\(trailingPart)
        \(styleModifierPettern)\(sizeModifierPattern)\(containersAlignmentPattern)\(roundedMediaPattern)
        """
    }

    var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    var dataPattern: String {
        """
        let data = OUDSListItemData(\(labelPattern)\(isBoldLabelPattern)\(descriptionPattern)\(overlinePattern)\(extraLabelPattern)\(helperTextPattern))
        """
    }

    private var labelPattern: String {
        "label: \"\(labelText)\""
    }

    private var isBoldLabelPattern: String {
        isBoldLabel ? ", isBoldLabel: true" : ""
    }

    private var overlinePattern: String {
        overlineText.isEmpty ? "" : ", overline: \"\(overlineText)\""
    }

    private var extraLabelPattern: String {
        extraLabelText.isEmpty ? "" : ", extraLabel: \"\(extraLabelText)\""
    }

    private var descriptionPattern: String {
        descriptionText.isEmpty ? "" : ", description: \"\(descriptionText)\""
    }

    private var helperTextPattern: String {
        helperText.isEmpty ? "" : ", helperText: \"\(helperText)\""
    }

    private var isOutlinedPattern: String {
        isOutlined ? ", isOutlined: true" : ""
    }

    private var hasDividerPattern: String {
        hasDivider ? ", hasDivider: true" : ""
    }

    private var styleModifierPettern: String {
        switch type {
        case .item:
            """
            .oudsListCardStyle(hasDdivider: \(hasDivider),
                               hasBackground: \(hasBackground))
            """
        case .card:
            ".oudsListItemStyle(style: .\(listStyle))"
        }
    }

    private var roundedMediaPattern: String {
        if !(trailingOption == .none) || !(leadingOption == .none) {
            "\n.oudsListItemRoundedMedia(\(roundedMedia))"
        } else {
            ""
        }
    }

    private var sizeModifierPattern: String {
        itemSize == .standard ? "" : "\n.oudsListItemSize(\(itemSize.technicalDescription))"
    }

    private var containersAlignmentPattern: String {
        "\n.oudsListItemContainerAlignment(\(containersAlignment.technicalDescription))"
    }

    private var iconPattern: String {
        let imagePattern = "Image(decorative: \"ic_heart\")"
        let typePattern = switch iconType {
        case .neutral:
            ".neutral(asset: \(imagePattern), badge: \(bageOnNeutralIcon))"
        case .info:
            ".info"
        case .warning:
            ".warning"
        case .negative:
            ".negative"
        case .positive:
            ".positive"
        }

        let sizePattern: String = iconSize.technicalDescription
        return ".init(type: \(typePattern), size: \(sizePattern))"
    }

    private var avatarPattern: String {
        ".init(type: \(avatarType.technicalDescription), size: \(avatarSize.technicalDescription))"
    }

    private var leadingPattern: String {
        let leadingOptionPatter =
            switch leadingOption {
            case .none:
                ""
            case .icon:
                ".icon(\(iconPattern)"
            case .image:
                ".image(asset: Image(decorative: \"ic_heart\"))"
            #if os(iOS)
            case .video:
                ".video(URL(string: \"https://unified-design-system.orange.com/\")!)"
            #endif
            case .flag:
                ".flag(asset: Image(decorative: \"ic_flag_FR_fr\")"
            case .avatar:
                ".avatar(\(avatarPattern))"
            }

            return leadingOption == .none ? "" : "\nlet leading: OUDSListItemLeading = \n \(leadingOptionPatter)"
    }

            private var trailingTextTypePattern: String {
                switch trailingTextType {
                case .label:
                    ".label(Text(\"Label\"))"
                case .labelMuted:
                    ".labelMuted(Text(\"Label\"))"
                case .labelStrong:
                    ".labelStrong(Text(\"Label\"))"
                case .labelAndExtraLabel:
                    ".labelMuted(Text(\"Label\"), Text(\"extra Label\"))"
                }
            }

            private var trailingPattern: String
            {
                let trailingOptionPattern =
                    switch trailingOption {
                    case .none:
                        ""
                    case .text:
                        ".text(\(trailingTextTypePattern))"
                    case .badge:
                        ".badge(OUDSBadge(count: 1, accessibilityLabel: \"\", status: .negative, size: .medium)"
                    case .tag:
                        ".tag(OUDSTag(label: \"Label\", size: .small))"
                    case .icon:
                        ".icon(.info)"
                    case .image:
                        ".image(asset: Image(\"il_placeholder\"))"
                    #if os(iOS)
                    case .video:
                        ".video(URL(string: \"https://unified-design-system.orange.com/\")!)"
                    #endif
                    case .flag:
                        ".flag(asset: Image(decorative: \"ic_flag_FR_fr\")"
                    case .avatar:
                        ".avatar(\(avatarPattern))"
                    }

                    return trailingOption == .none ? "" : "\nlet traling: OUDSListItemTrailing = \n \(trailingOptionPattern)"
    }
}

                    // swiftlint:enable type_body_length

                    // MARK: - Enums

                    enum IconType: DesignToolboxEnumRepresentable {
                        case neutral, info, warning, negative, positive
                    }

                    enum Leading: DesignToolboxEnumRepresentable {
                        #if os(iOS)
                        case none, icon, image, video, flag, avatar
                        #else
                        case none, icon, image, flag, avatar
                        #endif
                    }

                    enum Trailing: DesignToolboxEnumRepresentable {
                        #if os(iOS)
                        case none, text, badge, tag, icon, image, video, flag, avatar
                        #else
                        case none, text, badge, tag, icon, image, flag, avatar
                        #endif
                    }

                    // MARK: - Extensions

                    extension OUDSListItemContainersAlignment: @retroactive CaseIterable {}
                    extension OUDSListItemContainersAlignment: DesignToolboxEnumRepresentable {
                        public static let allCases: [OUDSListItemContainersAlignment] = [.center, .top]
                    }

                    extension OUDSListItemSize: @retroactive CaseIterable {}
                    extension OUDSListItemSize: DesignToolboxEnumRepresentable {
                        public static let allCases: [OUDSListItemSize] = [.standard, .small]
                    }

                    extension OUDSListItemTrailing.TextType: @retroactive Equatable {}
                    extension OUDSListItemTrailing.TextType: @retroactive Hashable {}
                    extension OUDSListItemTrailing.TextType: @retroactive CaseIterable {}
                    extension OUDSListItemTrailing.TextType: DesignToolboxEnumRepresentable {
                        public static let allCases: [OUDSListItemTrailing.TextType] =
                            [
                                .label(Text("Label")),
                                .labelStrong(Text("Label")),
                                .labelMuted(Text("Label")),
                                .labelAndExtraLabel(Text("Label"), Text("Extra Label")),
                            ]

                        var formattedName: String {
                            switch self {
                            case .label:
                                "Label"
                            case .labelMuted:
                                "Label Muted"
                            case .labelStrong:
                                "Label Strong"
                            case .labelAndExtraLabel:
                                "Label and extra labe"
                            }
                        }

                        var technicalDescription: String {
                            switch self {
                            case let .label(text):
                                ".label(Text(\"\(text)\"))"
                            case let .labelMuted(text):
                                ".labelMuted(Text(\"\(text)\"))"
                            case let .labelStrong(text):
                                ".labelStrong(Text(\"\(text)\"))"
                            case let .labelAndExtraLabel(text, text2):
                                ".labelAndExtraLabel(Text(\"\(text)\"), Text(\"\(text2)\"))"
                            }
                        }

                        // MARK: Equatable

                        public static func == (lhs: OUDSListItemTrailing.TextType, rhs: OUDSListItemTrailing.TextType) -> Bool {
                            lhs.formattedName == rhs.formattedName
                        }

                        // MARK: - Hashable

                        public func hash(into hasher: inout Hasher) {
                            hasher.combine(formattedName)
                        }
                    }

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
                            case let .image(asset):
                                ".image(asset: \(String(describing: asset)))"
                            case let .initials(initials):
                                ".initials(\"\(initials)\")"
                            }
                        }

                        // MARK: Equatable

                        public static func == (lhs: OUDSListItemAvatar.AvatarType, rhs: OUDSListItemAvatar.AvatarType) -> Bool {
                            lhs.formattedName == rhs.formattedName
                        }

                        // MARK: - Hashable

                        public func hash(into hasher: inout Hasher) {
                            hasher.combine(formattedName)
                        }
                    }

                    extension OUDSListItemAvatar.Size: @retroactive CaseIterable {}
                    extension OUDSListItemAvatar.Size: DesignToolboxEnumRepresentable {
                        public static let allCases: [OUDSListItemAvatar.Size] = [.medium, .large, .extraLarge]
                    }

                    extension OUDSListItemIcon.Size: @retroactive CaseIterable {}
                    extension OUDSListItemIcon.Size: DesignToolboxEnumRepresentable {
                        public static let allCases: [OUDSListItemIcon.Size] = [.small, .medium, .large]
                    }
