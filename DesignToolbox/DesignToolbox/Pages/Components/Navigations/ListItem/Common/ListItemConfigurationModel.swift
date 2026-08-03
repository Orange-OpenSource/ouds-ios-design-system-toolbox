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

    @Published var helperText: String {
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
        // Item Style
        type = .standard
        contentCardStyleOption = .background
        contentStandardStyleOption = .backgroundOnInteraction
        hasDivider = true

        itemSize = .standard
        containersAlignment = .center

        // Item interaction
        enabled = true

        // Nested elements
        textsModel = ListItemTextsConfigurationModel(itemSize: .standard)
        trailingModel = ListItemTrailingConfigurationModel(itemSize: .standard)
        leadingModel = ListItemLeadingConfigurationModel(itemSize: .standard)

        helperText = ""
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
            let currentLabel = index == 0 ? textsModel.labelText : "\(textsModel.labelText) \(index + 1)"
            switch textsModel.labelContentType {
            case .text:
                return OUDSListItemData(
                    label: currentLabel,
                    hasBoldLabel: textsModel.hasBoldLabel,
                    description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                    overline: textsModel.overlineText.isEmpty ? nil : textsModel.overlineText,
                    extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                    helperText: helperText.isEmpty ? nil : helperText)
            case .customView:
                return OUDSListItemData(
                    label: textsModel.customLabelView,
                    accessibilityLabel: currentLabel,
                    description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                    overline: textsModel.overlineText.isEmpty ? nil : textsModel.overlineText,
                    extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                    helperText: helperText.isEmpty ? nil : helperText)
            }
        }
    }

    var needRoundedMediaOption: Bool {
        leadingModel.needRoundedMediaOption || trailingModel.needRoundedMediaOption
    }

    var contentStyle: OUDSListItemContentStyle {
        switch type {
        case .standard:
            let style: OUDSListItemContentStyle.Standard = switch contentStandardStyleOption {
            case .background:
                    .background(withDivider: hasDivider)
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
                    .background(withDivider: hasDivider)
            case .backgroundOnInteraction:
                    .backgroundOnInteractionOnly(withDivider: hasDivider)
            }

            return .card(style)
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

    private var helperTextPattern: String {
        helperText.isEmpty ? "" : ", helperText: \"\(helperText)\""
    }

    var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    var dataPattern: String {
        switch textsModel.labelContentType {
        case .text:
            """
            let data = OUDSListItemData(\(textsModel.code) \(helperTextPattern))
            """
        case .customView:
            """
            \(textsModel.customLabelPattern)
            let data = OUDSListItemData(\(textsModel.code)\(helperTextPattern))
            """
        }
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
        needRoundedMediaOption ? "\n.oudsListItemRoundedMedia(\(roundedMedia))" : ""
    }

    private var sizeModifierPattern: String {
        itemSize == .standard
        ? "" : "\n.oudsListItemSize(\(itemSize.technicalDescription))"
    }

    private var containersAlignmentPattern: String {
        "\n.oudsListItemContainerAlignment(\(containersAlignment.technicalDescription))"
    }

    private var slotPattern: String {
        textsModel.hasSlot ? ", slot: someView()" : ""
    }

    private var badgePattern: String {
        ".count(.init(1, accessibilityLabel: \"1\", status: .negative, size: .medium)))"
    }
}

// MARK: - Enums

enum ContentCardStyle: DesignToolboxEnumRepresentable {
    case outlined, outlinedOnInteraction, background, backgroundOnInteraction
}

enum ContentStandardStyle: DesignToolboxEnumRepresentable {
    case background, backgroundOnInteraction
}

// MARK: - Extensions of OUDSListItemContainersAlignment

extension OUDSListItemContainersAlignment: @retroactive CaseIterable {}
extension OUDSListItemContainersAlignment: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemContainersAlignment] = [
        .center, .top,
    ]
}
