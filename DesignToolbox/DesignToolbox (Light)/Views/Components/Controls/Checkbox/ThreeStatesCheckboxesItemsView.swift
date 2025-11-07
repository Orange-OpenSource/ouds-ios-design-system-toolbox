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

struct ThreeStatesCheckboxesItemsView: View {
    @State private var state: OUDSCheckboxIndicatorState = .indeterminate
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            #if os(tvOS)
            tvOSGridLayout
            #else
            watchOSVerticalLayout
            #endif
        }
    }

    // MARK: - watchOS Layout (Vertical - votre code actuel)
    private var watchOSVerticalLayout: some View {
        VStack(spacing: theme.spaces.scaledXsmallMobile) {
            Text("3-states checkboxes items").font(.headline)

            Text("No icons").font(.subheadline)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          isReversed: false,
                                          isReadOnly: false)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          isReversed: true,
                                          isReadOnly: false)

            Text("Disabled").font(.caption)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          isReversed: false,
                                          isReadOnly: false)
                .disabled(true)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          isReversed: true,
                                          isReadOnly: false)
                .disabled(true)

            Text("On error").font(.caption)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          isReversed: false,
                                          isError: true,
                                          errorText: "Error")

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          isReversed: true,
                                          isError: true,
                                          errorText: "Error")

            Text("Read only").font(.subheadline)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          isReversed: false,
                                          isReadOnly: true)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          isReversed: true,
                                          isReadOnly: true)

            Text("With icons").font(.caption)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          icon: Image(systemName: "flag.pattern.checkered"),
                                          isReversed: false,
                                          isReadOnly: false)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          icon: Image(systemName: "flag.pattern.checkered"),
                                          isReversed: true,
                                          isReadOnly: false)

            Text("On error").font(.caption)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          icon: Image(systemName: "flag.pattern.checkered"),
                                          isReversed: false,
                                          isError: true,
                                          errorText: "Error")

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          icon: Image(systemName: "flag.pattern.checkered"),
                                          isReversed: true,
                                          isError: true,
                                          errorText: "Error")

            Text("Disabled").font(.caption)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          icon: Image(systemName: "flag.pattern.checkered"),
                                          isReversed: false,
                                          isReadOnly: false)
                .disabled(true)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          icon: Image(systemName: "flag.pattern.checkered"),
                                          isReversed: true,
                                          isReadOnly: false)
                .disabled(true)

            Text("Read only").font(.caption)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          icon: Image(systemName: "flag.pattern.checkered"),
                                          isReversed: false,
                                          isReadOnly: true)

            OUDSCheckboxItemIndeterminate(selection: $state,
                                          label: "Label",
                                          helper: "Helper",
                                          icon: Image(systemName: "flag.pattern.checkered"),
                                          isReversed: true,
                                          isReadOnly: true)
        }
    }

    // MARK: - tvOS Layout (2 colonnes : Without Icon | With Icon)
    private var tvOSGridLayout: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 30) {

            // Colonne 1 : Without Icon
            VStack(spacing: 20) {
                Text("Without Icon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                checkboxSection(title: "Normal", withIcon: false)
                checkboxSection(title: "Disabled", withIcon: false, isDisabled: true)
                checkboxSection(title: "Error", withIcon: false, isError: true)
                checkboxSection(title: "Read Only", withIcon: false, isReadOnly: true)
            }
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)

            // Colonne 2 : With Icon
            VStack(spacing: 20) {
                Text("With Icon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                checkboxSection(title: "Normal", withIcon: true)
                checkboxSection(title: "Disabled", withIcon: true, isDisabled: true)
                checkboxSection(title: "Error", withIcon: true, isError: true)
                checkboxSection(title: "Read Only", withIcon: true, isReadOnly: true)
            }
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
        }
        .padding()
    }

    // MARK: - Helper Views
    @ViewBuilder
    private func checkboxSection(
        title: String,
        withIcon: Bool,
        isDisabled: Bool = false,
        isError: Bool = false,
        isReadOnly: Bool = false) -> some View
    {
        VStack(spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: 8) {
                // Normal (isReversed: false)
                OUDSCheckboxItemIndeterminate(
                    selection: $state,
                    label: "Label",
                    helper: "Helper",
                    icon: withIcon ? Image(systemName: "flag.pattern.checkered") : nil,
                    isReversed: false,
                    isError: isError,
                    errorText: isError ? "Error" : nil,
                    isReadOnly: isReadOnly)
                    .disabled(isDisabled)

                // Reversed (isReversed: true)
                OUDSCheckboxItemIndeterminate(
                    selection: $state,
                    label: "Label",
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
}
