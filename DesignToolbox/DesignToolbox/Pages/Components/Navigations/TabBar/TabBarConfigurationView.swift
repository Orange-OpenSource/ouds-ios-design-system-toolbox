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

    // MARK: Properties

    @Published var numberOfItems: Int
    @Published var badgeConfiguration: BadgeConfiguration = .none
    @Published var badgeText: String

    // MARK: Tab bar items

    /// To store some details about tabs
    struct TabBarItemConfiguration: Hashable {
        let label: String
        let content: String
        let imageName: String
    }

    var limitedItems: [TabBarItemConfiguration] {
        Array(Self.tabBarItems.prefix(numberOfItems))
    }

    private static let tabBarItems: [TabBarItemConfiguration] = [
        TabBarItemConfiguration(label: "Call", content: "Call view", imageName: "phone"),
        TabBarItemConfiguration(label: "Email", content: "Email view", imageName: "mail"),
        TabBarItemConfiguration(label: "Note", content: "Note view", imageName: "long.text.page.and.pencil"),
        TabBarItemConfiguration(label: "Settings", content: "Settings view", imageName: "gearshape"),
    ]

    // MARK: Badges

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

    override init(useOneColorSchemedDemo: Bool) {
        numberOfItems = 3
        badgeConfiguration = .none
        badgeText = "1"
        super.init(useOneColorSchemedDemo: useOneColorSchemedDemo)
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
                Stepper("Count: " + "\($configurationModel.numberOfItems.wrappedValue)", value: $configurationModel.numberOfItems, in: 1 ... 5)
                    .padding(.horizontal, theme.spaces.fixedMedium)
                    .bodyDefaultMedium(theme)

                OUDSChipPicker(title: "Badges",
                               selection: $configurationModel.badgeConfiguration,
                               chips: configurationModel.badgeConfigurations)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.badgeText, label: "Badge text")
                }
            }
        }
    }
}
