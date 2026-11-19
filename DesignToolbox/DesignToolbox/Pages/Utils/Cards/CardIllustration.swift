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

// TODO: USE OUDS CARD
struct CardIllustration: View {

    // MARK: Properties

    let illustration: AnyView
    var status: DesignToolboxComponentStatus = .stable

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        HStack {
            Spacer()
            illustration
                .accessibilityHidden(true)
                .allowsHitTesting(false)
            Spacer()
        }
        .frame(height: 184, alignment: .center)
        .accessibilityElement(children: .combine)
        .accessibilityRemoveTraits(.isImage)
        .accessibilityHidden(true)
        .foregroundStyle(theme.colors.contentDefault)
        .background(theme.colors.surfaceSecondary)
        .overlay(alignment: .topTrailing) {
            DesignToolboxComponentStatusTag(status: status)
                .padding(theme.spaces.fixedSmall)
        }
    }
}
