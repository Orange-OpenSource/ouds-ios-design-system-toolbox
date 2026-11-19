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

#if !os(tvOS)

import OUDSSwiftUI
import SwiftUI

// MARK: - ToolBarTop Configuration Model

/// The model shared between `ToolBarTopPageConfiguration` view and `ToolBarTopPageComponent` view.
final class ToolBarTopConfigurationModel: ToolBarConfigurationModel {

    // MARK: Properties

    @Published var demoOption: DemoOption {
        didSet { updateCode() }
    }

    @Published var largeTitle: Bool {
        didSet { updateCode() }
    }

    @Published var subTitle: String {
        didSet { updateCode() }
    }

    @Published var accessibilityLabel: String {
        didSet { updateCode() }
    }

    @Published var hideBackButton: Bool {
        didSet { updateCode() }
    }

    @Published var showModalSheet: Bool = false
    @Published var showFullCover: Bool = false
    @Published var showNavigation: Bool = false

    // MARK: Initializer

    override init() {
        demoOption = .navigation

        largeTitle = false
        subTitle = ""
        accessibilityLabel = ""

        hideBackButton = false

        super.init()

        leading = .icon
        numberOfLeadingItems = 1
        isLeadingEnabled = true
        isLeadingEmphasized = false

        trailing = .icon
        numberOfTrailingItems = 1
        isTrailingEnabled = true
        isTrailingEmphasized = false

        ios26ButtonStyle = .default
    }

    deinit {}

    // MARK: Component configuration

    @MainActor
    override func leadingItems(for theme: OUDSTheme) -> [OUDSToolBarItem] {
        let items = super.leadingItems(for: theme)

        // Add the close button for sheet
        if showFullCover || showModalSheet {
            return [OUDSToolBarItem(navigation: .close)] + items
        } else {
            return items
        }
    }

    // MARK: Code update

    override func updateCode() {
        var arguments: [String] = []
        if !title.isEmpty { arguments.append("\"\(title)\"") }
        if largeTitle { arguments.append("hasLargeTitle: true") }
        if !subTitle.isEmpty { arguments.append("subtitle: \"\(subTitle)\"") }
        if principalType == .none, !accessibilityLabel.isEmpty { arguments.append("accessibilityLabel: \"\(accessibilityLabel)\"") }
        if !leadingItemsPattern.isEmpty {
            arguments.append(
                """
                leadingItems: {
                  \(leadingItemsPattern)
                }
                """)
        }
        if principalType != .none { arguments.append("principalItem: \(principalItemPattern)") }
        if !trailingItemPattern.isEmpty {
            arguments.append(
                """
                trailingItems: {
                   \(trailingItemPattern)
                }
                """)
        }

        code = """
        SomeView()
        .toolBarTop(\(arguments.joined(separator: ", ")))
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

                OUDSChipPicker(title: "app_components_topAppBar_demoOption_label".localized(),
                               selection: $configurationModel.demoOption,
                               chips: DemoOption.chips)

                OUDSSwitchItem("app_components_topAppBar_largeTitle_tech", isOn: $configurationModel.largeTitle)

                if configurationModel.demoOption == .navigation {
                    OUDSSwitchItem("app_components_topAppBar_hideBackButton_tech", isOn: $configurationModel.hideBackButton)
                }

                ToolBarLeadingConfiguration(configurationModel: configurationModel)

                ToolBarPrincipalConfiguration(configurationModel: configurationModel)

                ToolBarTrailingConfiguration(configurationModel: configurationModel)

                ToolBarItemStyle(configurationModel: configurationModel)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.title, label: "app_components_topAppBar_title_tech")
                    DesignToolboxTextField(text: $configurationModel.subTitle, label: "app_components_topAppBar_subtitle_tech")
                    if configurationModel.principalType == .none {
                        DesignToolboxTextField(text: $configurationModel.accessibilityLabel, label: "app_components_topAppBar_accessibilityLabel_tech")
                    }
                    DesignToolboxTextField(text: $configurationModel.leadingText, label: "app_components_toolbar_leadingText_label")
                    DesignToolboxTextField(text: $configurationModel.trailingText, label: "app_components_toolbar_trailingText_label")
                }
            }
        }
    }
}

// MARK: - Demo Options

enum DemoOption: DesignToolboxEnumLocalizedRepresentable {
    case navigation, modalSheet, fullCover

    var wordingKey: String {
        switch self {
        case .navigation:
            "app_components_topAppBar_demoOption_navigation_tech"
        case .modalSheet:
            "app_components_topAppBar_demoOption_modalSheet_tech"
        case .fullCover:
            "app_components_topAppBar_demoOption_fullCover_tech"
        }
    }
}

#endif
