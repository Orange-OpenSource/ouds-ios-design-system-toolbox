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

// MARK: Toolbar Top Page

#if !os(iOS)
struct ToolBarTopPage: View {
    var body: some View {
        Text("app_common_soonAvailable")
    }
}
#else
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

// MARK: - Toolbar Top Demo

private struct ToolBarTopDemo: View {

    @ObservedObject var configurationModel: ToolBarTopConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        NavigationLink(destination: demo(), isActive: $configurationModel.showNavigation) {
            OUDSButton("app_components_toolbar_demo_showDemo_label", appearance: .strong) {
                switch configurationModel.demoOption {
                case .navigation:
                    configurationModel.showNavigation = true
                case .modalSheet:
                    configurationModel.showModalSheet = true
                case .fullCover:
                    configurationModel.showFullCover = true
                }
            }
        }
        .sheet(isPresented: $configurationModel.showModalSheet) {
            OUDSNavigationStack(content: demo)
                .modalSheetDragIndicator()
        }
        .fullScreenCover(isPresented: $configurationModel.showFullCover) {
            OUDSNavigationStack(content: demo)
                .modalSheetDragIndicator()
        }
    }

    @ViewBuilder
    private func demo() -> some View {
        ToolBarCommonContentView()
            .background(theme.colors.overlayModalSheet)
            .navigationBarBackButtonHidden(configurationModel.hideBackButton)
            .toolBarTop(configurationModel.title,
                        hasLargeTitle: configurationModel.largeTitle,
                        subtitle: appliedSubtitle)
            {
                configurationModel.leadingItems(for: theme)
            } trailingItems: {
                configurationModel.trailingItems(for: theme)
            }
    }

    private var appliedSubtitle: String? {
        configurationModel.subTitle.isEmpty ? nil : configurationModel.subTitle
    }
}

// MARK: - Extension of View

extension View {

    @ViewBuilder
    func modalSheetDragIndicator() -> some View {
        if #available(iOS 16.0, *) {
            self.presentationDragIndicator(.visible)
        } else {
            self
        }
    }
}

#endif
