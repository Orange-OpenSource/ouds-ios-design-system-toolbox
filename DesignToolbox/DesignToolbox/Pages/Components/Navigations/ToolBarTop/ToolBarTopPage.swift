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

// MARK: Tool bar top page

struct ToolBarTopPage: View {

    @StateObject private var configurationModel: ToolBarTopConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: ToolBarTopConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ToolBarTopDemoSelection(configurationModel: configurationModel)
        } configurationView: {
            ToolBarTopConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Tab bar demo

struct ToolBarTopDemoSelection: View {

    @State var showSheet: Bool = false
    @State var showNavigation: Bool = false
    @ObservedObject var configurationModel: ToolBarTopConfigurationModel

    var body: some View {
        switch configurationModel.demoOption {
        case .navigation:
            NavigationLink(destination: ToolBarTopDemo(configurationModel: configurationModel), isActive: $showNavigation) {
                OUDSButton(text: "Show Demo") {
                    showNavigation = true
                }
            }
        case .sheet:
            OUDSButton(text: "Show Demo") {
                showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                NavigationView {
                    ToolBarTopDemo(configurationModel: configurationModel)
                }
            }
        }
    }
}

struct ToolBarTopDemo: View {

    @ObservedObject var configurationModel: ToolBarTopConfigurationModel
    @Environment(\.theme) private var theme
    @State private var showDestination: Bool = false
    @State private var showSheet: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                Text("Some content")
            }
            .frame(maxWidth: .infinity)
        }
        .oudsToolBarTop(configurationModel.title,
                        largeTitle: configurationModel.largeTitle,
                        subtitle: subTitle,
                        leadingItems: { configurationModel.leadingItems(for: theme) },
                        trailingItems: { configurationModel.trailingItems(for: theme) })
    }

    private var subTitle: String? {
        configurationModel.subTitle.isEmpty ? nil : configurationModel.subTitle
    }
}
