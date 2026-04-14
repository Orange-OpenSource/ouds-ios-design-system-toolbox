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
final class ToolBarTopConfigurationModel: ToolBarConfigurationModel {

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

        super.init()

        leading = .icon
        numberOfLeadingItems = 1
        isLeadingEnabled = true
        isLeadingEmphasized = false

        trailing = .label
        numberOfTrailingItems = 1
        isTrailingEnabled = true
        isTrailingEmphasized = false

        ios26ButtonStyle = .prominent
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

    private var hasLargeTitlePattern: String {
        largeTitle ? ", hasLargeTitle: true" : ""
    }

    private var subtitlePattern: String {
        subTitle.isEmpty ? "" : ", subtitle: \"\(subTitle)\""
    }

    override func updateCode() {
        let leading = leadingItemsPattern.isEmpty ? "" :
            """
            , leadingItems: {
              \(leadingItemsPattern)
            }
            """
        let trailing = leadingItemsPattern.isEmpty ? "" :
            """
            , trailingItems: {
               \(trailingItemPattern)
            }
            """

        code = """
        SomeView()
        .oudsToolBarTop(\"\(title)\"\(hasLargeTitlePattern)\(subtitlePattern)\(leading)\(trailing))
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
                ToolBarTrailingConfiguration(configurationModel: configurationModel)
                ToolBarItemStyle(configurationModel: configurationModel)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.title, label: "app_components_topAppBar_title_tech")
                    if #available(iOS 26, *) {
                        DesignToolboxTextField(text: $configurationModel.subTitle, label: "app_components_topAppBar_subtitle_tech")
                    }

                    DesignToolboxTextField(text: $configurationModel.leadingText, label: "app_components_toolbar_leadingText_label")
                    DesignToolboxTextField(text: $configurationModel.trailingText, label: "app_components_toolbar_trailingText_label")
                }
            }
        }
    }
}

// MARK: - Demo Options

enum DemoOption: CaseIterable, CustomStringConvertible {
    case navigation
    case modalSheet
    case fullCover

    var description: String {
        switch self {
        case .navigation:
            "app_components_topAppBar_demoOption_navigation_tech"
        case .modalSheet:
            "app_components_topAppBar_demoOption_modalSheet_tech"
        case .fullCover:
            "app_components_topAppBar_demoOption_fullCover_tech"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
