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

// MARK: - TabBar Configuration Model

/// The model shared between `TabBarPageConfiguration` view and `TabBarPageComponent` view.
final class TabBarConfigurationModel: ComponentConfiguration {

    struct TabBarItemConfiguration {
        let id: Int
        let label: String
        let content: String
        let imageName: String
    }

    // MARK: Properties

    @Published var numberOfItems = 1
    @Published var badgeConfiguration: BadgeConfiguration = .none
    @Published var badgeText: String

    var limitedItems: [TabBarItemConfiguration] {
        // Array(Self.tabBarItems.prefix(numberOfItems))
        Self.tabBarItems
    }

    private static let tabBarItems: [TabBarItemConfiguration] = [
        TabBarItemConfiguration(id: 0, label: "Call", content: "Call view", imageName: "phone"),
        TabBarItemConfiguration(id: 1, label: "Email", content: "Email view", imageName: "mail"),
        TabBarItemConfiguration(id: 2, label: "Note", content: "Note view", imageName: "long.text.page.and.pencil"),
        TabBarItemConfiguration(id: 3, label: "Settings", content: "Settings view", imageName: "gearshape"),
    ]

    enum BadgeConfiguration: Hashable {
        case none
        case empty
        case text(String)
    }

    var badgeConfigurations: [OUDSChipPickerData<BadgeConfiguration>] {
        [
            OUDSChipPickerData(tag: BadgeConfiguration.none, layout: .text(text: "none")),
            OUDSChipPickerData(tag: BadgeConfiguration.empty, layout: .text(text: "empty")),
            OUDSChipPickerData(tag: BadgeConfiguration.text(badgeText), layout: .text(text: "text (\(badgeText))")),
        ]
    }

    // MARK: Initializer

    override init() {
        numberOfItems = 1
        badgeConfiguration = .none
        badgeText = "1"
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSTabBar() { /* SomeView().tabItem { ... } */ }
        """
    }
}

// MARK: - TabBar Configuration View

struct TabBarConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: TabBarConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                Stepper("Valeur: \(configurationModel.numberOfItems)", value: $configurationModel.numberOfItems, in: 1 ... 5)
                OUDSChipPicker(title: "With badges",
                               selection: $configurationModel.badgeConfiguration,
                               chips: configurationModel.badgeConfigurations)
                DesignToolboxTextField(text: $configurationModel.badgeText, label: "Badge text")
            }
        }
    }
}
