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

struct CircularIndicatorsView: View {

    private static let allIndicatorStatus: [OUDSProgressIndicatorStatus] = [.accent, .info, .negative, .positive, .neutral, .warning]

    var body: some View {
        WatchScrollLayoutView(title: "Circular Indicators",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        Text("Indeterminate indicator").font(.headline)
        ForEach(Self.allIndicatorStatus, id: \.self) { status in
            Text("Status \(String(describing: status))").font(.subheadline)
            VStack {
                OUDSCircularProgressIndicator(status: status, track: true, gapSize: .default)
                OUDSCircularProgressIndicator(status: status, track: true, gapSize: .small)
                OUDSCircularProgressIndicator(status: status, track: false, gapSize: .default)
                OUDSCircularProgressIndicator(status: status, track: false, gapSize: .small)
            }
        }

        Text("Determinate indicator (50%)").font(.headline)
        ForEach(Self.allIndicatorStatus, id: \.self) { status in
            Text("Status \(String(describing: status))").font(.subheadline)
            VStack {
                OUDSCircularProgressIndicator(progress: 0.50, status: status, track: true, gapSize: .default)
                OUDSCircularProgressIndicator(progress: 0.50, status: status, track: true, gapSize: .small)
                OUDSCircularProgressIndicator(progress: 0.50, status: status, track: false, gapSize: .default)
                OUDSCircularProgressIndicator(progress: 0.50, status: status, track: false, gapSize: .small)
            }
        }
    }
}
