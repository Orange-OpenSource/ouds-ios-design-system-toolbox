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

struct TagView: View {
    @State private var isSelected: Bool = true
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                #if os(tvOS)
                tvOSRowLayout
                #else
                watchOSVerticalLayout
                #endif
            }
            .navigationTitle("Tag")
            #if os(tvOS)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        proxy.scrollTo("top", anchor: .top)
                    }
                }
            #endif
        }
    }

    // MARK: - watchOS Layout (Vertical - votre code actuel)
    private var watchOSVerticalLayout: some View {
        VStack(spacing: theme.spaces.scaledXsmallMobile) {
            ForEach(kAllTagStatus.indices, id: \.self) { statusIndex in
                Text("Status " + description(for: statusIndex)).font(.headline)
                let status = kAllTagStatus[statusIndex]
                ForEach(kAllBadgeSizes, id: \.self) { size in
                    Text("Size \(String(describing: size))").font(.subheadline)
                    ForEach(kAllTagShapes, id: \.self) { shape in
                        Text("Shape \(String(describing: shape))").font(.callout)
                        ForEach(kAllTagAppearances, id: \.self) { appearance in
                            OUDSTag(label: "Tag",
                                    status: status,
                                    appearance: appearance,
                                    shape: shape,
                                    size: size,
                                    hasLoader: false)

                            OUDSTag(label: "Tag",
                                    status: status,
                                    appearance: appearance,
                                    shape: shape,
                                    size: size,
                                    hasLoader: true)
                        }
                    }
                }
            }
        }
    }

    // MARK: - tvOS Layout avec HStack
    private var tvOSRowLayout: some View {
        LazyVStack(spacing: 30) {
            Color.clear
                .frame(height: 1)
                .id("top")

            ForEach(kAllTagStatus.indices, id: \.self) { statusIndex in
                let status = kAllTagStatus[statusIndex]

                VStack(spacing: 20) {
                    Text("Status " + description(for: statusIndex))
                        .font(.title2)
                        .fontWeight(.bold)

                    // Utiliser HStack avec Spacer pour un meilleur contrôle
                    VStack(spacing: 15) {
                        ForEach(kAllBadgeSizes, id: \.self) { size in
                            HStack(spacing: 20) {
                                ForEach(kAllTagShapes, id: \.self) { shape in
                                    ForEach(kAllTagAppearances, id: \.self) { appearance in
                                        tagSection(
                                            title: "\(String(describing: size)) • \(String(describing: shape)) • \(String(describing: appearance))",
                                            status: status,
                                            appearance: appearance,
                                            shape: shape,
                                            size: size)
                                    }
                                }
                                Spacer() // Évite l'espace vide à droite
                            }
                        }
                    }
                }
                .padding()
                .focusable()
            }

            Text("Fin du contenu")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding()
                .id("bottom")
        }
        .padding()
    }

    // MARK: - Helper Views
    @ViewBuilder
    private func tagSection(
        title: String,
        status: OUDSTag.Status,
        appearance: OUDSTag.Appearance,
        shape: OUDSTag.Shape,
        size: OUDSTag.Size) -> some View
    {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            VStack(spacing: 6) {
                OUDSTag(label: "Tag",
                        status: status,
                        appearance: appearance,
                        shape: shape,
                        size: size,
                        hasLoader: false)

                OUDSTag(label: "Tag",
                        status: status,
                        appearance: appearance,
                        shape: shape,
                        size: size,
                        hasLoader: true)
            }
        }
        .padding(8)
        .frame(maxWidth: .infinity) // Centrage des éléments dans leur cellule
    }

    private func description(for statusIndex: Int) -> String {
        if statusIndex <= 2 {
            return "positive"
        }
        if statusIndex <= 5 {
            return "negative"
        }
        if statusIndex <= 8 {
            return "warning"
        }
        if statusIndex <= 11 {
            return "info"
        }
        if statusIndex <= 14 {
            return "neutral"
        }
        if statusIndex <= 17 {
            return "accent"
        }
        return ""
    }

    private let kAllTagAppearances: [OUDSTag.Appearance] = [.emphasized, .muted]
    private let kAllTagShapes: [OUDSTag.Shape] = [.rounded, .square]
    private let kAllBadgeSizes: [OUDSTag.Size] = [.default, .small]
    private let kAllTagStatus: [OUDSTag.Status] = [
        OUDSTag.Status.positive(leading: .bullet),
        OUDSTag.Status.positive(leading: .icon),
        OUDSTag.Status.positive(leading: .none),
        OUDSTag.Status.negative(leading: .bullet),
        OUDSTag.Status.negative(leading: .icon),
        OUDSTag.Status.negative(leading: .none),
        OUDSTag.Status.warning(leading: .bullet),
        OUDSTag.Status.warning(leading: .icon),
        OUDSTag.Status.warning(leading: .none),
        OUDSTag.Status.info(leading: .bullet),
        OUDSTag.Status.info(leading: .icon),
        OUDSTag.Status.info(leading: .none),
        OUDSTag.Status.neutral(bullet: false),
        OUDSTag.Status.neutral(bullet: true),
        OUDSTag.Status.neutral(icon: Image(systemName: "sun.min.fill")),
        OUDSTag.Status.accent(bullet: false),
        OUDSTag.Status.accent(bullet: true),
        OUDSTag.Status.accent(icon: Image(systemName: "sun.min.fill")),
    ]
}
