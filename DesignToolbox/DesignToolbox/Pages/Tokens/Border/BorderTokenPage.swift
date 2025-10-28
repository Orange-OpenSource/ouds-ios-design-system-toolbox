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
import OUDSTokensSemantic
import SwiftUI

struct BorderTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMedium) {
            Section {
                VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                    DesignToolboxCode(code: "theme.borders.widthDefault", titleText: "app_tokens_common_viewCodeExample_label")
                }
            }
            Section {
                VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                    ForEach(NamedBorderWidth.allCases, id: \.rawValue) { namedWidth in
                        IllustrationWidth(namedWidth: namedWidth)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                Text("app_tokens_border_width_label")
                    .typeHeadingLarge(theme)
                    .oudsForegroundStyle(theme.colors.colorContentDefault)
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                    ForEach(NamedBorderRadius.allCases, id: \.rawValue) { namedRadius in
                        IllustrationRadius(namedRadius: namedRadius)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                Text("app_tokens_border_radius_label")
                    .typeHeadingLarge(theme)
                    .oudsForegroundStyle(theme.colors.colorContentDefault)
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                    ForEach(NamedBorderStyle.allCases, id: \.rawValue) { namedStyle in
                        IllustrationStyle(namedStyle: namedStyle)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                Text("app_tokens_border_style_label")
                    .typeHeadingLarge(theme)
                    .oudsForegroundStyle(theme.colors.colorContentDefault)
            }
        }
        .padding(.horizontal, theme.spaces.spaceFixedMedium)
    }

    struct RectangleBackground: View {
        @Environment(\.theme) private var theme
        @Environment(\.colorScheme) private var colorScheme

        var body: some View {
            Rectangle()
                .fill(theme.colors.colorBgSecondary.color(for: colorScheme))
                .frame(width: 64, height: 64)
        }
    }

    struct IllustrationWidth: View {
        @Environment(\.theme) private var theme

        let namedWidth: NamedBorderWidth

        var body: some View {
            let token = namedWidth.token(from: theme)
            let name = namedWidth.rawValue
            let value = String(format: "%.2f pt", token)

            DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
                RectangleBackground()
                    .oudsBorder(style: theme.borders.styeDefault,
                                width: token,
                                radius: theme.borders.radiusNone,
                                color: theme.colors.colorBorderFocus)
            }
        }
    }

    struct IllustrationRadius: View {
        @Environment(\.theme) private var theme

        let namedRadius: NamedBorderRadius

        var body: some View {
            let token = namedRadius.token(from: theme)
            let name = namedRadius.rawValue
            let value = String(format: "%.2f pt", token)

            DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
                RectangleBackground()
                    .oudsBorder(style: theme.borders.styeDefault,
                                width: theme.borders.widthDefault,
                                radius: token,
                                color: theme.colors.colorBorderFocus)
            }
        }
    }

    struct IllustrationStyle: View {
        @Environment(\.theme) private var theme

        let namedStyle: NamedBorderStyle

        var body: some View {
            let token = namedStyle.token(from: theme)
            let name = namedStyle.rawValue
            let value = token

            DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
                RectangleBackground()
                    .oudsBorder(style: token,
                                width: theme.borders.widthDefault,
                                radius: theme.borders.radiusNone,
                                color: theme.colors.colorBorderFocus)
            }
        }
    }
}

enum NamedBorderRadius: String, CaseIterable {
    case radiusNone
    case radiusDefault
    case radiusSmall
    case radiusMedium
    case radiusLarge
    case radiusPill

    func token(from theme: OUDSTheme) -> BorderRadiusSemanticToken {
        switch self {
        case .radiusNone:
            theme.borders.radiusNone
        case .radiusDefault:
            theme.borders.radiusDefault
        case .radiusSmall:
            theme.borders.radiusSmall
        case .radiusMedium:
            theme.borders.radiusMedium
        case .radiusLarge:
            theme.borders.radiusLarge
        case .radiusPill:
            theme.borders.radiusPill
        }
    }
}

enum NamedBorderWidth: String, CaseIterable {
    case widthNone
    case widthDefault
    case widthThin
    case widthMedium
    case widthThick
    case widthThicker
    case widthFocus
    case widthFocusInset

    func token(from theme: OUDSTheme) -> BorderWidthSemanticToken {
        switch self {
        case .widthNone:
            theme.borders.widthNone
        case .widthDefault:
            theme.borders.widthDefault
        case .widthThin:
            theme.borders.widthThin
        case .widthMedium:
            theme.borders.widthMedium
        case .widthThick:
            theme.borders.widthThick
        case .widthThicker:
            theme.borders.widthThicker
        case .widthFocus:
            theme.borders.widthFocus
        case .widthFocusInset:
            theme.borders.widthFocusInset
        }
    }
}

enum NamedBorderStyle: String, CaseIterable {
    case styeDefault
    case styeDrag

    func token(from theme: OUDSTheme) -> BorderStyleSemanticToken {
        switch self {
        case .styeDefault:
            theme.borders.styeDefault
        case .styeDrag:
            theme.borders.styeDrag
        }
    }
}
