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

// MARK: - ListItem Configuration Model

class ListItemConfigurationModel: ComponentConfiguration {

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

    @Published var iconSize: OUDSLIstItemIcon.Size {
        didSet { updateCode() }
    }

    @Published var bageOnNeutralIcon: Bool {
        didSet { updateCode() }
    }

    @Published var roundedMedia: Bool {
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
                "app_components_listItem_item_tech"
            case .card:
                "app_components_listItem_card_tech"
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

        isOutlined = false
        hasDivider = true
        hasBackground = false

        super.init()
    }

    deinit {}

    // MARK: - Data

    var dataItems: [OUDSListItemData] {
        (0..<numberOfItems).map { index in
            OUDSListItemData(
                label: index == 0 ? labelText : "\(labelText)_\(index)",
                isBoldLabel: isBoldLabel,
                description: descriptionText.isEmpty ? nil : descriptionText,
                overline: overlineText.isEmpty ? nil : overlineText,
                extraLabel: extraLabelText.isEmpty ? nil : extraLabelText,
                helperText: helperText.isEmpty ? nil : helperText
            )
        }
    }

    var listStyle: OUDSListItemContentStyle {
        isOutlined ? .outlined : .standard(divider: hasDivider, background: hasBackground)
    }

    @MainActor
    func leading(for theme: OUDSTheme) -> OOUDSListItemLeading? {
        switch leadingOption {
        case .none:
            return nil
        case .icon:
            return .icon(icon(for: theme))
        case .image:
            return .image(asset: Image("il_placeholder"))
        case .video:
            return .video(URL(string: "https://mastermedia.orange.com/publicMedia?t=pmHGomBcoc&o=517502")!)
        case .flag:
            return .flag(asset: Image("il_flag_fr"))
        case .avatar:
            return .avatar(OUDSListItemAvatar(type: avatarType,
                                              size: avatarSize,
                                              badge: avatarBadge))
        }
    }

    @MainActor
    func trailing(for theme: OUDSTheme) -> OUDSListItemTrailing? {
        switch trailingOption {
        case .none:
            return nil
        case .text:
            return .text(trailingTextType)
        case .badge:
            return .badge(OUDSBadge(count: 1, accessibilityLabel: "", status: .negative, size: .medium))
        case .tag:
            return .tag(OUDSTag(label: "Label", size: .small))
        case .icon:
            return .icon(icon(for: theme))
        case .image:
            return .image(asset: Image("il_placeholder"))
        case .video:
            return .video(URL(string: "https://mastermedia.orange.com/publicMedia?t=pmHGomBcoc&o=517502")!)
        case .flag:
            return .flag(asset: Image("il_flag_fr"))
        case .avatar:
            return .avatar(OUDSListItemAvatar(type: avatarType,
                                              size: avatarSize,
                                              badge: avatarBadge))
        }
    }

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
    private func icon(for theme: OUDSTheme) -> OUDSLIstItemIcon {
        let type: OUDSLIstItemIcon.IconType = switch iconType {
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

        return OUDSLIstItemIcon(type: type, size: iconSize)
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
            case .image, .video:
                true
            default:
                false
        }

        let trailingMedia = switch trailingOption {
        case .image, .video:
            true
        default:
            false
        }

        return leadingMedia || trailingMedia
    }

    // MARK: - Code generation

    var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    var labelPattern: String {
        "label: \"\(labelText)\""
    }
    var isBoldLabelPattern: String {
        isBoldLabel ? ", isBoldLabel: true" : ""
    }

    var overlinePattern: String {
        overlineText.isEmpty ? "" : ", overline: \"\(overlineText)\""
    }

    var extraLabelPattern: String {
        extraLabelText.isEmpty ? "" : ", extraLabel: \"\(extraLabelText)\""
    }

    var descriptionPattern: String {
        descriptionText.isEmpty ? "" : ", description: \"\(descriptionText)\""
    }

    var helperTextPattern: String {
        helperText.isEmpty ? "" : ", helperText: \"\(helperText)\""
    }

    private var isOutlinedPattern: String {
        isOutlined ? ", isOutlined: true" : ""
    }

    private var hasDividerPattern: String {
        hasDivider ? ", hasDivider: true" : ""
    }

    var styleModifierPettern: String {
        switch type {
        case .item:
            itemStyleModifierPettern
        case .card:
            cardStyleModifierPettern
        }
    }

    var sizeModifierPattern: String {
        let sizePattern = String(describing: itemSize)
        return ".oudsListItemSize(.\(sizePattern))"
    }

    private var cardStyleModifierPettern: String {
        """
            .oudsListItemStyle(style: \(listStyle),
                               containersAlignment: \(containersAlignment))
        """
    }

    private var itemStyleModifierPettern: String {
        """
            .oudsListCardStyle(hasDdivider: \(hasDivider),
                               hasBackground: \(hasBackground),
                               containersAlignment: \(containersAlignment))
            """
    }
}

extension OUDSListItemContainersAlignment: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    public static let allCases: [OUDSListItemContainersAlignment] = [.center, .top]

    public var description: String {
        switch self {
        case .center:
            "Center"
        case .top:
            "Top"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSListItemSize: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public static let allCases: [OUDSListItemSize] = [.standard, .small]

    public var description: String {
        switch self {
        case .standard:
            return "Standard"
        case .small:
            return "Small"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

enum Leading: CaseIterable, CustomStringConvertible {
    case none
    case icon
    case image
    case video
    case flag
    case avatar

    var description: String {
        switch self {
        case .none:
            "None"
        case .icon:
            "Icon"
        case .image:
            "Image"
        case .video:
            "Video"
        case .flag:
            "Flag"
        case .avatar:
            "Avatar"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

enum Trailing: CaseIterable, CustomStringConvertible {
    case none
    case text
    case badge
    case tag
    case icon
    case image
    case video
    case flag
    case avatar

    var description: String {
        switch self {
        case .none:
            "None"
        case .text:
            "Text"
        case .badge:
            "Badge"
        case .tag:
            "Tag"
        case .icon:
            "Icon"
        case .image:
            "Image"
        case .video:
            "Video"
        case .flag:
            "Flag"
        case .avatar:
            "Avatar"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSListItemTrailing.TextType: @retroactive Equatable {}
extension OUDSListItemTrailing.TextType: @retroactive Hashable {}
extension OUDSListItemTrailing.TextType: @retroactive CustomStringConvertible, @retroactive CaseIterable {
    public static let allCases: [OUDSListItemTrailing.TextType] =
        [
            .label(Text("Label")),
            .labelStrong(Text("Label")),
            .labelMuted(Text("Label")),
            .labelAndExtraLabel(Text("Label"), Text("Extra Label"))
        ]

    public var description: String {
        switch self {
        case .label:
            return "Label"
        case .labelStrong:
            return "Label Strong"
        case .labelMuted:
            return "Label Muted"
        case .labelAndExtraLabel:
            return "Label and Extra Label"
        }
    }

    // MARK: Equatable

    public static func == (lhs: OUDSListItemTrailing.TextType, rhs: OUDSListItemTrailing.TextType) -> Bool {
        lhs.description == rhs.description
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSListItemAvatar.AvatarType: @retroactive Equatable {}
extension OUDSListItemAvatar.AvatarType: @retroactive Hashable {}
extension OUDSListItemAvatar.AvatarType: @retroactive CustomStringConvertible, @retroactive CaseIterable {

    public static let allCases: [OUDSListItemAvatar.AvatarType] =
        [
            .icon,
            .image(Image(decorative: "il_placeholder")),
            .initials("MT")
        ]

    public var description: String {
        switch self {
        case .icon:
            "Icon"
        case .image:
            "Image"
        case .initials:
            "Initials"
        }
    }

    // MARK: Equatable

    public static func == (lhs: OUDSListItemAvatar.AvatarType, rhs: OUDSListItemAvatar.AvatarType) -> Bool {
        lhs.description == rhs.description
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSListItemAvatar.Size: @retroactive CustomStringConvertible, @retroactive CaseIterable {

    public static let allCases: [OUDSListItemAvatar.Size] = [ .medium, .large, .extraLarge ]

    public var description: String {
        switch self {
        case .medium:
            "Medium"
        case .large:
            "Large"
        case .extraLarge:
            "Extra Large"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

enum IconType: CustomStringConvertible, CaseIterable {

    case neutral, info, warning, negative, positive

    public var description: String {
        switch self {
        case .neutral:
            "Neutral"
        case .info:
            "Info"
        case .warning:
            "Warning"
        case .negative:
            "Negative"
        case .positive:
            "Positive"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSLIstItemIcon.Size: @retroactive CustomStringConvertible, @retroactive CaseIterable {
    public static let allCases: [OUDSLIstItemIcon.Size] = [.small, .medium, .large]

    public var description: String {
        switch self {
        case .small:
            "Small"
        case .medium:
            "Medium"
        case .large:
            "Large"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
