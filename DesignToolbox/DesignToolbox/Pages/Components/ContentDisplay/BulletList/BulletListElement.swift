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

// MARK: - Bullet List Element

struct BulletListElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_bulletList_label".localized()
        illustration = AnyView(BulletListIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_bulletList_description_text",
            version: OUDSVersions.componentBulletListVersion,
            demoScreen: AnyView(BulletListPage())))
    }
}

// MARK: - Bullet List Illustration

private struct BulletListIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .center, spacing: theme.spaces.fixedNone) {
            OUDSBulletList {
                OUDSBulletList.Item("Label")
                OUDSBulletList.Item("Label")
            }
        }
        .padding(.leading, 120)
    }
}
