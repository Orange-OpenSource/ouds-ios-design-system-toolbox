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
struct LinksView: View {
    @Environment(\.theme) var theme

    var body: some View {
        ScrollView {
            #if os(tvOS)
            tvOSGridLayout
            #else
            watchOSVerticalLayout
            #endif
        }
        .navigationTitle("Badge")
    }

    // MARK: - watchOS Layout (Vertical - votre code actuel)
    private var watchOSVerticalLayout: some View {
        VStack(spacing: theme.spaces.scaledXsmallMobile) {
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

    // MARK: - tvOS Layout (4 colonnes)
    private var tvOSGridLayout: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 30) {

            // Colonne 1 : Text only
            VStack(spacing: 20) {
                Text("Text Only")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

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
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            // Colonne 2 : With Icon
            VStack(spacing: 20) {
                Text("With Icon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

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
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            // Colonne 3 : Back Indicator
            VStack(spacing: 20) {
                Text("Back Indicator")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

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
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            // Colonne 4 : Next Indicator
            VStack(spacing: 20) {
                Text("Next Indicator")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

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
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()
        }
        .padding()
    }

    // MARK: - Helper Views
    @ViewBuilder
    private func linkSection(
        title: String,
        @ViewBuilder content: () -> some View) -> some View
    {
        VStack(spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: 8) {
                content()
            }
        }
        .padding()
    }
}

// swiftlint:enable accessibility_label_for_image
