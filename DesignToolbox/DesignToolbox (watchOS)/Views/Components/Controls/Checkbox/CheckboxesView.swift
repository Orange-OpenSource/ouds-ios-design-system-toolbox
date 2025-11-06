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

struct ButtonsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(kAllButtonStyles, id: \.self) { style in
                    Text("Style \(String(describing: style))")
                    ForEach(kAllButtonAppaerances, id: \.self) { appearance in
                        Text("Appearance \(String(describing: appearance))")
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

private let kAllButtonAppaerances: [OUDSButton.Appearance] = [.default, .strong, .brand, .minimal, .negative]
private let kAllButtonStyles: [OUDSButton.Style] = [.default, .loading]
