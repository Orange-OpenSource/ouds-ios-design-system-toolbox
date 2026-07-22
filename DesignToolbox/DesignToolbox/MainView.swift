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
#if os(iOS)
import UIKit
#endif

struct MainView: View {

    // MARK: - Properties

    @State private var selectedTab: Int = 0

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    // MARK: - Body

    var body: some View {
        #if os(iOS)
        if #available(iOS 26, *) {
            if isLiquidGlassDisabled {
                searchTabBar
            } else {
                liquidGlassSearchTabBar
            }
        } else if #available(iOS 18, *) {
            searchTabBar
        } else {
            tabBar
        }
        #elseif os(tvOS)
        tvOSTabBar
        #else
        tabBar
        #endif
    }

    // MARK: - tvOS Tab View

    #if os(tvOS)
    private var tvOSTabBar: some View {
        TabView(selection: $selectedTab) {
            TokensPage()
                .tabItem {
                    Label("app_bottomBar_tokens_label", image: "design-token")
                }
                .tag(0)
            ComponentsPage()
                .tabItem {
                    Label("app_bottomBar_components_label", image: "component-atom")
                }
                .tag(1)
            AboutPage()
                .tabItem {
                    Label("app_bottomBar_about_label", image: "info-fill")
                }
                .tag(2)
        }
        .accentColor(theme.button.colorContentMinimalEnabled)
    }
    #endif

    // MARK: - iOS Tab Bar / Tab View

    #if os(iOS)
    @available(iOS 26, *) // Supposing we did not disable Liquid Glass :3
    private var liquidGlassSearchTabBar: some View {
        OUDSLiquidGlassTabView {
            Tab("app_bottomBar_tokens_label", image: "design-token") {
                TokensPage()
            }
            Tab("app_bottomBar_components_label", image: "component-atom") {
                ComponentsPage()
            }
            Tab("app_bottomBar_about_label", image: "info-fill") {
                AboutPage()
            }
            Tab(role: .search) {
                SearchPage()
            }
        }
        .accentColor(theme.button.colorContentMinimalEnabled)
    }

    @available(iOS 18, *)
    private var searchTabBar: some View {
        OUDSTabView(selectedTab: $selectedTab, count: 4) {
            Tab("app_bottomBar_tokens_label", image: "design-token", value: 0) {
                TokensPage()
            }
            Tab("app_bottomBar_components_label", image: "component-atom", value: 1) {
                ComponentsPage()
            }
            Tab("app_bottomBar_about_label", image: "info-fill", value: 2) {
                AboutPage()
            }
            Tab(value: 3, role: .search) {
                SearchPage()
            }
        }
        .accentColor(theme.button.colorContentMinimalEnabled)
    }
    #endif

    // MARK: - Default Tab Bar

    private var tabBar: some View {
        OUDSTabBar(selectedTab: $selectedTab, count: 3) {
            TokensPage()
                .tabItem {
                    Label("app_bottomBar_tokens_label", image: "design-token")
                }
                .tag(0)
            ComponentsPage()
                .tabItem {
                    Label("app_bottomBar_components_label", image: "component-atom")
                }
                .tag(1)
            AboutPage()
                .tabItem {
                    Label("app_bottomBar_about_label", image: "info-fill")
                }
                .tag(2)
        }
        .accentColor(theme.button.colorContentMinimalEnabled)
//        .modifier(OUDSLegacyLayoutModifier())
    }
}
