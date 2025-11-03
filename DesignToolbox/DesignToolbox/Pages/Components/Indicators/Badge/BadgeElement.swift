//
// Software Name: OUDSThemesContract iOS
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

struct BadgeElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_badge_label".localized()
        illustration = AnyView(OUDSBadge(count: 1, status: .negative, size: .medium))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_badge_description_text",
            version: OUDSVersions.componentBadgeVersion,
            demoScreen: AnyView(BadgePage())))
    }
}
