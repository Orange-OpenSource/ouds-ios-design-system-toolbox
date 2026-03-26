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

struct TagElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let wording = "app_components_common_label_label".localized()
        name = "app_components_tag_tag_tech".localized()
        illustration = AnyView(OUDSTag(label: wording, status: .positive(leading: .icon), appearance: .emphasized, shape: .rounded, size: .default))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tag_tag_description_text",
            version: OUDSVersions.componentTagVersion,
            demoScreen: AnyView(TagPage())))
    }
}
