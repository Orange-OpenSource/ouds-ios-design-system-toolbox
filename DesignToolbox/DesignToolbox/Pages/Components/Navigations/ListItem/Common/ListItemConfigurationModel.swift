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

// MARK: - List Item Configuration Model

open class ListItemConfigurationModel: ComponentConfiguration {

    // MARK: - Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var containersAlignment: OUDSListItemContainersAlignment {
        didSet { updateCode() }
    }

    @Published var contentStyleOption: ListContentStyle {
        didSet { updateCode() }
    }

    @Published var contentCardDecorationOption: ListItemContentCardStyle {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
        didSet { updateCode() }
    }

    @Published var hasBackground: Bool {
        didSet { updateCode() }
    }

    @Published var outlinedOnInteractionOnly: Bool {
        didSet { updateCode() }
    }

    @Published var roundedMedia: Bool {
        didSet { updateCode() }
    }

    @Published var numberOfItems: Int

    @Published var itemSize: OUDSListItemSize {
        didSet {
            textsModel.itemSize = itemSize
            leadingModel.itemSize = itemSize
            trailingModel.itemSize = itemSize
            updateCode()
        }
    }

    // MARK: - Properties

    var textsModel: ListItemTextsConfigurationModel
    var leadingModel: ListItemLeadingConfigurationModel
    var trailingModel: ListItemTrailingConfigurationModel
    var componentInitCode: String = "OUDSStaticListItem"

    // MARK: - List type

    enum ListContentStyle: DesignToolboxEnumLocalizedRepresentable {
        case item, card

        var wordingKey: String {
            switch self {
            case .item:
                "app_components_listItem_itemType_tech"
            case .card:
                "app_components_listItem_cardType_tech"
            }
        }
    }

    // MARK: - Initializer

    override init() {
        // Item Style
        contentStyleOption = .item
        contentCardDecorationOption = .strandard
        hasDivider = true
        hasBackground = true
        outlinedOnInteractionOnly = false

        itemSize = .default
        containersAlignment = .center

        // Item interaction
        enabled = true

        // Nested elements
        textsModel = ListItemTextsConfigurationModel(itemSize: .default)
        trailingModel = ListItemTrailingConfigurationModel(itemSize: .default)
        leadingModel = ListItemLeadingConfigurationModel(itemSize: .default)

        roundedMedia = false
        numberOfItems = 1

        super.init()

        register(textsModel)
        register(trailingModel)
        register(leadingModel)
    }

    deinit {}

    // MARK: - Data

    @MainActor
    var dataItems: [OUDSListItemData] {
        (0 ..< numberOfItems).map { index in
            buildDataItem(for: index)
        }
    }

    @MainActor
    private func buildDataItem(for index: Int) -> OUDSListItemData {
        let currentLabel = index == 0 ? textsModel.labelText : "\(textsModel.labelText) \(index + 1)"
        let slot: OUDSListItemData.Slot? = textsModel.hasSlot ? OUDSListItemData.Slot { textsModel.textSlot() } : nil
        let bottomSlot: OUDSListItemData.Slot? = textsModel.hasBottomSlot ? OUDSListItemData.Slot { textsModel.bottomSlot() } : nil

        if textsModel.overlineTextMode == .rich {
            let richOverline: AttributedString? = textsModel.overlineText.isEmpty ? nil : (try? AttributedString(markdown: textsModel.overlineText))
            return buildDataItemWithRichOverline(currentLabel: currentLabel, overline: richOverline, slot: slot, bottomSlot: bottomSlot)
        } else {
            let rawOverline: String? = textsModel.overlineText.isEmpty ? nil : textsModel.overlineText
            return buildDataItemWithRawOverline(currentLabel: currentLabel, overline: rawOverline, slot: slot, bottomSlot: bottomSlot)
        }
    }

    @MainActor
    private func buildDataItemWithRawOverline(currentLabel: String, overline: String?, slot: OUDSListItemData.Slot?, bottomSlot: OUDSListItemData.Slot?) -> OUDSListItemData {
        switch textsModel.labelContentType {
        case .text:
            OUDSListItemData(
                label: currentLabel,
                hasBoldLabel: textsModel.hasBoldLabel,
                description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                overline: overline,
                extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                helperText: textsModel.helperText.isEmpty ? nil : textsModel.helperText,
                textSlot: slot,
                bottomSlot: bottomSlot)
        case .customView:
            OUDSListItemData(
                label: textsModel.customLabelView,
                accessibilityLabel: currentLabel,
                description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                overline: overline,
                extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                helperText: textsModel.helperText.isEmpty ? nil : textsModel.helperText,
                textSlot: slot,
                bottomSlot: bottomSlot)
        }
    }

    @MainActor
    private func buildDataItemWithRichOverline(
        currentLabel: String,
        overline: AttributedString?,
        slot: OUDSListItemData.Slot?,
        bottomSlot: OUDSListItemData.Slot?) -> OUDSListItemData
    {
        let safeOverline = overline ?? AttributedString("")
        switch textsModel.labelContentType {
        case .text:
            return OUDSListItemData(
                label: currentLabel,
                overline: safeOverline,
                hasBoldLabel: textsModel.hasBoldLabel,
                description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                helperText: textsModel.helperText.isEmpty ? nil : textsModel.helperText,
                textSlot: slot,
                bottomSlot: bottomSlot)
        case .customView:
            return OUDSListItemData(
                label: textsModel.customLabelView,
                accessibilityLabel: currentLabel,
                overline: safeOverline,
                description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                helperText: textsModel.helperText.isEmpty ? nil : textsModel.helperText,
                textSlot: slot,
                bottomSlot: bottomSlot)
        }
    }

    var needRoundedMediaOption: Bool {
        leadingModel.needRoundedMediaOption || trailingModel.needRoundedMediaOption
    }

    var contentStyle: OUDSListItemContentStyle {
        switch contentStyleOption {
        case .item:
            .item(divider: hasDivider, background: hasBackground)
        case .card:
            switch contentCardDecorationOption {
            case .outlined:
                .card(.outlined(onlyOnInteraction: outlinedOnInteractionOnly))
            case .strandard:
                .card(.standard(divider: hasDivider, background: hasBackground))
            }
        }
    }

    // MARK: - Code generation

    override func updateCode() {
        let leadingPart = leadingModel.code.isEmpty ? "" : ", leading: leading"
        let trailingPart = trailingModel.code.isEmpty ? "" : ", trailing: trailing"

        code = """
        \(dataPattern) \(leadingModel.code) \(trailingModel.code)

        \(componentInitCode)(data: data\(slotPattern)\(leadingPart)\(trailingPart))
        \(styleModifierPattern)\(sizeModifierPattern)\(containersAlignmentPattern)\(roundedMediaPattern)
        \(disableCodePattern)
        """
    }

    var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    var dataPattern: String {
        switch textsModel.labelContentType {
        case .text:
            """
            let data = OUDSListItemData(\(textsModel.code))
            """
        case .customView:
            """
            \(textsModel.customLabelPattern)
            let data = OUDSListItemData(\(textsModel.code))
            """
        }
    }

    private var styleModifierPattern: String {
        if contentStyleOption == .card {
            let cardDecorationPattern = switch contentCardDecorationOption {
            case .outlined:
                ".outlined(onlyOnInteraction: \(outlinedOnInteractionOnly))"
            case .strandard:
                ".standard(\(dividerPattern), \(backgroundPattern))"
            }

            return ".oudsListCardStyle(\(cardDecorationPattern))"
        } else {
            return ".oudsListItemStyle(\(dividerPattern), \(backgroundPattern))"
        }
    }

    private var backgroundPattern: String {
        "background: \(hasBackground)"
    }

    private var dividerPattern: String {
        "divider: \(hasDivider)"
    }

    private var roundedMediaPattern: String {
        needRoundedMediaOption ? "\n.oudsListItemRoundedMedia(\(roundedMedia))" : ""
    }

    private var sizeModifierPattern: String {
        itemSize == .default
            ? "" : "\n.oudsListItemSize(\(itemSize.technicalDescription))"
    }

    private var containersAlignmentPattern: String {
        "\n.oudsListItemContainerAlignment(\(containersAlignment.technicalDescription))"
    }

    private var slotPattern: String {
        var pattern = ""
        if textsModel.hasSlot {
            pattern += ", textSlot: someView()"
        }
        if textsModel.hasBottomSlot {
            pattern += ", bottomSlot: someView()"
        }
        return pattern
    }
}

// MARK: - List Item Content Card Style

enum ListItemContentCardStyle: DesignToolboxEnumRepresentable {
    case outlined, strandard
}

// MARK: - Extensions of OUDSListItemContainersAlignment

extension OUDSListItemContainersAlignment: @retroactive CaseIterable {}
extension OUDSListItemContainersAlignment: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemContainersAlignment] = [
        .center, .top,
    ]
}
