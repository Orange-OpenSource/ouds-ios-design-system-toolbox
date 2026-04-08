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
class ToolBarConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var leading: LeadingTrailingType {
        didSet { updateCode() }
    }

    @Published var numberOfLeading: Int {
        didSet { updateCode() }
    }

    @Published var isLeadingEmphasized: Bool {
        didSet { updateCode() }
    }

    @Published var isLeadingEnabled: Bool {
        didSet { updateCode() }
    }

    @Published var trailing: LeadingTrailingType {
        didSet { updateCode() }
    }

    @Published var numberOfTrailing: Int {
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
        leading = .icon
        numberOfLeading = 1
        isLeadingEnabled = true
        isLeadingEmphasized = false

        trailing = .label
        numberOfTrailing = 1
        isTrailingEnabled = true
        isTrailingEmphasized = false

        ios26ButtonStyle = .proiminent

        super.init(useOneColorSchemedDemo: true)
    }

    deinit {}

    // MARK: Component configuration

    @MainActor
    func leadingItems(for theme: OUDSTheme) -> [OUDSToolBarItem] {
        var items: [OUDSToolBarItem] = []
        for _ in 1...numberOfLeading {
            guard let item = layout(for: theme, type: leading, isEnabled: isLeadingEnabled, isEmphasized: isLeadingEmphasized) else {
                return []
            }
            items.append(item)
        }

        return items
    }

    @MainActor
    func trailingItems(for theme: OUDSTheme) -> [OUDSToolBarItem] {
        var items = [OUDSToolBarItem]()
        for _ in 1...numberOfTrailing {
            guard let item = layout(for: theme, type: trailing, isEnabled: isTrailingEnabled, isEmphasized: isTrailingEmphasized) else {
                return []
            }

            items.append(item)
        }

        return items
    }

    @MainActor
    private func layout(for theme: OUDSTheme, type: LeadingTrailingType, isEnabled: Bool, isEmphasized: Bool = false) -> OUDSToolBarItem? {

        let action: (() -> Void)? = isEnabled ? {} : nil

        var actionType: OUDSToolBarItem.ActionType?
        switch type {
        case .none:
            actionType = nil
        case .label:
            let label = "app_components_common_label_label".localized()
            actionType = .label(label, emphasized: isEmphasized, action: action)
        case .icon:
            let asset = Image.defaultImage(prefixedBy: theme.name)
            actionType = .icon(asset: asset, accessibilityLabel: "", action: action)
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
        "OUDSToolBarItem(action: .icon(asset: Image(\"ic_heart\"), accessibilityLabel: \"Like\"\(actionPattern(isEnabled: isEnabled))))"
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
        return actionPattern(type: trailing, isEnabled: isTrailingEnabled, isEmphasized: isTrailingEmphasized)
    }
}

enum LeadingTrailingType: CaseIterable, CustomStringConvertible {
    case none
    case label
    case icon

    var description: String {
        switch self {
        case .none:
            return "app_components_common_none_tech"
        case .label:
            return "app_components_common_label_tech"
        case .icon:
            return "app_components_common_icon_tech"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSToolBarItem.ActionStyle: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    nonisolated(unsafe) public static let allCases: [OUDSToolBarItem.ActionStyle] = [.default, .proiminent, .tinted]

    public var description: String {
        switch self {
        case .default:
            "app_components_toolbar_item_actionType_default_tech"
        case .proiminent:
            "app_components_toolbar_item_actionType_proiminent_tech"
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


struct ToolBarLeadingConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: ToolBarConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            OUDSChipPicker(title: "app_components_toolbar_leading_tech".localized(),
                           selection: $configurationModel.leading,
                           chips: LeadingTrailingType.chips)

            switch configurationModel.leading {
            case .label, .icon:
                Stepper("app_components_toolbar_common_itemCount_label" <- "\(configurationModel.numberOfLeading)",
                        value: $configurationModel.numberOfLeading,
                        in: 1 ... 3)
                .padding(.horizontal, theme.spaces.fixedMedium)
                .bodyDefaultMedium(theme)

                if #available(iOS 26.0, *) {
                } else {
                    if configurationModel.leading == .label {
                        OUDSSwitchItem("app_components_toolbar_item_emphasized_tech", isOn: $configurationModel.isLeadingEmphasized)
                    }
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

struct ToolBarTrailingConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: ToolBarConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        // Trailing configuration
        OUDSHorizontalDivider()

        OUDSChipPicker(title: "app_components_toolbar_trailing_tech".localized(),
                       selection: $configurationModel.trailing,
                       chips: LeadingTrailingType.chips)

        switch configurationModel.trailing {
        case .label, .icon:
            Stepper("app_components_toolbar_common_itemCount_label" <- "\(configurationModel.numberOfTrailing)",
                    value: $configurationModel.numberOfTrailing,
                    in: 1 ... 3)
            .padding(.horizontal, theme.spaces.fixedMedium)
            .bodyDefaultMedium(theme)

            if #available(iOS 26.0, *) {
            } else {
                if configurationModel.trailing == .label {
                    OUDSSwitchItem("app_components_toolbar_item_emphasized_tech", isOn: $configurationModel.isTrailingEmphasized)
                }
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

        if #available(iOS 26.0, *),
           configurationModel.trailing == .icon ||
            configurationModel.leading == .icon ||
            configurationModel.trailing == .label ||
            configurationModel.leading == .label {

            OUDSHorizontalDivider()

            OUDSChipPicker(title: "app_components_toolbar_item_ios26ButtonStyle_tech",
                           selection: $configurationModel.ios26ButtonStyle,
                           chips: OUDSToolBarItem.ActionStyle.chips)
        }
    }
}
