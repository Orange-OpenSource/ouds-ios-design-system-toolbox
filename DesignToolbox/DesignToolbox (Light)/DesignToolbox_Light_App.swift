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

/// `App` dedicated to watchOS and tvOS with very simple UI.
/// Displays groups of components without customziation panes, only for debug purposes and quickchecks.
/// Uses a simple UI, overall becayse current Design System Toolbox is desgined for iOS first.
@main struct DesignToolbox_Light_App: App {

    @State private var selectedThemeIndex: Int = 0

    private let themes: [OUDSTheme] = [
        OrangeTheme(),
        SoshTheme(),
        WireframeTheme(),
        OrangeBusinessToolsTheme(),
    ]

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedThemeIndex) {
                ForEach(themes.indices, id: \.self) { index in
                    OUDSThemeableView(theme: themes[index]) {
                        NavigationView {
                            List {
                                Section("Tokens") {
                                    TokensView()
                                }
                                Section("Components") {
                                    ComponentsView()
                                }
                            }
                            .navigationTitle(themes[index].name)
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle()) // Let user swipe to change theme and compare
        }
    }
}
