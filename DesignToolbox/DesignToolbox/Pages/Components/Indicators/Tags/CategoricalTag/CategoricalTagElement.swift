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

struct CategoricalTagElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_tag_categoricalTag_tech".localized()
        illustration = AnyView(OUDSCategoricalTag(label: "app_components_common_label_label",
                                                  category: .category1,
                                                  leading: .bullet,
                                                  shape: .rounded,
                                                  size: .default))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tag_categoricalTag_description_text",
            version: OUDSVersions.componentCategoricalTagVersion,
            demoScreen: AnyView(CategoricalTagPage())))
    }
}
