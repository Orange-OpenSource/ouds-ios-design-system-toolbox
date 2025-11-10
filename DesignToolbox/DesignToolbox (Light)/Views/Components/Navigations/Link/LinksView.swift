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

// swiftlint:disable accessibility_label_for_image
// swiftlint:disable closure_body_length

struct LinksView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(title: "Link",
                              watchLayout: { watchOSVerticalLayout },
                              tvLayout: { tvOSGridLayout })
    }

    // MARK: - watchOS

    private var watchOSVerticalLayout: some View {
        WatchVerticalLayout {
            Text("Size default").font(.headline)

            Text("Enabled").font(.subheadline)
            OUDSLink(text: "Link", size: .default) {}
            OUDSLink(text: "Link", icon: Image(systemName: "sun.min.fill"), size: .default) {}
            OUDSLink(text: "Link", indicator: .back, size: .default) {}
            OUDSLink(text: "Link", indicator: .next, size: .default) {}

            Text("Disabled").font(.subheadline)
            OUDSLink(text: "Link", size: .small) {}.disabled(true)
            OUDSLink(text: "Link", icon: Image(systemName: "sun.min.fill"), size: .small) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .back, size: .default) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .next, size: .default) {}.disabled(true)

            Text("Size small").font(.headline)

            Text("Enabled").font(.subheadline)
            OUDSLink(text: "Link", size: .small) {}
            OUDSLink(text: "Link", icon: Image(systemName: "sun.min.fill"), size: .small) {}
            OUDSLink(text: "Link", indicator: .back, size: .small) {}
            OUDSLink(text: "Link", indicator: .next, size: .small) {}

            Text("Disabled").font(.subheadline)
            OUDSLink(text: "Link", size: .small) {}.disabled(true)
            OUDSLink(text: "Link", icon: Image(systemName: "sun.min.fill"), size: .small) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .back, size: .small) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .next, size: .small) {}.disabled(true)
        }
    }

    // MARK: - tvOS

    private var tvOSGridLayout: some View {
        TVGridLayout(count: 4) {

            // Column n°1: text only
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Text Only")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                linkSection(title: "Default Size") {
                    OUDSLink(text: "Link", size: .default) {}
                    OUDSLink(text: "Link", size: .default) {}.disabled(true)
                }

                linkSection(title: "Small Size") {
                    OUDSLink(text: "Link", size: .small) {}
                    OUDSLink(text: "Link", size: .small) {}.disabled(true)
                }
            }
            .padding()

            // Column n°2: with icon
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("With Icon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                linkSection(title: "Default Size") {
                    OUDSLink(text: "Link", icon: Image(systemName: "sun.min.fill"), size: .default) {}
                    OUDSLink(text: "Link", icon: Image(systemName: "sun.min.fill"), size: .default) {}.disabled(true)
                }

                linkSection(title: "Small Size") {
                    OUDSLink(text: "Link", icon: Image(systemName: "sun.min.fill"), size: .small) {}
                    OUDSLink(text: "Link", icon: Image(systemName: "sun.min.fill"), size: .small) {}.disabled(true)
                }
            }
            .padding()

            // Column n°3: with back indicator
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Back Indicator")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                linkSection(title: "Default Size") {
                    OUDSLink(text: "Link", indicator: .back, size: .default) {}
                    OUDSLink(text: "Link", indicator: .back, size: .default) {}.disabled(true)
                }

                linkSection(title: "Small Size") {
                    OUDSLink(text: "Link", indicator: .back, size: .small) {}
                    OUDSLink(text: "Link", indicator: .back, size: .small) {}.disabled(true)
                }
            }
            .padding()

            // Column n°4: with next indicator
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Next Indicator")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                linkSection(title: "Default Size") {
                    OUDSLink(text: "Link", indicator: .next, size: .default) {}
                    OUDSLink(text: "Link", indicator: .next, size: .default) {}.disabled(true)
                }

                linkSection(title: "Small Size") {
                    OUDSLink(text: "Link", indicator: .next, size: .small) {}
                    OUDSLink(text: "Link", indicator: .next, size: .small) {}.disabled(true)
                }
            }
            .padding()
        }
        .padding()
    }

    @ViewBuilder
    private func linkSection(title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(spacing: theme.spaces.paddingBlockMedium) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.paddingBlockXsmall) {
                content()
            }
        }
        .padding()
    }
}

// swiftlint:enable accessibility_label_for_image
// swiftlint:enable closure_body_length
