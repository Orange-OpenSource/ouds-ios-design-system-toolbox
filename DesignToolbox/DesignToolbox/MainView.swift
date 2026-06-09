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

    /// To know if the search bar must be used or not in the app, from app settings
    @AppStorage("com.orange.ouds.demoapp.allowSearch") private var allowSearch: Bool = true

    // MARK: - Body

    var body: some View {
        #if os(iOS)
        if #available(iOS 26, *), allowSearch, !isLiquidGlassDisabled, UIDevice.current.userInterfaceIdiom == .phone {
            nativeTabBar
        } else {
            oudsTabBar
        }
        #else
        legacyTabBar
        #endif
    }

    // MARK: - iOS 26+ native TabView with search tab

    #if os(iOS)

    @available(iOS 26, *)
    private var nativeTabBar: some View {
        TabView {
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
        .onAppear {
            applyOUDSTabBarAppearance(colorScheme, theme)
        }
        .onChange(of: colorScheme) { newScheme in
            applyOUDSTabBarAppearance(newScheme, theme)
        }
        .onChange(of: theme) { newTheme in
            applyOUDSTabBarAppearance(colorScheme, newTheme)
        }
    }
    #endif

    // MARK: - iOS 15-18 / iOS 26 without Liquid Glass / macOS / visionOS legacy tab bar (no search)

    private var oudsTabBar: some View {
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
        .modifier(OUDSLegacyTabBarModifier())
    }
}
