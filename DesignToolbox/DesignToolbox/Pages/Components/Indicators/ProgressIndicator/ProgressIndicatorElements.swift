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

struct ProgressIndicatorElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            CircularProgressIndicatorElement(),
            LinearProgressIndicatorElement(),
        ]

        name = "app_components_progressIndicator_tech".localized()
        illustration = AnyView(ProgressIndicatorIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_progressIndicator_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct ProgressIndicatorIllustration: View {

    var body: some View {
        VStack(spacing: 8) {
            OUDSCircularProgressIndicator(progress: 0.75, animated: false)
            OUDSLinearProgressIndicator(progress: 0.75, animated: false)
                .frame(maxWidth: 120)
        }
    }
}
