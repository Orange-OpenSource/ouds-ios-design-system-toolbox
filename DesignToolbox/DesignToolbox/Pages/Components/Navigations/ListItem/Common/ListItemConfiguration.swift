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

    @Published var size: ListItemSize {
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
                "List item"
            case .card:
                "Card item"
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
        numberOfItems = 3

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
        size = .`default`
        containersAlignment = .center
        leadingOption = .none
        trailingOption = .none
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
            let label = index == 0 ? labelText : "\(labelText)_\(index)"
            switch size {
            case .small:
                return OUDSListItemSizeSmallData(
                    label: label,
                    isBoldLabel: isBoldLabel,
                    description: descriptionText.isEmpty ? nil : descriptionText,
                    helperText: helperText.isEmpty ? nil : helperText
                )
            case .default:
                return OUDSListItemSizeDefaultData(
                    label: label,
                    isBoldLabel: isBoldLabel,
                    description: descriptionText.isEmpty ? nil : descriptionText,
                    overline: overlineText.isEmpty ? nil : overlineText,
                    extraLabel: extraLabelText.isEmpty ? nil : extraLabelText,
                    helperText: helperText.isEmpty ? nil : helperText
                )
            }
        }
    }

    var listStyle: OUDSListItemContentStyle {
        isOutlined ? .outlined : .standard(divider: hasDivider, background: hasBackground)
    }

    func leading(for theme: OUDSTheme) -> OOUDSListItemLeading? {
        switch leadingOption {
        case .none:
            nil
        case .icon:
            .icon(asset: Image("ic_heart"))
        case .image:
            .image(asset: Image("il_sunset"))
        case .video:
            .video(URL(string: "https://mastermedia.orange.com/publicMedia?t=pmHGomBcoc&o=517502")!)
        case .flag:
            .flag(asset: Image("il_flag_fr"))
        }
    }

    @MainActor
    func trailing(for theme: OUDSTheme) -> OOUDSListItemTrailing? {
        switch trailingOption {
        case .none:
            return nil
        case .text:
            return OOUDSListItemTrailing.text(Text("Label"))
        case .badge:
            return OOUDSListItemTrailing.badge(OUDSBadge(count: 1, accessibilityLabel: "", status: .negative, size: .medium))
        case .tag:
            return OOUDSListItemTrailing.tag(OUDSTag(label: "Label", size: .small))
        case .icon:
            return OOUDSListItemTrailing.icon(asset: Image("ic_heart"))
        case .image:
            return OOUDSListItemTrailing.image(asset: Image("il_sunset"))
        case .video:
            return OOUDSListItemTrailing.video(URL(string: "https://mastermedia.orange.com/publicMedia?t=pmHGomBcoc&o=517502")!)
        case .flag:
            return OOUDSListItemTrailing.flag(asset: Image("il_flag_fr"))
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

// MARK: - ListItem Configuration

struct ListItemTextsCommonConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        DesignToolboxEditContentDisclosure {
            DesignToolboxTextField(text: $configurationModel.labelText, label: "app_components_common_label_tech")

            if configurationModel.size == .default {
                DesignToolboxTextField(text: $configurationModel.overlineText, label: "app_components_listItem_overline_tech")

                DesignToolboxTextField(text: $configurationModel.extraLabelText, label: "app_components_controlItem_extraLabel_tech")
            }

            DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")

            DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")
        }
    }
}

struct ListItemCommonConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSChipPicker(title: "app_components_common_type_tech".localized(),
                       selection: $configurationModel.`type`,
                       chips: ListItemConfigurationModel.ListType.chips)

        Divider().horizontal()

        OUDSChipPicker(title: "app_components_listItem_leading_tech".localized(),
                       selection: $configurationModel.leadingOption,
                       chips: Leading.chips)

        OUDSChipPicker(title: "app_components_listItem_trailing_tech".localized(),
                       selection: $configurationModel.trailingOption,
                       chips: Trailing.chips)

        if !(configurationModel.leadingOption == .none)
            || !(configurationModel.trailingOption == .none) {
            OUDSChipPicker(title: "app_components_listItem_alignment_tech".localized(),
                           selection: $configurationModel.containersAlignment,
                           chips: OUDSListItemContainersAlignment.chips)

            if configurationModel.needRoundedMediaOption {
                OUDSSwitchItem("app_components_listItem_roundedMedia_tech", isOn: $configurationModel.roundedMedia)
            }
        }

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

        OUDSChipPicker(title: "app_components_listItem_size_tech".localized(),
                       selection: $configurationModel.size,
                       chips: ListItemSize.chips)

        Divider().horizontal()

        OUDSSwitchItem("app_components_listItem_boldLabel_tech", isOn: $configurationModel.isBoldLabel)


        OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

        Stepper("app_components_common_itemCount_label" <- "\($configurationModel.numberOfItems.wrappedValue)",
                value: $configurationModel.numberOfItems)
            .padding(.all, theme.spaces.fixedMedium)
            .labelStrongMedium(theme)

        Divider().horizontal()
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

enum ListItemSize: CaseIterable, CustomStringConvertible {
    case small
    case `default`

    var description: String {
        switch self {
        case .small:
            return "Small"
        case .default:
            return "Default"
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

    var description: String {
        switch self {
        case .none:
            return "None"
        case .icon:
            return "Icon"
        case .image:
            return "Image"
        case .video:
            return "Video"
        case .flag:
            return "Flag"
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

    var description: String {
        switch self {
        case .none:
            return "None"
        case .text:
            return "Text"
        case .badge:
            return "Badge"
        case .tag:
            return "Tag"
        case .icon:
            return "Icon"
        case .image:
            return "Image"
        case .video:
            return "Video"
        case .flag:
            return "Flag"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
