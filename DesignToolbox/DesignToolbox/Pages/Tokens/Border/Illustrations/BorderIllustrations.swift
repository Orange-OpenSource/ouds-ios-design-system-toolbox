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

struct RectangleBackground: View {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Rectangle()
            .fill(theme.colors.bgSecondary.color(for: colorScheme))
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
                .oudsBorder(style: theme.borders.styleDefault,
                            width: token,
                            radius: theme.borders.radiusNone,
                            color: theme.colors.borderFocus)
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
                .oudsBorder(style: theme.borders.styleDefault,
                            width: theme.borders.widthDefault,
                            radius: token,
                            color: theme.colors.borderFocus)
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
                            color: theme.colors.borderFocus)
        }
    }
}
