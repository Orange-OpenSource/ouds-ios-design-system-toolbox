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

    @Published var title: String {
        didSet { updateCode() }
    }

    @Published var largeTitle: Bool {
        didSet { updateCode() }
    }

    @Published var subTitle: String {
        didSet { updateCode() }
    }

    @Published var leading: Leading {
        didSet { updateCode() }
    }

    @Published var numberOfLeading: Int {
        didSet { updateCode() }
    }

    @Published var isLeadingEnabled: Bool = true {
        didSet { updateCode() }
    }

    @Published var trailing: Trailing {
        didSet { updateCode() }
    }

    @Published var numberOfTrailing: Int {
        didSet { updateCode() }
    }

    @Published var isTrailingEnabled: Bool = true {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        title = "app_components_topAppBar_title_label".localized()
        largeTitle = false
        subTitle = ""
        leading = .back
        numberOfLeading = 1
        isLeadingEnabled = true

        trailing = .none
        numberOfTrailing = 1
        isTrailingEnabled = true

        super.init()
    }

    deinit {}

    @MainActor
    func leadingItems(for theme: OUDSTheme) -> [OUDSToolbarItem] {
        switch leading {
        case .none:
            return []
        case .back:
            return [OUDSToolbarItem(navigation: .back, label: "Back", action: {})]
        case .close:
            return [OUDSToolbarItem(navigation: .close, label: "Close", action: {})]
        case .label:
            return Array(repeating: OUDSToolbarItem(label: "Label", action: {}), count: numberOfLeading)
        case .icon:
            let icon = Image.defaultImage(prefixedBy: theme.name)
            return Array(repeating: OUDSToolbarItem(icon: icon, accessibilityLabel: "", action: {}), count: numberOfLeading)
        }
    }

    @MainActor
    func trailingItems(for theme: OUDSTheme) -> [OUDSToolbarItem] {

        let action: (() -> Void)? = isTrailingEnabled ? { print("Tapped") } : nil
        switch trailing {
        case .none:
            return []
        case .label:
            return Array(repeating: OUDSToolbarItem(label: "Label", action: action), count: numberOfTrailing)
        case .icon:
            let icon = Image.defaultImage(prefixedBy: theme.name)
            return Array(repeating: OUDSToolbarItem(icon: icon, accessibilityLabel: "", action: action), count: numberOfTrailing)
        }
    }

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSToolBarTop()
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

                OUDSSwitchItem("large title", isOn: $configurationModel.largeTitle)
                OUDSChipPicker(title: "app_components_topAppBar_navigationIcon_tech".localized(),
                               selection: $configurationModel.leading,
                               chips: Leading.chips)

                switch configurationModel.leading {
                case .none, .back, .close:
                    EmptyView()
                case .label, .icon:
                    Stepper("app_components_tabBar_itemCount_label" <- "\(configurationModel.numberOfLeading)",
                            value: $configurationModel.numberOfLeading,
                            in: 1 ... 3)
                        .padding(.horizontal, theme.spaces.fixedMedium)
                        .bodyDefaultMedium(theme)
                }

                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.isLeadingEnabled)

                OUDSChipPicker(title: "app_components_topAppBar_actionIcon_tech".localized(),
                               selection: $configurationModel.trailing,
                               chips: Trailing.chips)
                switch configurationModel.trailing {
                case .none:
                    EmptyView()
                case .label, .icon:
                    Stepper("app_components_tabBar_itemCount_label" <- "\(configurationModel.numberOfTrailing)",
                            value: $configurationModel.numberOfTrailing,
                            in: 1 ... 3)
                        .padding(.horizontal, theme.spaces.fixedMedium)
                        .bodyDefaultMedium(theme)
                }
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.isTrailingEnabled)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.title, label: "app_components_topAppBar_title_tech")
                    DesignToolboxTextField(text: $configurationModel.subTitle, label: "app_components_topAppBar_subtitle_tech")
                }
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

enum Leading: CaseIterable, CustomStringConvertible {
    case none
    case back
    case close
    case label
    case icon

    var description: String {
        switch self {
        case .none:
            return "app_components_common_none_tech"
        case .back:
            return "app_components_topAppBar_backNavigationIcon_tech"
        case .close:
            return "app_components_topAppBar_closeNavigationIcon_tech"
        case .label:
            return "app_components_common_label_label" //TODO: app_components_common_label_tech
        case .icon:
            return "app_components_topAppBar_customNavigationIcon_tech"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

enum Trailing: CaseIterable, CustomStringConvertible {
    case none
    case label
    case icon

    var description: String {
        switch self {
        case .none:
            return "app_components_common_none_tech"
        case .label:
            return "app_components_common_label_label" //TODO: app_components_common_label_tech
        case .icon:
            return "app_components_topAppBar_customNavigationIcon_tech"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
