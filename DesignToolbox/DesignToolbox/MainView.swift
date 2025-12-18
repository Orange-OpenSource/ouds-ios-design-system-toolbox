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

struct MainView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        OUDSTabBar(selected: 0, count: 3) {
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
        .oudsAccentColor(theme.colors.contentBrandPrimary)
    }
}
