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

    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                ForEach(kAllButtonStyles, id: \.self) { style in
                    Text("Style \(String(describing: style))").font(.headline)
                    ForEach(kAllButtonAppaerances, id: \.self) { appearance in
                        Text("Appearance \(String(describing: appearance))").font(.subheadline)
                        OUDSButton(text: "Button", appearance: appearance, style: style) {}
                        OUDSButton(icon: Image(systemName: "sun.min.fill"), text: "Button", appearance: appearance, style: style) {}
                        OUDSButton(icon: Image(systemName: "sun.min.fill"), accessibilityLabel: "Button", appearance: appearance, style: style) {}
                    }
                }
            }
        }
        .navigationTitle("Button")
    }
}

// swiftlint:enable accessibility_label_for_image

private let kAllButtonAppaerances: [OUDSButton.Appearance] = [.default, .strong, .brand, .minimal, .negative]
private let kAllButtonStyles: [OUDSButton.Style] = [.default, .loading]
