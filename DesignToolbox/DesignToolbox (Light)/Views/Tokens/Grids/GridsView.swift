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

/// Using Swift files from DesignToolbox folder, displays simply the grids tokens
struct GridsView: View {

    @Environment(\.theme) private var theme
    @Environment(\.oudsHorizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        WatchAndTVLayoutsView(title: "Grids",
                              watchLayout: { watchLayout },
                              tvLayout: { tvLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(NamedGrid.allCases, id: \.rawValue) { namedGrid in
                illustration(for: namedGrid)
            }
        }
    }

    @ViewBuilder
    private var tvLayout: some View {
        TVVerticalLayout {
            ForEach(NamedGrid.allCases, id: \.rawValue) { namedGrid in
                illustration(for: namedGrid)
            }
        }
    }

    private func illustration(for namedGrid: NamedGrid) -> some View {
        let token = namedGrid.token(from: theme, for: horizontalSizeClass)
        let name = namedGrid.rawValue
        let value = String(format: "%.2f pt", token)

        return DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            EmptyView()
        }
    }
}
