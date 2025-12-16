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

// MARK: Tab bar page

struct TabBarPage: View {

    @StateObject private var configurationModel: TabBarConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TabBarConfigurationModel(useOneColorSchemedDemo: true)) // Issues with color scheme with tab bar
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TabBarDemo(configurationModel: configurationModel)
        } configurationView: {
            TabBarConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Tab bar demo

struct TabBarDemo: View {

    @ObservedObject var configurationModel: TabBarConfigurationModel
    @Environment(\.theme) private var theme

    // Example of accessibility label for a tab:
    // - empty: just say there is something new
    // - text: differentiate if count of pure text
    // - otherwise: nothing
    private var a11yLabelForTab: String {
        if configurationModel.badgeConfiguration == .empty {
            return "app_components_tabBar_newElements_label".localized()
        }
        if case let .text(text) = configurationModel.badgeConfiguration {
            if text.isNumber {
                return "app_components_tabBar_newElementsCount_label" <- text
            } else if !text.trimmingCharacters(in: .whitespaces).isEmpty {
                return text
            }
        }
        return ""
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                OUDSTabBar(selected: 0, count: configurationModel.numberOfItems) {
                    ForEach(configurationModel.limitedItems.indices, id: \.self) { index in
                        let item = configurationModel.limitedItems[index]
                        TabBarItemDemo(item: item, badge: configurationModel.badgeConfiguration)
                            .tabItem {
                                Label {
                                    Text(item.label.localized())
                                        .accessibilityValue(a11yLabelForTab)
                                } icon: {
                                    Image.decorativeImage(named: item.imageName, prefixedBy: theme.name)
                                        .renderingMode(.template)
                                }
                            }
                            .tag(index)
                            .modifier(BadgeModifier(index: index, configuration: configurationModel.badgeConfiguration))
                    }
                }
            }
        }
        .padding(.all, theme.spaces.fixedMedium)
        #if canImport(UIKit)
            .frame(maxHeight: UIDevice.current.userInterfaceIdiom == .pad ? 600 : 300)
        #endif
    }
}

// MARK: - Tab bar item demo

/// The view attached to the tab
private struct TabBarItemDemo: View {

    /// Things to display as tab target
    let item: TabBarConfigurationModel.TabBarItemConfiguration

    /// Badge to display to the associated tab
    let badge: TabBarConfigurationModel.BadgeConfiguration

    @Environment(\.theme) private var theme

    var body: some View {
        Image.decorativeImage(named: item.imageName, prefixedBy: theme.name)
    }
}

// MARK: - Badge modifier

/// To add a bad in the tab bar item
private struct BadgeModifier: ViewModifier {

    let index: Int
    let configuration: TabBarConfigurationModel.BadgeConfiguration

    func body(content: Content) -> some View {
        if index == 0 {
            if configuration == .empty { // Empty badge
                content.badge("")
            } else if case let .text(text) = configuration { // Circle with count, text, etc.
                content.badge(text)
            } else { // No badge
                content
            }
        } else {
            content
        }
    }
}
