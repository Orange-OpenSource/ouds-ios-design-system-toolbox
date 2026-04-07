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

struct ToolBarTopElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_topAppBar_tech"
        illustration = AnyView(ToolBarTopIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_topAppBar_description_text",
            version: OUDSVersions.componentNavigationBarVersion,
            demoScreen: AnyView(ToolBarTopPage())))
    }
}

private struct ToolBarTopIllustration: View {

    @Environment(\.theme) var theme

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
            }
            .oudsToolBarTop("app_components_common_label_label".localized()) {
                OUDSToolBarItem(navigation: .back())
            } trailingItems: {
                OUDSToolBarItem(action: .icon(asset: Image.defaultImage(prefixedBy: theme.name), accessibilityLabel: "", action: {}))
            }
        }
        .frame(maxHeight: 50)
    }
}
