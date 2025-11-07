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
struct BadgesView: View {
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            #if os(tvOS)
            tvOSRowLayout
            #else
            watchOSVerticalLayout
            #endif
        }
        .navigationTitle("Badge")
    }

    // MARK: - watchOS Layout (Vertical - votre code actuel)
    private var watchOSVerticalLayout: some View {
        VStack(spacing: theme.spaces.scaledXsmallMobile) {
            Text("Status badges").font(.headline)
            ForEach(kAllBadgeStandardSizes, id: \.self) { size in
                Text("Standard size \(String(describing: size))").font(.subheadline)
                ForEach(kAllBadgeStatus, id: \.self) { status in
                    OUDSBadge(status: status, size: size)
                }
            }

            Text("Icon badges").font(.headline)
            ForEach(kAllBadgeIllustrationSizes, id: \.self) { size in
                Text("Illustration size \(String(describing: size))").font(.subheadline)
                ForEach(kAllBadgeStatus, id: \.self) { status in
                    OUDSBadge(icon: Image(systemName: "sun.min.fill"), accessibilityLabel: "Foo", status: status, size: size)
                }
            }

            Text("Count badges").font(.headline)
            ForEach(kAllBadgeIllustrationSizes, id: \.self) { size in
                Text("Illustration size \(String(describing: size))").font(.subheadline)
                ForEach(kAllBadgeStatus, id: \.self) { status in
                    OUDSBadge(count: 100, status: status, size: size)
                }
            }
        }
    }

    // MARK: - tvOS Layout (3 lignes avec ForEach)
    private var tvOSRowLayout: some View {
        VStack(spacing: 30) {

            // Ligne 1 : Status badges
            VStack(spacing: 20) {
                Text("Status Badges")
                    .font(.title2)
                    .fontWeight(.bold)

                HStack(spacing: 20) {
                    ForEach(kAllBadgeStandardSizes, id: \.self) { size in
                        badgeSection(title: "Standard \(String(describing: size))") {
                            ForEach(kAllBadgeStatus, id: \.self) { status in
                                OUDSBadge(status: status, size: size)
                            }
                        }
                    }
                }
            }
            .padding()
            .focusable()

            // Ligne 2 : Icon badges
            VStack(spacing: 20) {
                Text("Icon Badges")
                    .font(.title2)
                    .fontWeight(.bold)

                HStack(spacing: 20) {
                    ForEach(kAllBadgeIllustrationSizes, id: \.self) { size in
                        badgeSection(title: "Illustration \(String(describing: size))") {
                            ForEach(kAllBadgeStatus, id: \.self) { status in
                                OUDSBadge(icon: Image(systemName: "sun.min.fill"), accessibilityLabel: "Foo", status: status, size: size)
                            }
                        }
                    }
                }
            }
            .padding()
            .focusable()

            // Ligne 3 : Count badges
            VStack(spacing: 20) {
                Text("Count Badges")
                    .font(.title2)
                    .fontWeight(.bold)

                HStack(spacing: 20) {
                    ForEach(kAllBadgeIllustrationSizes, id: \.self) { size in
                        badgeSection(title: "Illustration \(String(describing: size))") {
                            ForEach(kAllBadgeStatus, id: \.self) { status in
                                OUDSBadge(count: 100, status: status, size: size)
                            }
                        }
                    }
                }
            }
            .padding()
            .focusable()
        }
        .padding()
    }

    // MARK: - Helper Views
    @ViewBuilder
    private func badgeSection(
        title: String,
        @ViewBuilder content: () -> some View) -> some View
    {
        VStack(spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: 6) {
                content()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }

    private let kAllBadgeStatus: [OUDSBadge.Status] = [.accent, .info, .negative, .positive, .neutral, .warning, .disabled]
    private let kAllBadgeStandardSizes: [OUDSBadge.StandardSize] = [.extraSmall, .small, .medium, .large]
    private let kAllBadgeIllustrationSizes: [OUDSBadge.IllustrationSize] = [.medium, .large]
}

// swiftlint:enable accessibility_label_for_image
