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
    private static let kAllButtonSizes: [OUDSButton.Size] = [.default, .small]

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Button",
                              layout: {
                                  watchLayout
                              })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.kAllButtonStyles, id: \.self) { style in
                Text("Style \(String(describing: style))").font(.headline)
                ForEach(Self.kAllButtonSizes, id: \.self) { size in
                    Text("Size \(String(describing: size))").font(.subheadline)
                    ForEach(Self.kAllButtonAppaerances, id: \.self) { appearance in
                        Text("Appearance \(String(describing: appearance))").font(.body)
                        OUDSButton(text: "Button", appearance: appearance, style: style, size: size) {}
                        OUDSButton(text: "Button", image: OUDSImage(asset: Image(systemName: "sun.min.fill")), appearance: appearance, style: style, size: size) {}
                        OUDSButton(image: OUDSImage(asset: Image(systemName: "sun.min.fill"), accessibilityLabel: "Button"), appearance: appearance, style: style, size: size) {}
                    }
                }
            }
        }
    }
}

// swiftlint:enable accessibility_label_for_image
