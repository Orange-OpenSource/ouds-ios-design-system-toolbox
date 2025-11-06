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
        .navigationTitle("Badge")
    }
}

// swiftlint:enable accessibility_label_for_image
