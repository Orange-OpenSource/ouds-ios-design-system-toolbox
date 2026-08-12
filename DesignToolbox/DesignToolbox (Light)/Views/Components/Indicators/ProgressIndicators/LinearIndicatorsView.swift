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

struct LinearIndicatorsView: View {

    private static let allIndicatorStatus: [OUDSProgressIndicatorStatus] = [.accent, .info, .negative, .positive, .neutral, .warning]

    var body: some View {
        WatchScrollLayoutView(title: "Linear Indicators",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        Text("Indeterminate indicator").font(.headline)
        ForEach(Self.allIndicatorStatus, id: \.self) { status in
            Text("Status \(String(describing: status))").font(.subheadline)
            VStack {
                OUDSLinearProgressIndicator(status: status, track: true, gapSize: .default)
                OUDSLinearProgressIndicator(status: status, track: true, gapSize: .small)
                OUDSLinearProgressIndicator(status: status, track: false, gapSize: .default)
                OUDSLinearProgressIndicator(status: status, track: false, gapSize: .small)
            }
        }

        Text("Determinate indicator (50%)").font(.headline)
        ForEach(Self.allIndicatorStatus, id: \.self) { status in
            Text("Status \(String(describing: status))").font(.subheadline)
            VStack {
                OUDSLinearProgressIndicator(progress: 0.50, status: status, track: true, gapSize: .default)
                OUDSLinearProgressIndicator(progress: 0.50, status: status, track: true, gapSize: .small)
                OUDSLinearProgressIndicator(progress: 0.50, status: status, track: false, gapSize: .default)
                OUDSLinearProgressIndicator(progress: 0.50, status: status, track: false, gapSize: .small)
            }
        }

        Text("Determinate with helper text & stop indicator").font(.headline)
        OUDSLinearProgressIndicator(progress: 0.50,
                                    status: .accent,
                                    stopIndicator: true,
                                    helperText: "Uploading…")
    }
}
