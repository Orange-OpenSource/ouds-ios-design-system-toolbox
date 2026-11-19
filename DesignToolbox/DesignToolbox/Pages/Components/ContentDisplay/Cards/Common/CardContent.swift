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

/// Content used by CardDemo and ActionCardDemo
struct CardContent: View {

    // MARK: Properties

    @StateObject var configurationModel: CardConfigurationModel
    let isInActionCard: Bool

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    // MARK: Body

    var body: some View {
        switch configurationModel.contentExample {
        case .simple:
            Rectangle()
                .fill(theme.colors.surfaceStatusInfoMuted)
                .frame(height: 150)

        case .useCase:
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSTag(label: "New", status: .warning(leading: .none), shape: .square)

                VStack(spacing: 0) {
                    OUDSHeading(text: "Samsung")
                    OUDSLabel(text: "Galaxy S26 FE EE", weight: .moderate)

                    Group {
                        if isInActionCard {
                            OUDSAlertMessage(label: "Not available anymore", status: .negative)
                        } else {
                            OUDSButton(text: "Order", appearance: .strong, isFullWidth: true) {}
                        }
                    }
                    .padding(.top, theme.spaces.fixedLarge)
                }
                .gridMargin()
            }
            .background(configurationModel.useDefaultBackground ? .clear : theme.colors.bgPrimary.color(for: colorScheme))
        }
    }
}
