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

/// Using Swift files from DesignToolbox folder, displays simply the fonts tokens
struct FontsView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(title: "Fonts",
                              watchLayout: { watchLayout },
                              tvLayout: { tvLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(NamedFont.allCases, id: \.rawValue) { fontName in
                FontTokenPage.IllustrationFont(namedFont: fontName)
            }
        }
    }

    @ViewBuilder
    private var tvLayout: some View {
        TVGridLayout(count: 4) {
            ForEach(NamedFont.allCases, id: \.rawValue) { fontName in
                FontTokenPage.IllustrationFont(namedFont: fontName).focusable()
            }
        }
    }
}
