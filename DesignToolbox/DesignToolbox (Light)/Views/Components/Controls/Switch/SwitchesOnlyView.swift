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

struct SwitchesOnlyView: View {

    var body: some View {
        WatchAndTVLayoutsView(watchLayout: {
            SwitchOnlyLayout()
        }, tvLayout: {
            SwitchOnlyLayout()
        })
    }
}

private struct SwitchOnlyLayout: View {

    @State private var isOn: Bool = true

    var body: some View {
        Text("Enabled").font(.subheadline)
        OUDSSwitch(isOn: $isOn, accessibilityLabel: "Radio")

        Text("Disabled").font(.subheadline)
        OUDSSwitch(isOn: $isOn, accessibilityLabel: "Radio")
            .disabled(true)
    }
}
