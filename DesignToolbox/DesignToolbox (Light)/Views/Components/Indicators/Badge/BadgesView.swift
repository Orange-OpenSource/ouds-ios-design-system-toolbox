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

    private static let allBadgeStandardStatus: [OUDSBadgeStandard.Status] = [.accent, .info, .negative, .positive, .neutral, .warning]
    private static let allBadgeIconStatus: [OUDSBadgeIcon.Status]
        = [
            .accent(image: OUDSImage(asset: Image(systemName: "sun.min.fill"))),
            .info,
            .negative,
            .positive,
            .neutral(image: OUDSImage(asset: Image(systemName: "sun.min.fill"))),
            .warning,
        ]
    private static let allBadgeCountStatus: [OUDSBadgeStandard.Status] = [.accent, .info, .negative, .positive, .neutral, .warning]
    private static let allBadgeStandardSizes: [OUDSBadgeStandard.Size] = [.extraSmall, .small, .medium, .large]
    private static let allBadgeIconSizes: [OUDSBadgeStandard.Size] = [.extraSmall, .small, .medium, .large]
    private static let allBadgeCountSizes: [OUDSBadgeCount.Size] = [.medium, .large]

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Badges",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        Text("Standard badges").font(.headline)
        ForEach(Self.allBadgeStandardSizes, id: \.self) { size in
            Text("Standard size \(String(describing: size))").font(.subheadline)
            ForEach(Self.allBadgeStandardStatus, id: \.self) { status in
                OUDSBadgeStandard(accessibilityLabel: "Foo", status: status, size: size)
            }
        }

        Text("Icon badges").font(.headline)
        ForEach(Self.allBadgeIconSizes, id: \.self) { size in
            Text("Icon size \(String(describing: size))").font(.subheadline)
            ForEach(0 ..< Self.allBadgeIconStatus.count, id: \.self) { index in
                let status = Self.allBadgeIconStatus[index]
                OUDSBadgeIcon(status: status, accessibilityLabel: "Foo", size: size)
            }
        }

        Text("Count badges").font(.headline)
        ForEach(Self.allBadgeCountSizes, id: \.self) { size in
            Text("Count size \(String(describing: size))").font(.subheadline)
            ForEach(Self.allBadgeCountStatus, id: \.self) { status in
                OUDSBadgeCount(100, accessibilityLabel: "Foo", status: status, size: size)
            }
        }
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
