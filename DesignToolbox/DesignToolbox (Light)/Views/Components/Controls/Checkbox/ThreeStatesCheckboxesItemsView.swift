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

struct ThreeStatesCheckboxesItemsView: View {

    @State private var state: OUDSCheckboxIndicatorState = .indeterminate

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: {
            watchLayout
        })
    }

    @ViewBuilder
    private var watchLayout: some View {
        Text("3-states checkboxes items").font(.headline)

        Text("No icons").font(.subheadline)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: false,
                                      isReadOnly: false)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: true,
                                      isReadOnly: false)

        Text("Disabled").font(.caption)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: false,
                                      isReadOnly: false)
            .disabled(true)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: true,
                                      isReadOnly: false)
            .disabled(true)

        Text("On error").font(.caption)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: false,
                                      isError: true,
                                      errorText: "Error")

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: true,
                                      isError: true,
                                      errorText: "Error")

        Text("Read only").font(.subheadline)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: false,
                                      isReadOnly: true)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: true,
                                      isReadOnly: true)

        Text("With icons").font(.caption)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: OUDSImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: false,
                                      isReadOnly: false)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: OUDSImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: true,
                                      isReadOnly: false)

        Text("On error").font(.caption)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: OUDSImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: false,
                                      isError: true,
                                      errorText: "Error")

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: OUDSImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: true,
                                      isError: true,
                                      errorText: "Error")

        Text("Disabled").font(.caption)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: OUDSImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: false,
                                      isReadOnly: false)
            .disabled(true)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: OUDSImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: true,
                                      isReadOnly: false)
            .disabled(true)

        Text("Read only").font(.caption)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: OUDSImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: false,
                                      isReadOnly: true)

        OUDSCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: OUDSImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: true,
                                      isReadOnly: true)
    }

    // MARK: - Helpers

    @ViewBuilder
    private func checkboxSection(
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
                OUDSCheckboxItemIndeterminate("Label",
                                              selection: $state,
                                              description: "Description",
                                              image: withIcon ? OUDSImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                                              isReversed: false,
                                              isError: isError,
                                              errorText: isError ? "Error" : nil,
                                              isReadOnly: isReadOnly)
                    .disabled(isDisabled)

                OUDSCheckboxItemIndeterminate("Label",
                                              selection: $state,
                                              description: "Description",
                                              image: withIcon ? OUDSImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                                              isReversed: true,
                                              isError: isError,
                                              errorText: isError ? "Error" : nil,
                                              isReadOnly: isReadOnly)
                    .disabled(isDisabled)
            }
        }
        .padding()
    }
}

// swiftlint:enable accessibility_label_for_image
