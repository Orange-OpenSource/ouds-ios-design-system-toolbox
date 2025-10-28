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

import OUDSComponents
import SwiftUI

// MARK: - Card

struct Card: View {

    @Environment(\.theme) private var theme

    // MARK: Stored properties

    let title: Text
    let illustration: AnyView

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CardIllustration(illustration: illustration)
            title
                .headingMedium(theme)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, theme.spaces.fixedMedium)
                .padding(.vertical, theme.spaces.fixedMedium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .oudsForegroundStyle(theme.colors.contentDefault)
        }
        .oudsBackground(theme.colors.overlayDropdown)
        .oudsShadow(theme.elevations.raised)
        .padding(.all, 4)
    }
}
