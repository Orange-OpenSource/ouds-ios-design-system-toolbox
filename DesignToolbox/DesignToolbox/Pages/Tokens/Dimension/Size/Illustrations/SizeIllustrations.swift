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

// MARK: Illustration Icon Decorative

struct IllustrationIconDecorative: View {

    let namedSize: NamedSize.IconDecorative

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        let token = namedSize.token(from: theme)
        let name = namedSize.rawValue
        let value = String(format: "%.2f pt", token)

        DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            ZStack {
                Rectangle()
                    .fill(theme.colors.surfaceSecondary.color(for: colorScheme))
                    .frame(width: 82, height: 82, alignment: .center)

                Image("ic_token")
                    .resizable()
                    .renderingMode(.template)
                    .oudsForegroundColor(theme.colors.contentStatusInfo)
                    .frame(width: token, height: token, alignment: .center)
                    .accessibilityHidden(true)
            }
        }
    }
}

// MARK: Illustration Icon With Typography

struct IllustrationIconWithTypography: View {

    let namedSize: NamedSize.IconWithTypography

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        let token = namedSize.token(for: theme, userInterfaceSizeClass: horizontalSizeClass ?? .regular)
        let name = namedSize.sizeDescription
        let value = String(format: "%.2f pt", token)

        DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            ZStack {
                Rectangle()
                    .fill(theme.colors.surfaceSecondary.color(for: colorScheme))
                    .frame(width: 82, height: 82, alignment: .center)
                Image("ic_token")
                    .resizable()
                    .renderingMode(.template)
                    .oudsForegroundColor(theme.colors.contentStatusInfo)
                    .frame(width: token, height: token, alignment: .center)
                    .accessibilityHidden(true)
            }
        }
    }
}

// MARK: Illustration Size Icon By Typography Category

struct IllustrationSizeIconByTypographyCategory: View {

    let category: NamedSize.SizeIconByTypographyCategory

    @Environment(\.theme) private var theme

    var body: some View {
        if let lastSize = category.sizes.last {
            TypographyCategoryHeader(namedFont: category.namedFont, namedSize: lastSize)
        }

        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            ForEach(category.sizes, id: \.sizeDescription) { namedSize in
                IllustrationIconWithTypography(namedSize: namedSize)
            }
        }
    }
}

// MARK: Typography Category Header

private struct TypographyCategoryHeader: View {

    let namedFont: NamedFont
    let namedSize: NamedSize.IconWithTypography

    private var size: CGFloat {
        namedSize.token(for: theme, userInterfaceSizeClass: horizontalSizeClass ?? .regular)
    }

    @Environment(\.theme) private var theme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        HStack(alignment: .center, spacing: theme.spaces.fixedSmall) {
            HStack(alignment: .center, spacing: 1) {
                Image(decorative: "ic_token")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .oudsForegroundStyle(theme.colors.contentStatusInfo)
            }
            .frame(height: size, alignment: .center)

            illustration(for: namedFont, in: theme)
                .frame(maxWidth: .infinity, alignment: .leading)
                .oudsForegroundStyle(theme.colors.contentDefault)
        }
        .padding(.all, theme.spaces.fixedMedium)
        .oudsBackground(theme.colors.surfaceSecondary)
    }
}
