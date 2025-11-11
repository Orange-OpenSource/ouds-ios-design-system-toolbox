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

    private static let allBadgeStatus: [OUDSBadge.Status] = [.accent, .info, .negative, .positive, .neutral, .warning, .disabled]
    private static let allBadgeStandardSizes: [OUDSBadge.StandardSize] = [.extraSmall, .small, .medium, .large]
    private static let allBadgeIllustrationSizes: [OUDSBadge.IllustrationSize] = [.medium, .large]

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(title: "Badges",
                              watchLayout: { WatchVerticalLayout { watchOSLayout } },
                              tvLayout: { TVVerticalLayout { tvOSLayout } })
    }

    // MARK: - watchOS

    @ViewBuilder
    private var watchOSLayout: some View {
        Text("Status badges").font(.headline)
        ForEach(Self.allBadgeStandardSizes, id: \.self) { size in
            Text("Standard size \(String(describing: size))").font(.subheadline)
            ForEach(Self.allBadgeStatus, id: \.self) { status in
                OUDSBadge(status: status, size: size)
            }
        }

        Text("Icon badges").font(.headline)
        ForEach(Self.allBadgeIllustrationSizes, id: \.self) { size in
            Text("Illustration size \(String(describing: size))").font(.subheadline)
            ForEach(Self.allBadgeStatus, id: \.self) { status in
                OUDSBadge(icon: Image(systemName: "sun.min.fill"), accessibilityLabel: "Foo", status: status, size: size)
            }
        }

        Text("Count badges").font(.headline)
        ForEach(Self.allBadgeIllustrationSizes, id: \.self) { size in
            Text("Illustration size \(String(describing: size))").font(.subheadline)
            ForEach(Self.allBadgeStatus, id: \.self) { status in
                OUDSBadge(count: 100, status: status, size: size)
            }
        }
    }

    // MARK: - tvOS

    @ViewBuilder
    private var tvOSLayout: some View {
        VStack(spacing: theme.spaces.paddingBlock4xlarge) {

            // Row n°1: Status badges
            VStack(spacing: theme.spaces.scaledMediumMobile) {
                Text("Status Badges")
                    .font(.title2)
                    .fontWeight(.bold)

                HStack(spacing: theme.spaces.scaledMediumMobile) {
                    ForEach(Self.allBadgeStandardSizes, id: \.self) { size in
                        badgeSection(title: "Standard \(String(describing: size))") {
                            ForEach(Self.allBadgeStatus, id: \.self) { status in
                                OUDSBadge(status: status, size: size)
                            }
                        }
                    }
                }
            }
            .padding()
            .focusable()

            // Row n°2: Icon badges
            VStack(spacing: theme.spaces.scaledMediumMobile) {
                Text("Icon Badges")
                    .font(.title2)
                    .fontWeight(.bold)

                HStack(spacing: theme.spaces.scaledMediumMobile) {
                    ForEach(Self.allBadgeIllustrationSizes, id: \.self) { size in
                        badgeSection(title: "Illustration \(String(describing: size))") {
                            ForEach(Self.allBadgeStatus, id: \.self) { status in
                                OUDSBadge(icon: Image(systemName: "sun.min.fill"), accessibilityLabel: "Foo", status: status, size: size)
                            }
                        }
                    }
                }
            }
            .padding()
            .focusable()

            // Row n°3: Count badges
            VStack(spacing: theme.spaces.scaledMediumMobile) {
                Text("Count Badges")
                    .font(.title2)
                    .fontWeight(.bold)

                HStack(spacing: theme.spaces.scaledMediumMobile) {
                    ForEach(Self.allBadgeIllustrationSizes, id: \.self) { size in
                        badgeSection(title: "Illustration \(String(describing: size))") {
                            ForEach(Self.allBadgeStatus, id: \.self) { status in
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

    @ViewBuilder
    private func badgeSection(title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(spacing: theme.spaces.scaledSmallMobile) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                content()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

// swiftlint:enable accessibility_label_for_image
