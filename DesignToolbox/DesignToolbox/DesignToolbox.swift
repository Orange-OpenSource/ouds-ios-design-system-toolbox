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
struct DesignToolbox: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @AppStorage("colorSchemeMode") private var mode: String = ColorSchemeMode.auto.rawValue
    @StateObject private var themeProvider = ThemeProvider()

    #if os(macOS)
    @StateObject private var windowManager = WindowManager()
    #endif

    private var colorScheme: ColorScheme? {
        if mode == ColorSchemeMode.light.rawValue {
            return .light
        }
        if mode == ColorSchemeMode.dark.rawValue {
            return .dark
        }
        return nil
    }

    var body: some View {
        OUDSThemeableView(theme: themeProvider.currentTheme) {
            MainView().environmentObject(themeProvider)
        }
        .preferredColorScheme(colorScheme)
        #if os(macOS)
            .environmentObject(windowManager)
        #endif
    }
}
