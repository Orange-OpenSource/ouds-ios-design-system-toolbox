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

    @State private var isOn: Bool = true

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(watchLayout: {
            watchLayout
        }, tvLayout: {
            tvLayout
        })
    }

    // MARK: - watchOS

    private var watchLayout: some View {
        WatchVerticalLayout {
            Text("With icon").font(.headline)
            detailedView(withIcon: true)

            Divider()

            Text("Without icon").font(.headline)
            detailedView(withIcon: false)
        }
    }

    // MARK: - tvOS

    private var tvLayout: some View {
        TVGridLayout(count: 2) {

            // Column n°1: without icon
            VStack(spacing: theme.spaces.scaledMediumMobile) {
                Text("Without Icon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.scaledSmallMobile)

                switchSection(title: "Enabled", withIcon: false)
                switchSection(title: "Error", withIcon: false, isError: true)
                switchSection(title: "Disabled", withIcon: false, isDisabled: true)
                switchSection(title: "Read Only", withIcon: false, isReadOnly: true)
            }
            .padding()

            // Column n°2: with Icon
            VStack(spacing: theme.spaces.scaledMediumMobile) {
                Text("With Icon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.scaledSmallMobile)

                switchSection(title: "Enabled", withIcon: true)
                switchSection(title: "Error", withIcon: true, isError: true)
                switchSection(title: "Disabled", withIcon: true, isDisabled: true)
                switchSection(title: "Read Only", withIcon: true, isReadOnly: true)
            }
            .padding()
        }
        .padding()
    }

    // MARK: - Helpers

    @ViewBuilder
    private func switchSection(
        title: String,
        withIcon: Bool,
        isDisabled: Bool = false,
        isError: Bool = false,
        isReadOnly: Bool = false) -> some View
    {
        VStack(spacing: theme.spaces.scaledSmallMobile) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                OUDSSwitchItem(
                    "Label",
                    isOn: $isOn,
                    helper: "Helper",
                    icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                    isReversed: false,
                    isError: isError,
                    errorText: isError ? "Error" : nil,
                    isReadOnly: isReadOnly)
                    .disabled(isDisabled)

                OUDSSwitchItem(
                    "Label",
                    isOn: $isOn,
                    helper: "Helper",
                    icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                    isReversed: true,
                    isError: isError,
                    errorText: isError ? "Error" : nil,
                    isReadOnly: isReadOnly)
                    .disabled(isDisabled)
            }
        }
        .padding()
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
