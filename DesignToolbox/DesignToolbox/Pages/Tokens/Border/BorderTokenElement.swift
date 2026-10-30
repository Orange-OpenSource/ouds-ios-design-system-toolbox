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

import SwiftUI

struct BorderTokenElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_tokens_border_tech".localized()
        illustration = AnyView(Image(decorative: "ic_border").renderingMode(.template))
        #if os(iOS)
        if #available(iOS 27.1, *) { // Trick for iPhone Duo
            pageDescription = AnyView(BorderTokenDetailPage(illustration: illustration))
            return
        }
        #endif
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_tokens_border_description_text",
            demoScreen: AnyView(BorderTokenPage())))
    }
}
