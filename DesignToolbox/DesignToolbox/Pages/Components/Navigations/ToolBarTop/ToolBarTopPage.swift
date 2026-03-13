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
            ToolBarTopDemo(configurationModel: configurationModel)
        } configurationView: {
            ToolBarTopConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Tab bar demo

struct ToolBarTopDemo: View {

    @ObservedObject var configurationModel: ToolBarTopConfigurationModel
    @Environment(\.theme) private var theme
    @State private var showDestination: Bool = false
    @State private var showSheet: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    Text("Some content")
//                    NavigationLink(destination: Text("Some content"), isActive: $showDestination) {
//                        OUDSLink(text: "Go to next page", indicator: .next) {
//                            showDestination.toggle()
//                        }
//                    }
//
//                    OUDSLink(text: "Go to next page", indicator: .next) {
//                        showSheet.toggle()
//                    }
//                    .sheet(isPresented: $showSheet) {
//                        Text("Some content")
//                    }
                }
                .frame(maxWidth: .infinity)
                .background(.red)
            }
            .oudsToolBarTop(configurationModel.title,
                            largeTitle: configurationModel.largeTitle,
                            subtitle: subTitle,
                            leadingItems: { configurationModel.leadingItems(for: theme) },
                            trailingItems: { configurationModel.trailingItems(for: theme) })
        }
        .oudsBorder(style: theme.borders.styleDefault,
                    width: theme.borders.widthDefault,
                    radius: theme.borders.radiusDefault,
                    color: theme.colors.borderDefault)
        .padding(.all, theme.spaces.fixedMedium)
        #if canImport(UIKit)
            .frame(maxHeight: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 150)
        #endif
    }

    private var subTitle: String? {
        configurationModel.subTitle.isEmpty ? nil : configurationModel.subTitle
    }
}
