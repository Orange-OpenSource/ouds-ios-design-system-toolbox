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

struct ColoredBackgroundView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(title: "Surfaces",
                              watchLayout: { WatchVerticalLayout { layout } },
                              tvLayout: { TVVerticalLayout { layout } })
    }

    private var layout: some View {
        VStack(spacing: theme.spaces.scaledXsmallMobile) {
            ForEach(NamedColorMode.allCases, id: \.self) { color in
                let themedColor = color.toSurfaceColor(from: theme)
                if !themedColor.hasUndefinedValue() {
                    Text(String(describing: color)).font(.headline)
                    OUDSColoredSurface(color: themedColor) {
                        ColoredSurfaceItems()
                    }.focusable()
                }
            }
        }
    }
}

private struct ColoredSurfaceItems: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .center, spacing: theme.spaces.scaledSmallMobile) {
            Text("Text").oudsForegroundColor(theme.colors.contentDefault)
            OUDSButton(text: "Button", appearance: .default, style: .default) {}
            OUDSLink(text: "Link", indicator: .next) {}
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
