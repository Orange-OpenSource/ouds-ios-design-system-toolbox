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

struct IllustrationFont: View {

    let namedFont: NamedFont

    private var token: FontCompositeSemanticToken {
        namedFont.token(from: theme).fontToken(for: horizontalSizeClass ?? .regular)
    }

    @Environment(\.theme) private var theme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            illustration(for: namedFont, in: theme)
                .foregroundStyle(theme.colors.contentDefault)

            Group {
                Text(familyText)
                    + Text(weightText)
                    + Text(sizeText)
                    + Text(lineHeightText)
                    + Text(letterSpacingText)
            }
            .bodyDefaultMedium(theme)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(theme.colors.contentMuted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, theme.spaces.fixedXsmall)
        .accessibilityElement(children: .combine)
    }

    private var familyText: String {
        "app_tokens_typography_family_tech" <- "\(theme.fontFamily ?? "system")"
    }

    private var weightText: String {
        "app_tokens_typography_weight_tech" <- token.weight
    }

    private var sizeText: String {
        "app_tokens_typography_size_tech" <- token.size
    }

    private var lineHeightText: String {
        "app_tokens_typography_lineHeight_tech" <- token.lineHeight
    }

    private var letterSpacingText: String {
        "app_tokens_typography_letterSpacing_tech" <- token.letterSpacing
    }
}
