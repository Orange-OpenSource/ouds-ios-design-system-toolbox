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

struct AlertMessageView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        tvOSGridLayout
    }

    // MARK: - tvOS

    private var tvOSGridLayout: some View {
        TVGridLayout(count: 3) {

            // Column n°1: neutral, accent
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Neutral")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                alertMessageView(title: "Neutral alert", status: .neutral())

                Text("Accent")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                alertMessageView(title: "Accent alert", status: .accent())
            }
            .padding()

            // Column n°2: positive, info
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Positive")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                alertMessageView(title: "Positive alert", status: .positive)

                Text("Informational")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                alertMessageView(title: "Info alert", status: .info)
            }
            .padding()

            // Column n°3: warning, negative
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Warning")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                alertMessageView(title: "Warning alert", status: .warning)

                Text("Negative")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                alertMessageView(title: "Negative alert", status: .negative)
            }
            .padding()
        }
        .padding()
    }

    @ViewBuilder
    private func alertMessageView(title: String, status: OUDSAlertMessage.Status) -> some View {
        OUDSAlertMessage(label: title,
                         status: status,
                         bulletList: ["Bullet 1", "Bullet 2", "Bullet 3"],
                         link: .init(text: "Link", position: .bottom) {},
                         onClose: {})
    }
}
