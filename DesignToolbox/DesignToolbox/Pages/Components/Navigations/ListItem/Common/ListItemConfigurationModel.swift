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

    // MARK: - Published properties

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

    @Published var labelContentType: LabelContentType {
        didSet { updateCode() }
    }

    @Published var itemSize: OUDSListItemSize {
        didSet { updateCode() }
    }

    @Published var containersAlignment: OUDSListItemContainersAlignment {
        didSet { updateCode() }
    }

    @Published var type: ListType {
        didSet { updateCode() }
    }

    @Published var contentCardStyleOption: ContentCardStyle {
        didSet { updateCode() }
    }

    @Published var contentStandardStyleOption: ContentStandardStyle {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
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

    @Published var imageSize: OUDSListItemImage.Size {
        didSet { updateCode() }
    }

    @Published var flagSize: OUDSListItemFlag.Size {
        didSet { updateCode() }
    }

    @Published var iconType: IconType {
        didSet { updateCode() }
    }

    @Published var iconSize: OUDSListItemIcon.Size {
        didSet { updateCode() }
    }

    #if os(iOS) && canImport(UIKit)
    @Published var videoSize: OUDSListItemVideo.Size {
        didSet { updateCode() }
    }
    #endif

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

    // MARK: - Properties

    var componentInitCode: String = "OUDSStaticListItem"

    // MARK: - Label Content Type

    enum LabelContentType: CaseIterable, CustomStringConvertible {
        case text
        case customView

        var description: String {
            switch self {
            case .text:
                "Text"
            case .customView:
                "Custom View"
            }
        }

        var chipData: OUDSChipPickerData<Self> {
            OUDSChipPickerData(tag: self, layout: .text(text: description))
        }

        static var chips: [OUDSChipPickerData<Self>] {
            allCases.map(\.chipData)
        }
    }

    // MARK: - List type

    enum ListType: DesignToolboxEnumLocalizedRepresentable {
        case standard, card

        var wordingKey: String {
            switch self {
            case .standard:
                "app_components_listItem_itemType_tech"
            case .card:
                "app_components_listItem_cardType_tech"
            }
        }
    }

    // MARK: - Initializer

    override init() {
        type = .standard
        contentCardStyleOption = .background
        contentStandardStyleOption = .backgroundOnInteraction
        hasDivider = true

        numberOfItems = 1

        // Item content
        labelText = String(localized: "app_components_common_label_label")
        labelContentType = .text

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
        trailingOption = .none
        trailingTextType = .label(Text(OUDSListItemTrailing.TextType.labelValue))

        avatarType = .icon
        avatarSize = .medium
        avatarBadgeOption = false

        imageSize = .medium
        flagSize = .medium

        iconType = .negative
        bageOnNeutralIcon = false
        iconSize = .medium

        #if os(iOS) && canImport(UIKit)
        videoSize = .medium
        #endif

        roundedMedia = false

        hasSlot = false

        super.init()
    }

    deinit {}

    // MARK: - Data

    var dataItems: [OUDSListItemData] {
        (0 ..< numberOfItems).map { index in
            let currentLabel = index == 0 ? labelText : "\(labelText) \(index + 1)"
            switch labelContentType {
            case .text:
                return OUDSListItemData(
                    label: currentLabel,
                    isBoldLabel: isBoldLabel,
                    description: descriptionText.isEmpty ? nil : descriptionText,
                    overline: overlineText.isEmpty ? nil : overlineText,
                    extraLabel: extraLabelText.isEmpty ? nil : extraLabelText,
                    helperText: helperText.isEmpty ? nil : helperText)
            case .customView:
                return OUDSListItemData(
                    label: Self.customLabelView(text: currentLabel),
                    accessibilityLabel: currentLabel,
                    description: descriptionText.isEmpty ? nil : descriptionText,
                    overline: overlineText.isEmpty ? nil : overlineText,
                    extraLabel: extraLabelText.isEmpty ? nil : extraLabelText,
                    helperText: helperText.isEmpty ? nil : helperText)
            }
        }
    }

    /// Builds the custom view used as label when `labelContentType` is `.customView`.
    /// Displays a star icon followed by the label text and a chevron icon.
    static func customLabelView(text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .accessibilityHidden(true)
            Text(text)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(.secondary)
                .accessibilityHidden(true)
        }
    }

    @MainActor
    func slot() -> some View {
        OUDSInlineAlert(label: "Label", status: .warning)
    }

    // swiftlint:disable force_unwrapping
    @MainActor
    func leading(for theme: OUDSTheme) -> OUDSListItemLeading? {
        switch leadingOption {
        case .none:
            return nil
        case .icon:
            return .icon(icon(for: theme))
        case .image:
            return .image(.init(asset: Image.placeholderImage(),
                                size: imageSize,
                                description: "Image description"))
        case .flag:
            return .flag(.init(asset: Image(decorative: "il_flag_fr"), size: flagSize))
        case .avatar:
            return .avatar(.init(type: avatarType,
                                 size: avatarSize,
                                 badgeType: avatarBadgeOption ? .standard(.negative) : nil))
        #if os(iOS) && canImport(UIKit)
        case .video:
            return .video(.init(url: URL(string: String.defaultVideoUrl())!, autoplay: true, muted: true, size: videoSize))
        #endif
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
            return .badge(.count(.init(1,
                                       accessibilityLabel: "1",
                                       status: .negative,
                                       size: .medium)))
        case .tag:
            return .tag(.init(label: "Label", size: .small))
        case .icon:
            return .icon(icon(for: theme))
        case .image:
            return .image(.init(asset: Image.placeholderImage(),
                                size: imageSize,
                                description: "Image description"))
        #if os(iOS) && canImport(UIKit)
        case .video:
            return .video(.init(url: URL(string: String.defaultVideoUrl())!, autoplay: true, muted: true, size: videoSize))
        #endif
        case .flag:
            return .flag(.init(asset: Image(decorative: "il_flag_fr"), size: flagSize))
        case .avatar:
            return .avatar(.init(type: avatarType,
                                 size: avatarSize,
                                 badgeType: avatarBadgeOption ? .standard(.negative) : nil))
        }
    }

    @MainActor
    private func icon(for theme: OUDSTheme) -> OUDSListItemIcon {
        let type: OUDSListItemIcon.IconType =
            switch iconType {
            case .neutral:
                .neutral(
                    asset: Image(
                        decorative: "ic_heart",
                        bundle: theme.resourcesBundle),
                    badge: bageOnNeutralIcon)
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

    var needRoundedMediaOption: Bool {
        let leadingMedia =
            switch leadingOption {
            case .image:
                true
            #if os(iOS)
            case .video:
                true
            #endif
            default:
                false
            }

            let trailingMedia =
                switch trailingOption {
                case .image:
                    true
                #if os(iOS) && canImport(UIKit)
                case .video:
                    true
                #endif
                default:
                    false
                }

                return leadingMedia || trailingMedia
    }

                var contentStyle: OUDSListItemContentStyle {
                    switch type {
                    case .standard:
                        let style: OUDSListItemContentStyle.Standard = switch contentStandardStyleOption {
                        case .background:
                            .background(wthDivider: hasDivider)
                        case .backgroundOnInteraction:
                            .backgroundOnInteractionOnly(withDivider: hasDivider)
                        }

                        return .standard(style)
                    case .card:
                        let style: OUDSListItemContentStyle.Card = switch contentCardStyleOption {
                        case .outlined:
                            .outlined
                        case .outlinedOnInteraction:
                            .outlinedOnInteractionOnly
                        case .background:
                            .background(wthDivider: hasDivider)
                        case .backgroundOnInteraction:
                            .backgroundOnInteractionOnly(withDivider: hasDivider)
                        }

                        return .card(style)
                    }
                }

                // MARK: - Code generation

                override func updateCode() {
                    let leadingPart = leadingPattern.isEmpty ? "" : ", leading: leading"
                    let trailingPart = trailingPattern.isEmpty ? "" : ", trailing: trailing"

                    code = """
                    \(dataPattern) \(leadingPattern) \(trailingPattern)

                    \(componentInitCode)(data: data\(slotPattern)\(leadingPart)\(trailingPart))
                    \(styleModifierPattern)\(sizeModifierPattern)\(containersAlignmentPattern)\(roundedMediaPattern)
                    \(disableCodePattern)
                    """
                }

                var disableCodePattern: String {
                    !enabled ? ".disabled(true)" : ""
                }

                var dataPattern: String {
                    switch labelContentType {
                    case .text:
                        """
                        let data = OUDSListItemData(\(labelPattern)\(isBoldLabelPattern)\(descriptionPattern)\(overlinePattern)\(extraLabelPattern)\(helperTextPattern))
                        """
                    case .customView:
                        """
                        let customLabel = HStack {
                            Image(systemName: "star.fill")
                            Text("\(labelText)")
                            Spacer()
                            Image(systemName: "chevron.right.circle.fill")
                        }
                        let data = OUDSListItemData(label: customLabel, accessibilityLabel: "\(labelText)"\(descriptionPattern)\(overlinePattern)\(extraLabelPattern)\(helperTextPattern))
                        """
                    }
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

                private var styleModifierPattern: String {
                    if type == .card {
                        ".oudsListItemCardStyle(\(cardStylePattern))"
                    } else {
                        ".oudsListItemStandardStyle(\(standardStylePattern))"
                    }
                }

                private var standardStylePattern: String {
                    switch contentStandardStyleOption {
                    case .background:
                        ".background(divider: \(hasDivider))"
                    case .backgroundOnInteraction:
                        ".backgroundOnInteractionOnly(divider: \(hasDivider))"
                    }
                }

                private var cardStylePattern: String {
                    switch contentCardStyleOption {
                    case .outlined:
                        ".outlined"
                    case .outlinedOnInteraction:
                        ".outlinedOnInteractionOnly"
                    case .background:
                        ".background(divider: \(hasDivider))"
                    case .backgroundOnInteraction:
                        ".backgroundOnInteractionOnly(divider: \(hasDivider))"
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
                    itemSize == .standard
                        ? "" : "\n.oudsListItemSize(\(itemSize.technicalDescription))"
                }

                private var containersAlignmentPattern: String {
                    "\n.oudsListItemContainerAlignment(\(containersAlignment.technicalDescription))"
                }

                private var iconPattern: String {
                    let imagePattern = "Image(decorative: \"ic_heart\")"
                    let typePattern =
                        switch iconType {
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

                private var imagePattern: String {
                    ".init(asset; \"\(Image.placeholderImageSample())\", description: \"Image description\", size: \(imageSize.technicalDescription))"
                }

                private var flagPattern: String {
                    ".init(asset: Image(\"ic_flag_FR_fr\"), size: \(flagSize.technicalDescription))"
                }

                private var avatarPattern: String {
                    ".init(type: \(avatarType.technicalDescription), size: \(avatarSize.technicalDescription))"
                }

                private var slotPattern: String {
                    hasSlot ? ", slot: someView()" : ""
                }

                private var badgePattern: String {
                    ".count(.init(1, accessibilityLabel: \"1\", status: .negative, size: .medium)))"
                }

                private var leadingPattern: String
                {
                    let leadingOptionPatter =
                        switch leadingOption {
                        case .none:
                            ""
                        case .icon:
                            ".icon(\(iconPattern)"
                        case .image:
                            ".image(\(imagePattern)"
                        #if os(iOS) && canImport(UIKit)
                        case .video:
                            ".video(URL(string: \"\(String.defaultVideoUrl())\")!, autoplay: true)"
                        #endif
                        case .flag:
                            ".flag(\(flagPattern))"
                        case .avatar:
                            ".avatar(\(avatarPattern))"
                        }

                        return leadingOption == .none
                            ? ""
                            : "\n\nlet leading: OUDSListItemLeading = \n \(leadingOptionPatter)"
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
                                    ".badge(\(badgePattern))"
                                case .tag:
                                    ".tag(OUDSTag(label: \"Label\", size: .small))"
                                case .icon:
                                    ".icon(.info)"
                                case .image:
                                    ".image(\(imagePattern))"
                                #if os(iOS) && canImport(UIKit)
                                case .video:
                                    ".video(URL(string: \"\(String.defaultVideoUrl())\")!, autoplay: true)"
                                #endif
                                case .flag:
                                    ".flag(\(flagPattern))"
                                case .avatar:
                                    ".avatar(\(avatarPattern))"
                                }

                                return trailingOption == .none
                                    ? ""
                                    : "\n\nlet trailing: OUDSListItemTrailing = \n \(trailingOptionPattern)"
    }
}

                                // swiftlint:enable type_body_length

                                // MARK: - Enums

                                enum ContentCardStyle: DesignToolboxEnumRepresentable {
                                    case outlined, outlinedOnInteraction, background, backgroundOnInteraction
                                }

                                enum ContentStandardStyle: DesignToolboxEnumRepresentable {
                                    case background, backgroundOnInteraction
                                }

                                enum IconType: DesignToolboxEnumRepresentable {
                                    case neutral, info, warning, negative, positive
                                }

                                enum Leading: DesignToolboxEnumRepresentable {
                                    #if os(iOS) && canImport(UIKit)
                                    case none, icon, image, video, flag, avatar
                                    #else
                                    case none, icon, image, flag, avatar
                                    #endif
                                }

                                enum Trailing: DesignToolboxEnumRepresentable {
                                    #if os(iOS) && canImport(UIKit)
                                    case none, text, badge, tag, icon, image, video, flag, avatar
                                    #else
                                    case none, text, badge, tag, icon, image, flag, avatar
                                    #endif
                                }

                                // MARK: - Extensions of OUDSListItemContainersAlignment

                                extension OUDSListItemContainersAlignment: @retroactive CaseIterable {}
                                extension OUDSListItemContainersAlignment: DesignToolboxEnumRepresentable {
                                    public static let allCases: [OUDSListItemContainersAlignment] = [
                                        .center, .top,
                                    ]
                                }

                                // MARK: - Extensions of OUDSListItemSize

                                extension OUDSListItemSize: @retroactive CaseIterable {}
                                extension OUDSListItemSize: DesignToolboxEnumRepresentable {
                                    public static let allCases: [OUDSListItemSize] = [.standard, .small]
                                }

                                // MARK: - Extensions of OUDSListItemTrailing.TextType

                                extension OUDSListItemTrailing.TextType: @retroactive Equatable {}
                                extension OUDSListItemTrailing.TextType: @retroactive Hashable {}
                                extension OUDSListItemTrailing.TextType: @retroactive CaseIterable {}
                                extension OUDSListItemTrailing.TextType: DesignToolboxEnumRepresentable {

                                    // Tricks to avoid to have Xcode ffiding these Strings and definied localizables with Text()
                                    static let labelValue = "Label"
                                    static let extraLabelValue = "Extra Label"

                                    public static let allCases: [OUDSListItemTrailing.TextType] =
                                        [
                                            .label(Text(Self.labelValue)),
                                            .labelStrong(Text(Self.labelValue)),
                                            .labelMuted(Text(Self.labelValue)),
                                            .labelAndExtraLabel(Text(Self.labelValue), Text(Self.extraLabelValue)),
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
                                            "Label and extra label"
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

                                    public static func == (
                                        lhs: OUDSListItemTrailing.TextType,
                                        rhs: OUDSListItemTrailing.TextType) -> Bool
                                    {
                                        lhs.formattedName == rhs.formattedName
                                    }

                                    public func hash(into hasher: inout Hasher) {
                                        hasher.combine(formattedName)
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
                                            ".image(asset: \"\(Image.placeholderImageSample())\")"
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

                                enum AvatarBadgeType: DesignToolboxEnumRepresentable {
                                    case none, standard, icon, image
                                }

                                // MARK: - Extensions of OUDSListItemIcon.Size

                                extension OUDSListItemIcon.Size: @retroactive CaseIterable {}
                                extension OUDSListItemIcon.Size: DesignToolboxEnumRepresentable {
                                    public static let allCases: [OUDSListItemIcon.Size] = [.medium, .large]
                                }

                                // MARK: - Extensions of OUDSListItemImage.Size

                                extension OUDSListItemImage.Size: @retroactive CaseIterable {}
                                extension OUDSListItemImage.Size: DesignToolboxEnumRepresentable {
                                    public static let allCases: [OUDSListItemImage.Size] = [
                                        .medium, .large, .extraLarge,
                                    ]
                                }

                                // MARK: - Extensions of OUDSListItemFlag.Size

                                extension OUDSListItemFlag.Size: @retroactive CaseIterable {}
                                extension OUDSListItemFlag.Size: DesignToolboxEnumRepresentable {
                                    public static let allCases: [OUDSListItemFlag.Size] = [
                                        .medium, .large, .extraLarge,
                                    ]
                                }

                                // MARK: - Extensions of OUDSListItemVideo.Size

                                #if os(iOS) && canImport(UIKit)
                                extension OUDSListItemVideo.Size: @retroactive CaseIterable {}
                                extension OUDSListItemVideo.Size: DesignToolboxEnumRepresentable {
                                    public static let allCases: [OUDSListItemVideo.Size] = [
                                        .medium, .large, .extraLarge,
                                    ]
                                }
                                #endif
