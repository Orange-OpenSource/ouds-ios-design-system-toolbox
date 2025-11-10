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

struct BordersView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(title: "Borders",
                              watchLayout: { watchLayout },
                              tvLayout: { tvLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            Text("Width").font(.headline)
            ForEach(NamedBorderWidth.allCases, id: \.rawValue) { namedWidth in
                BorderTokenPage.IllustrationWidth(namedWidth: namedWidth)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("Radius").font(.headline)
            ForEach(NamedBorderRadius.allCases, id: \.rawValue) { namedRadius in
                BorderTokenPage.IllustrationRadius(namedRadius: namedRadius)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("Styles").font(.headline)
            ForEach(NamedBorderStyle.allCases, id: \.rawValue) { namedStyle in
                BorderTokenPage.IllustrationStyle(namedStyle: namedStyle)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private var tvLayout: some View {
        TVGridLayout(count: 3) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                Text("Width").font(.headline)
                ForEach(NamedBorderWidth.allCases, id: \.rawValue) { namedWidth in
                    BorderTokenPage.IllustrationWidth(namedWidth: namedWidth)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                Text("Radius").font(.headline)
                ForEach(NamedBorderRadius.allCases, id: \.rawValue) { namedRadius in
                    BorderTokenPage.IllustrationRadius(namedRadius: namedRadius)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                Text("Styles").font(.headline)
                ForEach(NamedBorderStyle.allCases, id: \.rawValue) { namedStyle in
                    BorderTokenPage.IllustrationStyle(namedStyle: namedStyle)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
