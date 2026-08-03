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
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    #if DEBUG
    /// DEBUG-only flag toggled from the About page. When `true`, a "Debug" tab
    /// wrapping ``SandboxPage`` is inserted at the first position of the tab bar.
    @AppStorage(SandboxUserDefaultsKeys.sandboxEnabled) private var sandboxEnabled: Bool = false
    #endif

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
    @ViewBuilder
    private var tvOSTabBar: some View {
        #if DEBUG
        if sandboxEnabled {
            TabView(selection: $selectedTab) {
                SandboxPage()
                    .tabItem {
                        Label("app_bottomBar_debug_label", systemImage: "hammer")
                    }
                    .tag(0)
                TokensPage()
                    .tabItem {
                        Label("app_bottomBar_tokens_label", image: "design-token")
                    }
                    .tag(1)
                ComponentsPage()
                    .tabItem {
                        Label("app_bottomBar_components_label", image: "component-atom")
                    }
                    .tag(2)
                AboutPage()
                    .tabItem {
                        Label("app_bottomBar_about_label", image: "info-fill")
                    }
                    .tag(3)
            }
            .accentColor(theme.button.colorContentMinimalEnabled)
        } else {
            defaultTvOSTabBar
        }
        #else
        defaultTvOSTabBar
        #endif
    }

    private var defaultTvOSTabBar: some View {
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
    @ViewBuilder
    private var liquidGlassSearchTabBar: some View {
        #if DEBUG
        if sandboxEnabled {
            OUDSLiquidGlassTabView {
<<<<<<< HEAD
                Tab("app_bottomBar_debug_label", systemImage: "hammer") {
=======
                Tab("app_navigation_debug_label", systemImage: "hammer") {
>>>>>>> 45a68ce90 (chore: clean sources (Orange-OpenSource/ouds-ios#265))
                    SandboxPage()
                }
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
        } else {
            defaultLiquidGlassSearchTabBar
        }
        #else
        defaultLiquidGlassSearchTabBar
        #endif
    }

    @available(iOS 26, *)
    private var defaultLiquidGlassSearchTabBar: some View {
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
    @ViewBuilder
    private var searchTabBar: some View {
        #if DEBUG
        if sandboxEnabled {
            OUDSTabView(selectedTab: $selectedTab, count: 5) {
<<<<<<< HEAD
                Tab("app_bottomBar_debug_label", systemImage: "hammer", value: 0) {
=======
                Tab("app_navigation_debug_label", systemImage: "hammer", value: 0) {
>>>>>>> 45a68ce90 (chore: clean sources (Orange-OpenSource/ouds-ios#265))
                    SandboxPage()
                }
                Tab("app_bottomBar_tokens_label", image: "design-token", value: 1) {
                    TokensPage()
                }
                Tab("app_bottomBar_components_label", image: "component-atom", value: 2) {
                    ComponentsPage()
                }
                Tab("app_bottomBar_about_label", image: "info-fill", value: 3) {
                    AboutPage()
                }
                Tab(value: 4, role: .search) {
                    SearchPage()
                }
            }
            .accentColor(theme.button.colorContentMinimalEnabled)
        } else {
            defaultSearchTabBar
        }
        #else
        defaultSearchTabBar
        #endif
    }

    @available(iOS 18, *)
    private var defaultSearchTabBar: some View {
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

    @ViewBuilder
    private var tabBar: some View {
        #if DEBUG
        if sandboxEnabled {
            OUDSTabBar(selectedTab: $selectedTab, count: 4) {
                SandboxPage()
                    .tabItem {
<<<<<<< HEAD
                        Label("app_bottomBar_debug_label", systemImage: "hammer")
=======
                        Label("app_navigation_debug_label", systemImage: "hammer")
>>>>>>> 45a68ce90 (chore: clean sources (Orange-OpenSource/ouds-ios#265))
                    }
                    .tag(0)
                TokensPage()
                    .tabItem {
                        Label("app_bottomBar_tokens_label", image: "design-token")
                    }
                    .tag(1)
                ComponentsPage()
                    .tabItem {
                        Label("app_bottomBar_components_label", image: "component-atom")
                    }
                    .tag(2)
                AboutPage()
                    .tabItem {
                        Label("app_bottomBar_about_label", image: "info-fill")
                    }
                    .tag(3)
            }
            .accentColor(theme.button.colorContentMinimalEnabled)
        } else {
            defaultTabBar
        }
        #else
        defaultTabBar
        #endif
    }

    private var defaultTabBar: some View {
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
