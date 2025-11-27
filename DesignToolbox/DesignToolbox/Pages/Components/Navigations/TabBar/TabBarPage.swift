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
        _configurationModel = StateObject(wrappedValue: TabBarConfigurationModel(useOneColorSchemedDemo: true))
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

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                TabView {
                    ForEach(configurationModel.limitedItems, id: \.self) { item in
                        TabBarItemDemo(item: item, badge: configurationModel.badgeConfiguration)
                            .tabItem {
                                Label {
                                    Text(item.label)
                                } icon: {
                                    Image(systemName: item.imageName)
                                        .accessibilityHidden(true)
                                }
                            }
                    }
                }
                #if canImport(UIKit) // OUDSTabBarViewModifier relies on UIKit
                .modifier(OUDSTabBarViewModifier())
                #endif
                .frame(maxHeight: .infinity)
                Spacer()
            }
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}

// MARK: - Tab bar item demo

/// The view attached to the tab
private struct TabBarItemDemo: View {

    /// Things to display as tab target
    let item: TabBarConfigurationModel.TabBarItemConfiguration

    /// Badge to display to the associated tab
    let badge: TabBarConfigurationModel.BadgeConfiguration

    var body: some View {
        HStack {
            Image(systemName: item.imageName).accessibilityHidden(true)
            Text(item.label)
        }.modifier(BadgeModifier(configuration: badge))
    }

    /// To add a bad in the tab bar item
    private struct BadgeModifier: ViewModifier {

        let configuration: TabBarConfigurationModel.BadgeConfiguration

        func body(content: Content) -> some View {
            if configuration == .empty { // Empty badge
                content.badge("")
            } else if case let .text(text) = configuration { // Circle with count, text, etc.
                content.badge(text)
            } else { // No badge
                content
            }
        }
    }
}
