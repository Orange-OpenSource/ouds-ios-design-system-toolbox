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
        pageDescription = AnyView(DesignToolboxElementModal(
            name: name,
            description: "app_components_tabBar_description_text",
            version: "(WIP)",
            demoScreen: AnyView(TabBarPage())))
    }
}

private struct TabBarIllustration: View {

    @Environment(\.layoutDirection) var direction

    var body: some View {
        Text("Tab bar (WIP)")
    }
}
