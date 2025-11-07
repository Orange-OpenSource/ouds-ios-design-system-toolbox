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

struct RadiosOnlyView: View {

    @State private var isOn: Bool = true
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spaces.scaledXsmallMobile) {

                Text("Enabled, no error").font(.subheadline)
                OUDSRadio(isOn: $isOn, accessibilityLabel: "Radio", isError: false)

                Text("Enabled, on error")
                OUDSRadio(isOn: $isOn, accessibilityLabel: "Radio", isError: true)

                Text("Disabled, no error")
                OUDSRadio(isOn: $isOn, accessibilityLabel: "Radio", isError: false)
                    .disabled(true)
            }
        }
    }
}
