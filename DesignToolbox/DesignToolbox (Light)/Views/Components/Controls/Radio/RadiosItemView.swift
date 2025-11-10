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

struct RadiosItemView: View {

    @State private var isOn: Bool = false

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(watchLayout: {
            watchOSLayout
        }, tvLayout: {
            tvOSLayout
        })
    }

    // MARK: - watchOS

    private var watchOSLayout: some View {
        WatchVerticalLayout {
            Text("With icon").font(.headline)
            detailedView(withIcon: false)

            Divider()

            Text("Without icon").font(.headline)
            detailedView(withIcon: true)
        }
    }

    // MARK: - tvOS

    private var tvOSLayout: some View {
        TVGridLayout(count: 2) {
            // Column n°1: without icon
            VStack(spacing: theme.spaces.scaledMediumMobile) {
                Text("Without Icon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.scaledXsmallMobile)

                radioSection(title: "Enabled", withIcon: false)
                radioSection(title: "Error (Not outlined)", withIcon: false, isError: true, isOutlined: false)
                radioSection(title: "Error (Outlined)", withIcon: false, isError: true, isOutlined: true)
                radioSection(title: "Disabled", withIcon: false, isDisabled: true)
                radioSection(title: "Read Only", withIcon: false, isReadOnly: true)
            }
            .padding()

            // Column n°2: with icon
            VStack(spacing: theme.spaces.scaledMediumMobile) {
                Text("With Icon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingInlineSmall)

                radioSection(title: "Enabled", withIcon: true)
                radioSection(title: "Error (Not outlined)", withIcon: true, isError: true, isOutlined: false)
                radioSection(title: "Error (Outlined)", withIcon: true, isError: true, isOutlined: true)
                radioSection(title: "Disabled", withIcon: true, isDisabled: true)
                radioSection(title: "Read Only", withIcon: true, isReadOnly: true)
            }
            .padding()
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func radioSection(
        title: String,
        withIcon: Bool,
        isDisabled: Bool = false,
        isError: Bool = false,
        isOutlined: Bool = false,
        isReadOnly: Bool = false) -> some View
    {
        VStack(spacing: theme.spaces.scaledSmallMobile) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                // Normal (isReversed: false)
                OUDSRadioItem(
                    isOn: $isOn,
                    label: "Label",
                    helper: "Helper",
                    icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                    isOutlined: isOutlined,
                    isReversed: false,
                    isError: isError,
                    errorText: isError ? "Error" : nil,
                    isReadOnly: isReadOnly)
                    .disabled(isDisabled)

                // Reversed (isReversed: true)
                OUDSRadioItem(
                    isOn: $isOn,
                    label: "Label",
                    helper: "Helper",
                    icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                    isOutlined: isOutlined,
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

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isReversed: false,
                      isReadOnly: false)

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isReversed: true,
                      isReadOnly: false)

        Text("On error").font(.caption)

        Text("Not outlined").font(.callout)

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isReversed: false,
                      isError: true,
                      errorText: "Error")

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isReversed: true,
                      isError: true,
                      errorText: "Error")

        Text("Outlined").font(.callout)

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isOutlined: true,
                      isReversed: false,
                      isError: true,
                      errorText: "Error")

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isOutlined: true,
                      isReversed: true,
                      isError: true,
                      errorText: "Error")

        Text("Disabled").font(.caption)

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isReversed: false,
                      isReadOnly: false)
            .disabled(true)

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isReversed: true,
                      isReadOnly: false)
            .disabled(true)

        Text("Read only").font(.caption)

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isReversed: false,
                      isReadOnly: true)

        OUDSRadioItem(isOn: $isOn,
                      label: "Label",
                      helper: "Helper",
                      icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                      isReversed: true,
                      isReadOnly: true)
    }
}

// swiftlint:enable accessibility_label_for_image
// swiftlint:enable function_body_length
