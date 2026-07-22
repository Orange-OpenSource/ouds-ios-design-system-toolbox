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
struct ButtonsView: View {

    private static let kAllButtonAppaerances: [OUDSButton.Appearance] = [.default, .strong, .brand, .minimal, .negative]
    private static let kAllButtonStyles: [OUDSButton.Style] = [.default, .loading]

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Button",
                              layout: {
                                  watchLayout
                              })
    }

    @ViewBuilder
    private func buttonSection(style: OUDSButton.Style, appearance: OUDSButton.Appearance) -> some View {
        VStack(spacing: theme.spaces.scaledXsmallTablet) {
            VStack(spacing: theme.spaces.scaled3xsmallTablet) {
                Text(String(describing: style))
                    .font(.caption)
                    .fontWeight(.bold)
                Text(String(describing: appearance))
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.center)

            VStack(spacing: theme.spaces.scaledXsmallTablet) {
                OUDSButton(text: "Button", appearance: appearance, style: style) {}
                OUDSButton(text: "Button", image: OUDSImage(asset: Image(systemName: "sun.min.fill")), appearance: appearance, style: style) {}
                OUDSButton(image: OUDSImage(asset: Image(systemName: "sun.min.fill"), accessibilityLabel: "Button"), appearance: appearance, style: style) {}
            }
        }
        .padding(theme.spaces.paddingInlineMedium)
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.kAllButtonStyles, id: \.self) { style in
                Text("Style \(String(describing: style))").font(.headline)
                ForEach(Self.kAllButtonAppaerances, id: \.self) { appearance in
                    Text("Appearance \(String(describing: appearance))").font(.subheadline)
                    OUDSButton(text: "Button", appearance: appearance, style: style) {}
                    OUDSButton(text: "Button", image: OUDSImage(asset: Image(systemName: "sun.min.fill")), appearance: appearance, style: style) {}
                    OUDSButton(image: OUDSImage(asset: Image(systemName: "sun.min.fill"), accessibilityLabel: "Button"), appearance: appearance, style: style) {}
                }
            }
        }
    }
}

// swiftlint:enable accessibility_label_for_image
