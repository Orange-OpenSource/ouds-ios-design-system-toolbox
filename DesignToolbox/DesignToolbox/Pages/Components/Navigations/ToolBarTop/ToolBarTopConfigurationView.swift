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

// MARK: - ToolBarTop Configuration Model

/// The model shared between `ToolBarTopPageConfiguration` view and `ToolBarTopPageComponent` view.
final class ToolBarTopConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var demoOption: DemoOption {
        didSet { updateCode() }
    }

    @Published var title: String {
        didSet { updateCode() }
    }

    @Published var largeTitle: Bool {
        didSet { updateCode() }
    }

    @Published var subTitle: String {
        didSet { updateCode() }
    }

    @Published var hideBackButton: Bool {
        didSet { updateCode() }
    }

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

    @Published var showModalSheet: Bool = false
    @Published var showFullCover: Bool = false
    @Published var showNavigation: Bool = false

    // MARK: Initializer

    override init() {
        demoOption = .navigation
        title = "app_components_topAppBar_title_label".localized()
        largeTitle = false
        subTitle = ""

        hideBackButton = false
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
            if let item = layout(for: theme, type: leading, isEnabled: isLeadingEnabled, isEmphasized: isLeadingEmphasized) {
                items.append(item)
            }
        }

        // Add the close button for sheet
        if showFullCover || showModalSheet {
            return [OUDSToolBarItem(navigation: .close)] + items
        } else {
            return items
        }
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

    private var hasLargeTitlePattern: String {
        largeTitle ? ", hasLargeTitle: true" : ""
    }
    private var subtitlePattern: String {
        subTitle.isEmpty ? "" : ", subtitle: \"\(subTitle)\""
    }
    private func actionPattern(isEnabled: Bool) -> String {
        isEnabled ? ", action: {}" : ""
    }

    private func labelActionPattern(isEnabled: Bool, isEmphasized: Bool) -> String {
        let emphasizedPattern = isEmphasized ? ", emphasized: true" : ""
        return"OUDSToolBarItem(action: .label(\"Label\",\(emphasizedPattern)\(actionPattern(isEnabled: isEnabled))))"
    }
    private func iconActionPattern(isEnabled: Bool) -> String {
        "OUDSToolBarItem(action: .icon(asset: Image(\"ic_heart\"), accessibilityLabel: \"Like\"\(actionPattern(isEnabled: isEnabled))))"
    }

    private func actionPattern(type: LeadingTrailingType, isEnabled: Bool, isEmphasized: Bool = false) -> String {
        switch type {
        case .none:
            ""
        case .label:
            """
            , leadingItems: {
                   \(labelActionPattern(isEnabled: isEnabled, isEmphasized: isEmphasized))
                   }
            """
        case .icon:
            """
            , trailingItems: {
                   \(iconActionPattern(isEnabled: isEnabled))
                   }
            """
        }
    }

    override func updateCode() {
        let leadingActionPattern = actionPattern(type: leading, isEnabled: isLeadingEnabled, isEmphasized: isLeadingEmphasized)
        let trailingActionPattern = actionPattern(type: trailing, isEnabled: isTrailingEnabled, isEmphasized: isTrailingEmphasized)
        code = """
        SomeView()
        .oudsToolBarTop(\"\(title)\"\(hasLargeTitlePattern)\(subtitlePattern)\(leadingActionPattern)\(trailingActionPattern))
        """
    }
}

// MARK: - ToolBarTop Configuration View

struct ToolBarTopConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: ToolBarTopConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                OUDSChipPicker(title: "app_components_topAppBar_demoOption_tech".localized(),
                               selection: $configurationModel.demoOption,
                               chips: DemoOption.chips)

                OUDSSwitchItem("app_components_topAppBar_largeTitle_tech", isOn: $configurationModel.largeTitle)

                // Leading configuration
                OUDSHorizontalDivider()

                if configurationModel.demoOption == .navigation {
                    OUDSSwitchItem("app_components_topAppBar_hideBackButton_tech", isOn: $configurationModel.hideBackButton)
                }

                OUDSChipPicker(title: "app_components_topAppBar_leading_tech".localized(),
                               selection: $configurationModel.leading,
                               chips: LeadingTrailingType.chips)

                switch configurationModel.leading {
                case .label, .icon:
                    Stepper("app_components_tabBar_itemCount_label" <- "\(configurationModel.numberOfLeading)",
                            value: $configurationModel.numberOfLeading,
                            in: 1 ... 3)
                    .padding(.horizontal, theme.spaces.fixedMedium)
                    .bodyDefaultMedium(theme)

                    if #available(iOS 26.0, *) {
                    } else {
                        if configurationModel.leading == .label {
                            OUDSSwitchItem("app_components_topAppBar_Emphasized_tech", isOn: $configurationModel.isLeadingEmphasized)
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

                // Trailing configuration
                OUDSHorizontalDivider()

                OUDSChipPicker(title: "app_components_topAppBar_trailing_tech".localized(),
                               selection: $configurationModel.trailing,
                               chips: LeadingTrailingType.chips)

                switch configurationModel.trailing {
                case .label, .icon:
                    Stepper("app_components_tabBar_itemCount_label" <- "\(configurationModel.numberOfTrailing)",
                            value: $configurationModel.numberOfTrailing,
                            in: 1 ... 3)
                    .padding(.horizontal, theme.spaces.fixedMedium)
                    .bodyDefaultMedium(theme)

                    if #available(iOS 26.0, *) {
                    } else {
                        if configurationModel.trailing == .label {
                            OUDSSwitchItem("app_components_topAppBar_Emphasized_tech", isOn: $configurationModel.isTrailingEmphasized)
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
                    
                    OUDSChipPicker(title: "app_components_topAppBar_ios26ButtonStyle_tech",
                                   selection: $configurationModel.ios26ButtonStyle,
                                   chips: OUDSToolBarItem.ActionStyle.chips)
                }

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.title, label: "app_components_topAppBar_title_tech")
                    if #available(iOS 26, *) {
                        DesignToolboxTextField(text: $configurationModel.subTitle, label: "app_components_topAppBar_subtitle_tech")
                    }
                }
            }
        }
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

enum DemoOption: CaseIterable, CustomStringConvertible {
    case navigation
    case modalSheet
    case fullCover

    var description: String {
        switch self {
        case .navigation: return "app_components_topAppBar_demoOption_navigation_tech"
        case .modalSheet: return "app_components_topAppBar_demoOption_modalSheet_tech"
        case .fullCover: return "app_components_topAppBar_demoOption_fullCover_tech"
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
            "app_components_topAppBar_actionType_default_tech"
        case .proiminent:
            "app_components_topAppBar_actionType_proiminent_tech"
        case .tinted:
            "app_components_topAppBar_actionType_tinted_tech"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
