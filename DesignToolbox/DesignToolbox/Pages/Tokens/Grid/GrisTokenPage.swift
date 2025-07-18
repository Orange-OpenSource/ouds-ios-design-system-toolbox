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

import OUDS
import OUDSTokensRaw
import OUDSTokensSemantic
import SwiftUI

struct GridTokenPage: View {

    @Environment(\.theme) private var theme
    @Environment(\.oudsHorizontalSizeClass) private var horizontalSizeClass

    // MARK: Body

    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
                Image(decorative: "il_tokens_grid_column_margin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .oudsBackground(theme.colors.colorSurfaceStatusNeutralMuted)
                Image(decorative: "il_tokens_grid_min_width")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .oudsBackground(theme.colors.colorSurfaceStatusNeutralMuted)
                Image(decorative: "il_tokens_grid_max_width")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .oudsBackground(theme.colors.colorSurfaceStatusNeutralMuted)
            }

            Section {
                DesignToolboxCode(code: "theme.gridColumnCount(for: horizontalSizeClass)", titleText: "app_tokens_common_viewCodeExample_label")
            }

            Section { illustrationForGridTokens() } header: {
                Text(horizontalSizeClass.rawValue)
                    .designToolboxSectionHeaderStyle()
            }
        }
        .padding(.horizontal, theme.spaces.spaceFixedMd)
    }

    // MARK: Private helpers

    private func illustrationForGridTokens() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
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
    case gridMinWidth
    case gridMaxWidth
    case gridMargin
    case gridColumnGap

    @MainActor
    func token(from theme: OUDSTheme, for sizeClass: OUDSUserInterfaceSizeClass) -> GridRawToken {
        switch self {
        case .gridMinWidth:
            theme.gridMinWidth(for: sizeClass)
        case .gridMaxWidth:
            theme.gridMaxWidth(for: sizeClass)
        case .gridMargin:
            theme.gridMargin(for: sizeClass)
        case .gridColumnGap:
            theme.gridColumnGap(for: sizeClass)
        }
    }
}
