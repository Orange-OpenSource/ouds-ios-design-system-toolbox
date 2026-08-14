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

struct Card: View {

    // MARK: Properties

    let title: LocalizedStringKey
    let illustration: AnyView

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            CardIllustration(illustration: illustration)
            OUDSHeading(title, size: .medium)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, theme.spaces.fixedMedium)
                .padding(.vertical, theme.spaces.fixedMedium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(theme.colors.contentDefault)
        }
        .background(theme.colors.overlayDropdown)
        .shadow(theme.elevations.raised)
    }
}
