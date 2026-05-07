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
import OUDSTokensSemantic
import SwiftUI

// MARK: Toolbar Bottom Page

#if !os(iOS)
struct ToolBarBottomPage: View {
    var body: some View {
        Text("app_common_soonAvailable")
    }
}
#else
struct ToolBarBottomPage: View {

    @StateObject private var configurationModel: ToolBarBottomConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: ToolBarBottomConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ToolBarBottomDemo(configurationModel: configurationModel)
        } configurationView: {
            ToolBarBottomConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Toolbar Bottom Demo

private struct ToolBarBottomDemo: View {

    @ObservedObject var configurationModel: ToolBarBottomConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSButton("app_components_toolbar_demo_showDemo_label", appearance: .strong) {
            configurationModel.showDemo = true
        }
        .disabled(configurationModel.leading == .none && configurationModel.trailing == .none)
        .sheet(isPresented: $configurationModel.showDemo) {
            OUDSNavigationStack(content: demo)
        }
    }

    @ViewBuilder
    private func demo() -> some View {
        ToolBarCommonContentView()
            .modifier(BottomBarModifier(configurationModel: configurationModel))
            .background(theme.colors.overlayModalSheet)
            .toolBarTop("Demo") {
                OUDSToolBarItem(navigation: .close)
            }
    }
}

// MARK: - Bottom Bar Modifier

private struct BottomBarModifier: ViewModifier {

    @ObservedObject var configurationModel: ToolBarBottomConfigurationModel
    @Environment(\.theme) private var theme

    func body(content: Content) -> some View {
        if configurationModel.groupedItems {
            content.toolBarBottom(groupedItems: {
                configurationModel.leadingItems(for: theme)
            })
        } else {
            content
                .toolBarBottom {
                    configurationModel.leadingItems(for: theme)
                } trailingItems: {
                    configurationModel.trailingItems()
                }
        }
    }
}
#endif
