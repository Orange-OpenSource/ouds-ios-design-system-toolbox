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

import OUDSThemesContract
import OUDSTokensRaw
import OUDSTokensSemantic
import SwiftUI

struct GridTokenPage: View {

    @Environment(\.theme) private var theme
    @Environment(\.oudsHorizontalSizeClass) private var horizontalSizeClass

    // MARK: Body

    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                Image(decorative: "il_tokens_grid_column_margin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .oudsBackground(theme.colors.surfaceSecondary)
                Image(decorative: "il_tokens_grid_min_width")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .oudsBackground(theme.colors.surfaceSecondary)
                Image(decorative: "il_tokens_grid_max_width")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .oudsBackground(theme.colors.surfaceSecondary)
            }

            Section {
                DesignToolboxCode(code: "theme.gridColumnCount(for: horizontalSizeClass)", titleText: "app_tokens_common_viewCodeExample_label")
            }

            Section { illustrationForGridTokens() } header: {
                Text(horizontalSizeClass.rawValue)
                    .designToolboxSectionHeaderStyle()
            }
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }

    // MARK: Private helpers

    private func illustrationForGridTokens() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
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

private enum NamedGrid: String, CaseIterable {
    case minWidth
    case maxWidth
    case margin
    case columnGap

    @MainActor
    func token(from theme: OUDSTheme, for sizeClass: OUDSUserInterfaceSizeClass) -> GridRawToken {
        switch self {
        case .minWidth:
            theme.gridMinWidth(for: sizeClass)
        case .maxWidth:
            theme.gridMaxWidth(for: sizeClass)
        case .margin:
            theme.gridMargin(for: sizeClass)
        case .columnGap:
            theme.gridColumnGap(for: sizeClass)
        }
    }
}
