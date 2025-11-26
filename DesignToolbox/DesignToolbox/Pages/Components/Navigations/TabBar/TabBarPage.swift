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
    @State private var showModal = false

    init() {
        _configurationModel = StateObject(wrappedValue: TabBarConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TabBarDemo(showModal: $showModal, configurationModel: configurationModel)
        } configurationView: {
            TabBarConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Tab bar Demo

struct TabBarDemo: View {

    @Binding var showModal: Bool
    @ObservedObject var configurationModel: TabBarConfigurationModel

    @State private var selectedTabId = 0
    @Environment(\.theme) private var theme

    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectedTabId) {
                    ForEach(configurationModel.limitedItems, id: \.id) { item in
                        TabBarItemDemo(text: item.content, badge: configurationModel.badgeConfiguration)
                            .tabItem {
                                Label {
                                    Text(item.label)
                                } icon: {
                                    Image(systemName: selectedTabId == item.id ? "\(item.imageName).fill" : "\(item.imageName)")
                                        .accessibilityHidden(true)
                                }
                            }
                            .tag(item.id)
                    }
                }
                .onChange(of: selectedTabId) { newValue in
                    print("🔄 Selection changée: \(newValue)")
                }
                .modifier(OUDSTabBarViewModifier())
            }
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}

private struct TabBarItemDemo: View {

    let text: String
    let badge: TabBarConfigurationModel.BadgeConfiguration

    var body: some View {
        if badge == .empty {
            Text(text).badge("")
        } else if case let .text(someText) = badge {
            Text(text).badge(someText)
        } else {
            Text(text)
        }
    }
}
