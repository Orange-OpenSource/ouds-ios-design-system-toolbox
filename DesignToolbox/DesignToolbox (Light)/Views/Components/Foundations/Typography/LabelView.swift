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

struct LabelView: View {

    private static let allSizes: [OUDSLabel.Size] = [.xLarge, .large, .medium, .small]
    private static let allWeights: [OUDSLabel.Weight] = [.default, .moderate, .strong]

    var body: some View {
        WatchScrollLayoutView(title: "Label", layout: { watchLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.allSizes, id: \.self) { size in
                Text("Size \(String(describing: size))").font(.subheadline)
                ForEach(Self.allWeights, id: \.self) { weight in
                    Text("Weight \(String(describing: weight))").font(.footnote)
                    OUDSLabel(text: "Aa", size: size, weight: weight)
                }
            }
        }
    }
}
