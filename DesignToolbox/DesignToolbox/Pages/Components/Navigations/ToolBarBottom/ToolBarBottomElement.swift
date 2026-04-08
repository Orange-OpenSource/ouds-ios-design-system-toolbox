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

struct ToolBarBottomElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_bottomAppBar_tech"
        illustration = AnyView(ToolBarBottomIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_bottomAppBar_description_text",
            version: OUDSVersions.componentNavigationBarVersion,
            demoScreen: AnyView(ToolBarBottomPage())))
    }
}

private struct ToolBarBottomIllustration: View {

    @Environment(\.theme) var theme

    var body: some View {
        HStack {
            OUDSToolBarItem(action: .label("app_components_common_label_label".localized(),
                                           emphasized: true,
                                           accessibilityHint: "",
                                           action: {}))

            Spacer()

            #if !os(visionOS)
            if #available(iOS 26, *) {
                OUDSToolBarItem(action: .icon(asset: Image.defaultImage(prefixedBy: theme.name),
                                              accessibilityLabel: "",
                                              action: {}),
                                style: .proiminent)
            } else {
                OUDSToolBarItem(action: .icon(asset: Image.defaultImage(prefixedBy: theme.name),
                                              accessibilityLabel: "",
                                              action: {}))
            }
            #endif
        }
        .padding()
        .frame(maxHeight: 50)
        .border(style: theme.borders.styleDefault,
                width: theme.borders.widthDefault,
                radius: theme.borders.radiusDefault,
                color: theme.colors.borderMinimal)
        .background(theme.colors.overlayModal)
    }
}
