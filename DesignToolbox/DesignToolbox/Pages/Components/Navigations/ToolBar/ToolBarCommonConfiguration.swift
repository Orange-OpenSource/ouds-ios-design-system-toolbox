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

// MARK: - ToolBar Configuration Model

/// The model shared between `ToolBarPageConfiguration` view and `ToolBarTopPageComponent` view.
open class ToolBarConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var leadingText: String {
        didSet { updateCode() }
    }

    @Published var leading: LeadingTrailingType {
        didSet { updateCode() }
    }

    @Published var numberOfLeadingItems: Int {
        didSet { updateCode() }
    }

    @Published var isLeadingEmphasized: Bool {
        didSet { updateCode() }
    }

    @Published var isLeadingEnabled: Bool {
        didSet { updateCode() }
    }

    @Published var trailingText: String {
        didSet { updateCode() }
    }

    @Published var trailing: LeadingTrailingType {
        didSet { updateCode() }
    }

    @Published var numberOfTrailingItems: Int {
        didSet { updateCode() }
    }

    @Published var isTrailingEmphasized: Bool {
        didSet { updateCode() }
    }

    @Published var isTrailingEnabled: Bool {
        didSet { updateCode() }
    }

    @Published var ios26ButtonStyle: OUDSToolBarItem.ActionStyle = .default {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        leadingText = String(localized: "app_components_toolbar_leading_tech")
        leading = .icon
        numberOfLeadingItems = 1
        isLeadingEnabled = true
        isLeadingEmphasized = false

        trailingText = String(localized: "app_components_toolbar_trailing_tech")
        trailing = .label
        numberOfTrailingItems = 1
        isTrailingEnabled = true
        isTrailingEmphasized = false

        ios26ButtonStyle = .prominent

        super.init(useOneColorSchemedDemo: true)
    }

    deinit {}

    // MARK: Component configuration

    @MainActor
    func leadingItems(for theme: OUDSTheme) -> [OUDSToolBarItem] {
        var items: [OUDSToolBarItem] = []
        for _ in 1 ... numberOfLeadingItems {
            guard let item = layout(for: theme, type: leading, label: leadingText, isEnabled: isLeadingEnabled, isEmphasized: isLeadingEmphasized) else {
                return []
            }
            items.append(item)
        }

        return items
    }

    @MainActor
    func trailingItems(for theme: OUDSTheme) -> [OUDSToolBarItem] {
        var items = [OUDSToolBarItem]()
        for _ in 1 ... numberOfTrailingItems {
            guard let item = layout(for: theme, type: trailing, label: trailingText, isEnabled: isTrailingEnabled, isEmphasized: isTrailingEmphasized) else {
                return []
            }

            items.append(item)
        }

        return items
    }

    @MainActor
    private func layout(for theme: OUDSTheme, type: LeadingTrailingType, label: String, isEnabled: Bool, isEmphasized: Bool = false) -> OUDSToolBarItem? {

        let action: (() -> Void)? = isEnabled ? {} : nil

        var actionType: OUDSToolBarItem.ActionType?
        switch type {
        case .none:
            actionType = nil
        case .label:
            actionType = .label(label, emphasized: isEmphasized, action: action)
        case .icon:
            let asset = Image.defaultImage(prefixedBy: theme.name)
            actionType = .icon(asset: asset,
                               accessibilityLabel: "app_components_toolbarItem_label_a11y".localized(),
                               accessibilityHint: "app_components_toolbarItem_hint_a11y".localized(),
                               action: action)
        }

        guard let actionType else {
            return nil
        }

        #if os(iOS)
        if #available(iOS 26, *) {
            return OUDSToolBarItem(action: actionType, style: ios26ButtonStyle)
        } else {
            return OUDSToolBarItem(action: actionType)
        }
        #else
        return OUDSToolBarItem(action: actionType)
        #endif
    }

    // MARK: Code update

    private func actionPattern(isEnabled: Bool) -> String {
        isEnabled ? ", action: {}" : ""
    }

    private func labelActionPattern(isEnabled: Bool, isEmphasized: Bool) -> String {
        let emphasizedPattern = isEmphasized ? ", emphasized: true" : ""
        return "OUDSToolBarItem(action: .label(\"Label\"\(emphasizedPattern)\(actionPattern(isEnabled: isEnabled))))"
    }

    private func iconActionPattern(isEnabled: Bool) -> String {
        "OUDSToolBarItem(action: .icon(asset: Image(\"magic_wand\"), accessibilityLabel: \"dumb_label_key\"\(actionPattern(isEnabled: isEnabled))))"
    }

    private func actionPattern(type: LeadingTrailingType, isEnabled: Bool, isEmphasized: Bool = false) -> String {
        switch type {
        case .none:
            ""
        case .label:
            labelActionPattern(isEnabled: isEnabled, isEmphasized: isEmphasized)
        case .icon:
            iconActionPattern(isEnabled: isEnabled)
        }
    }

    var leadingItemsPattern: String {
        actionPattern(type: leading, isEnabled: isLeadingEnabled, isEmphasized: isLeadingEmphasized)
    }

    var trailingItemPattern: String {
        actionPattern(type: trailing, isEnabled: isTrailingEnabled, isEmphasized: isTrailingEmphasized)
    }
}

// MARK: - Leading Trailing Type

enum LeadingTrailingType: CaseIterable, CustomStringConvertible {
    case none
    case label
    case icon

    var description: String {
        switch self {
        case .none:
            "app_components_common_none_tech"
        case .label:
            "app_components_common_label_tech"
        case .icon:
            "app_components_common_icon_tech"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: - Extension of OUDSToolBarItem Action Style

extension OUDSToolBarItem.ActionStyle: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    public static let allCases: [OUDSToolBarItem.ActionStyle] = [.default, .prominent, .tinted]

    public var description: String {
        switch self {
        case .default:
            "app_components_toolbar_item_actionType_default_tech"
        case .prominent:
            "app_components_toolbar_item_actionType_prominent_tech"
        case .tinted:
            "app_components_toolbar_item_actionType_tinted_tech"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: - Toolbar Leading Configuration

struct ToolBarLeadingConfiguration: View {

    // MARK: Properties

    @StateObject var configurationModel: ToolBarConfigurationModel

    @Environment(\.theme) private var theme
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            OUDSChipPicker(title: "app_components_toolbar_leading_tech".localized(),
                           selection: $configurationModel.leading,
                           chips: LeadingTrailingType.chips)

            switch configurationModel.leading {
            case .label, .icon:
                Stepper("app_components_toolbar_common_itemCount_label" <- "\(configurationModel.numberOfLeadingItems)",
                        value: $configurationModel.numberOfLeadingItems,
                        in: 1 ... 3)
                    .padding(.horizontal, theme.spaces.fixedMedium)
                    .labelStrongMedium(theme)

                if isLiquidGlassDisabled,
                   configurationModel.leading == .label
                {
                    OUDSSwitchItem("app_components_toolbar_item_emphasized_tech", isOn: $configurationModel.isLeadingEmphasized)
                }
            default:
                EmptyView()
            }

            switch configurationModel.leading {
            case .none:
                EmptyView()
            default:
                OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.isLeadingEnabled)
            }
        }
    }
}

// MARK: - Toolbar Trailing Configuration

struct ToolBarTrailingConfiguration: View {

    // MARK: Properties

    @StateObject var configurationModel: ToolBarConfigurationModel
    @Environment(\.theme) private var theme
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    // MARK: Body

    var body: some View {
        OUDSHorizontalDivider()

        OUDSChipPicker(title: "app_components_toolbar_trailing_tech".localized(),
                       selection: $configurationModel.trailing,
                       chips: LeadingTrailingType.chips)

        switch configurationModel.trailing {
        case .label, .icon:
            Stepper("app_components_toolbar_common_itemCount_label" <- "\(configurationModel.numberOfTrailingItems)",
                    value: $configurationModel.numberOfTrailingItems,
                    in: 1 ... 3)
                .padding(.horizontal, theme.spaces.fixedMedium)
                .labelStrongMedium(theme)

            if isLiquidGlassDisabled,
               configurationModel.trailing == .label
            {
                OUDSSwitchItem("app_components_toolbar_item_emphasized_tech", isOn: $configurationModel.isTrailingEmphasized)
            }

        default:
            EmptyView()
        }

        switch configurationModel.trailing {
        case .none:
            EmptyView()
        default:
            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.isTrailingEnabled)
        }
    }
}

// MARK: - Toolbar Item Style

struct ToolBarItemStyle: View {

    @StateObject var configurationModel: ToolBarConfigurationModel
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    // MARK: Body

    var body: some View {
        if !isLiquidGlassDisabled,
           configurationModel.trailing == .icon ||
           configurationModel.leading == .icon ||
           configurationModel.trailing == .label ||
           configurationModel.leading == .label
        {

            OUDSHorizontalDivider()

            OUDSChipPicker(title: "app_components_toolbar_item_ios26ButtonStyle_tech",
                           selection: $configurationModel.ios26ButtonStyle,
                           chips: OUDSToolBarItem.ActionStyle.chips)
        }
    }
}
