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
    @Environment(\.theme) private var theme
    @ObservedObject var configurationModel: TabBarConfigurationModel

    var body: some View {
        NavigationView {
            VStack {
                OUDSTabBar {
                    ForEach(configurationModel.limitedItems.indices, id: \.self) { index in
                        let item = configurationModel.limitedItems[index]
                        TabBarItemDemo(text: item.content)
                            .tabItem {
                                Label {
                                    Text(item.label)
                                } icon: {
                                    Image("Orange/tips-and-tricks")
                                        .renderingMode(.template)
                                        .foregroundColor(Color.yellow)
                                }
                            }
                    }
                }
            }
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}

private struct TabBarItemDemo: View {

    let text: String

    var body: some View {
        Text(text)
    }
}
