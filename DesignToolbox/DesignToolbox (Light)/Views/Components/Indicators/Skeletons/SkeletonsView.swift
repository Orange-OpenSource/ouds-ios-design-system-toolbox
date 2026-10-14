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

struct SkeletonsView: View {

    var body: some View {
        WatchScrollLayoutView(title: "Skeletons",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        Group {
            VStack {
                Text("Circle").font(.headline)
                OUDSSkeleton(shape: Circle())
                    .frame(width: 100, height: 30)

                Text("Rectangle").font(.headline)
                OUDSSkeleton(shape: Rectangle())
                    .frame(width: 100, height: 30)

                Text("Rounded Rectangle").font(.headline)
                OUDSSkeleton(shape: RoundedRectangle(cornerRadius: 25.0))
                    .frame(width: 100, height: 30)
            }
        }.showSkeleton(isVisible: true, isAnimated: true)
    }
}
