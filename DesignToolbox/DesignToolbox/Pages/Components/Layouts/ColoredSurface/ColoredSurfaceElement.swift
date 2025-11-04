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

struct ColoredSurfaceElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_common_onColoredBackground_label".localized()
        illustration = AnyView(ColoredSurfaceIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_coloredSurface_description_text",
            demoScreen: AnyView(ColoredSurfacePage())))
    }
}

private struct ColoredSurfaceIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        OUDSColoredSurface(color: theme.colorModes.onBrandPrimary) {
            Rectangle().fill(Color.clear)
        }
        .padding(.horizontal, theme.spaces.fixedSmall)
        .padding(.vertical, theme.spaces.fixedMedium)
    }
}
