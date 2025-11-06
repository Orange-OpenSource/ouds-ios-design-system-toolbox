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

@main
struct DesignToolbox_Watch_App: App {
    @State private var selectedThemeIndex: Int = 0

    private let themes: [OUDSTheme] = [
        OrangeTheme(),
        OrangeBusinessToolsTheme(),
        SoshTheme(),
        WireframeTheme(),
    ]

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedThemeIndex) {
                ForEach(themes.indices, id: \.self) { index in
                    OUDSThemeableView(theme: themes[index]) {
                        ContentView()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}
