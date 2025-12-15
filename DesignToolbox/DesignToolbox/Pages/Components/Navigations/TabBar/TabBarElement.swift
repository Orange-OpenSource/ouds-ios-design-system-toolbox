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

struct TabBarElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_tabBar_label".localized()
        illustration = AnyView(TabBarIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tabBar_description_text",
            version: OUDSVersions.componentNavigationBarVersion,
            demoScreen: AnyView(TabBarPage())))
    }
}

private struct TabBarIllustration: View {

    var body: some View {
        OUDSTabBar(count: 3) {
            FakeTabItem(title: "Label", imageName: "heart-empty", tag: 0)
            FakeTabItem(title: "Label", imageName: "heart-empty", tag: 1)
            FakeTabItem(title: "Label", imageName: "heart-empty", tag: 2)
        }
        .frame(maxHeight: 100)
    }

    private struct FakeTabItem: View {
        let title: String
        let imageName: String
        let tag: Int

        @Environment(\.theme) private var theme

        var body: some View {
            Text("")
                .tabItem {
                    Label {
                        Text(title)
                    } icon: {
                        Image.decorativeImage(named: imageName, prefixedBy: theme.name)
                            .renderingMode(.template)
                    }
                }
                .tag(tag)
        }
    }
}
