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
        .navigationTitle("Badge")
    }

    private let kAllBadgeStatus: [OUDSBadge.Status] = [.accent, .info, .negative, .positive, .neutral, .warning, .disabled]
    private let kAllBadgeStandardSizes: [OUDSBadge.StandardSize] = [.extraSmall, .small, .medium, .large]
    private let kAllBadgeIllustrationSizes: [OUDSBadge.IllustrationSize] = [.medium, .large]
}

// swiftlint:enable accessibility_label_for_image
