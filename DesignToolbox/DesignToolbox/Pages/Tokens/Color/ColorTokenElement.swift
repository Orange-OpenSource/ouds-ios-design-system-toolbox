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

// MARK: - Color Token Element

struct ColorTokenElement: DesignToolboxElement {

    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init(themeName: String) {
        name = "app_tokens_color_tech".localized()
        illustration = AnyView(Image.decorativeImage(named: "palette", prefixedBy: themeName))
        #if os(iOS)
        if #available(iOS 27, *) { // Trick for iPhone Duo
            pageDescription = AnyView(ColorTokenBrowserPage(illustration: illustration))
            return
        }
        #endif
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_tokens_color_description_text",
            demoScreen: AnyView(ColorTokenFamilyVariants(illustration: illustration))))
    }
}

// MARK: - Color Token Family Variants View

/// Uses the same platform-specific variant navigation as the Dimensions page.
private struct ColorTokenFamilyVariants: View {

    let illustration: AnyView

    @Environment(\.theme) private var theme

    var body: some View {
        let elements: [DesignToolboxElement] = ColorTokenCategory.available(in: theme).map { category in
            ColorTokenFamilyElement(category: category, illustration: illustration)
        }

        DesignToolboxVariantElement(elements: elements)
    }
}

// MARK: - Color Token Family Element

private struct ColorTokenFamilyElement: DesignToolboxElement {

    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init(category: ColorTokenCategory, illustration: AnyView) {
        name = category.rawValue
        self.illustration = illustration
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_tokens_color_description_text",
            demoScreen: AnyView(ColorTokenPage(category: category))))
    }
}
