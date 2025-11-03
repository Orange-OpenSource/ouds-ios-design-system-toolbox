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

import OUDSSwiftUI
import SwiftUI

struct DesignToolboxTokenIllustration<TokenIllustration>: View where TokenIllustration: View {

    @Environment(\.theme) private var theme

    // MARK: Stored properties

    let tokenName: String
    let tokenValue: String?
    @ViewBuilder let tokenIllustration: () -> TokenIllustration

    // MARK: Initializer

    init(tokenName: String,
         tokenValue: String? = nil,
         tokenIllustration: @escaping () -> TokenIllustration)
    {
        self.tokenIllustration = tokenIllustration
        self.tokenName = tokenName
        self.tokenValue = tokenValue
    }

    // MARK: Body

    var body: some View {

        HStack(alignment: .top, spacing: theme.spaces.fixedMedium) {

            tokenIllustration()

            VStack(alignment: .leading) {
                Text(tokenName)
                    .bodyStrongLarge(theme)
                    .oudsForegroundStyle(theme.colors.contentDefault)
                if let tokenValue {
                    Text(tokenValue)
                        .bodyDefaultMedium(theme)
                        .oudsForegroundStyle(theme.colors.contentMuted)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityElement(children: .combine)
        }
        .padding(.vertical, theme.spaces.fixedXsmall)
    }
}
