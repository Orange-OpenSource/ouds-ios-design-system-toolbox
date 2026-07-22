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

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Link",
                              layout: { watchOSVerticalLayout })
    }

    // MARK: - watchOS

    private var watchOSVerticalLayout: some View {
        WatchVerticalLayout {
            Text("Size default").font(.headline)

            Text("Enabled").font(.subheadline)
            OUDSLink(text: "Link", size: .default) {}
            OUDSLink(text: "Link", image: OUDSImage(asset: Image(systemName: "sun.min.fill")), size: .default) {}
            OUDSLink(text: "Link", indicator: .previous, size: .default) {}
            OUDSLink(text: "Link", indicator: .next, size: .default) {}
            OUDSLink(text: "Link", indicator: .external, size: .default) {}

            Text("Disabled").font(.subheadline)
            OUDSLink(text: "Link", size: .small) {}.disabled(true)
            OUDSLink(text: "Link", image: OUDSImage(asset: Image(systemName: "sun.min.fill")), size: .small) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .previous, size: .default) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .next, size: .default) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .external, size: .default) {}.disabled(true)

            Text("Size small").font(.headline)

            Text("Enabled").font(.subheadline)
            OUDSLink(text: "Link", size: .small) {}
            OUDSLink(text: "Link", image: OUDSImage(asset: Image(systemName: "sun.min.fill")), size: .small) {}
            OUDSLink(text: "Link", indicator: .previous, size: .small) {}
            OUDSLink(text: "Link", indicator: .next, size: .small) {}
            OUDSLink(text: "Link", indicator: .external, size: .small) {}

            Text("Disabled").font(.subheadline)
            OUDSLink(text: "Link", size: .small) {}.disabled(true)
            OUDSLink(text: "Link", image: OUDSImage(asset: Image(systemName: "sun.min.fill")), size: .small) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .previous, size: .small) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .next, size: .small) {}.disabled(true)
            OUDSLink(text: "Link", indicator: .external, size: .small) {}.disabled(true)
        }
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
