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

struct IllustrationElevation: View {

    let namedElevation: NamedElevation

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        let token = namedElevation.token(from: theme)
        let name = namedElevation.rawValue
        let value = description(for: token)

        DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            Rectangle()
                .frame(width: theme.sizes.iconDecorative2xlarge, height: theme.sizes.iconDecorative2xlarge)
                .oudsForegroundColor(theme.colors.bgSecondary)
                .oudsShadow(token)
                .padding(.bottom, 2)
        }
    }

    private func description(for token: ElevationCompositeSemanticToken) -> String {
        let colorBasedToken = colorScheme == .light ? token.light : token.dark
        let x = colorBasedToken.x
        let y = colorBasedToken.y
        let radius = colorBasedToken.radius
        let color = colorBasedToken.color
        return String(format: "x: %.2f, y: %.2f, radius: %.2f\nColor: %@", x, y, radius, color)
    }
}
