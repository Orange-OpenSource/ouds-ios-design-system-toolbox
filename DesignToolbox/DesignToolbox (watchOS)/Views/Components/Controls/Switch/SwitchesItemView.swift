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
// swiftlint:disable function_body_length

struct SwitchesItemView: View {

    @State private var isOn: Bool = false
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                Text("With icon").font(.headline)
                detailedView(withIcon: true)

                Divider()

                Text("Without icon").font(.headline)
                detailedView(withIcon: false)
            }
        }
    }

    @ViewBuilder
    private func detailedView(withIcon: Bool) -> some View {

        Text("Enabled").font(.caption)

        OUDSSwitchItem("Label",
                       isOn: $isOn,
                       helper: "Helper",
                       icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                       isReversed: false,
                       isReadOnly: false)

        OUDSSwitchItem("Label",
                       isOn: $isOn,
                       helper: "Helper",
                       icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                       isReversed: true,
                       isReadOnly: false)

        Text("On error").font(.caption)

        OUDSSwitchItem("Label",
                       isOn: $isOn,
                       helper: "Helper",
                       icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                       isReversed: false,
                       isError: true,
                       errorText: "Error")

        OUDSSwitchItem("Label",
                       isOn: $isOn,
                       helper: "Helper",
                       icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                       isReversed: true,
                       isError: true,
                       errorText: "Error")

        Text("Disabled").font(.caption)

        OUDSSwitchItem("Label",
                       isOn: $isOn,
                       helper: "Helper",
                       icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                       isReversed: false,
                       isReadOnly: false)
            .disabled(true)

        OUDSSwitchItem("Label",
                       isOn: $isOn,
                       helper: "Helper",
                       icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                       isReversed: true,
                       isReadOnly: false)
            .disabled(true)

        Text("Read only").font(.caption)

        OUDSSwitchItem("Label",
                       isOn: $isOn,
                       helper: "Helper",
                       icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                       isReversed: false,
                       isReadOnly: true)

        OUDSSwitchItem("Label",
                       isOn: $isOn,
                       helper: "Helper",
                       icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                       isReversed: true,
                       isReadOnly: true)
    }
}

// swiftlint:enable accessibility_label_for_image
// swiftlint:enable function_body_length
