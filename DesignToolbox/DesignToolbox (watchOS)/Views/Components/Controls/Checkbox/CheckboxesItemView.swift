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

struct CheckboxesItemView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Two-states", destination: TwoStatesCheckboxesItemsView())
                NavigationLink("Three-states", destination: ThreeStatesCheckboxesItemsView())
            }
        }
    }
}

// MARK: Two-states checkboxes items

// swiftlint:disable accessibility_label_for_image
// swiftlint:disable closure_body_length
private struct TwoStatesCheckboxesItemsView: View {

    @State private var isOn: Bool = false
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                Text("2-states checkboxes items").font(.headline)

                Text("No icons").font(.subheadline)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 isReversed: false,
                                 isReadOnly: false)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 isReversed: true,
                                 isReadOnly: false)

                Text("Disabled").font(.caption)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 isReversed: false,
                                 isReadOnly: false)
                    .disabled(true)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 isReversed: true,
                                 isReadOnly: false)
                    .disabled(true)

                Text("On error").font(.caption)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 isReversed: false,
                                 isError: true,
                                 errorText: "Error")

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 isReversed: true,
                                 isError: true,
                                 errorText: "Error")

                Text("Read only").font(.caption)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 isReversed: false,
                                 isReadOnly: true)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 isReversed: true,
                                 isReadOnly: true)

                Text("With icons").font(.subheadline)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 icon: Image(systemName: "flag.pattern.checkered"),
                                 isReversed: false,
                                 isReadOnly: false)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 icon: Image(systemName: "flag.pattern.checkered"),
                                 isReversed: true,
                                 isReadOnly: false)

                Text("On error").font(.caption)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 icon: Image(systemName: "flag.pattern.checkered"),
                                 isReversed: false,
                                 isError: true,
                                 errorText: "Error")

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 icon: Image(systemName: "flag.pattern.checkered"),
                                 isReversed: true,
                                 isError: true,
                                 errorText: "Error")

                Text("Disabled").font(.caption)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 icon: Image(systemName: "flag.pattern.checkered"),
                                 isReversed: false,
                                 isReadOnly: false)
                    .disabled(true)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 icon: Image(systemName: "flag.pattern.checkered"),
                                 isReversed: true,
                                 isReadOnly: false)
                    .disabled(true)

                Text("Read only").font(.caption)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 icon: Image(systemName: "flag.pattern.checkered"),
                                 isReversed: false,
                                 isReadOnly: true)

                OUDSCheckboxItem(isOn: $isOn,
                                 label: "Label",
                                 helper: "Helper",
                                 icon: Image(systemName: "flag.pattern.checkered"),
                                 isReversed: true,
                                 isReadOnly: true)
            }
        }
    }
}

// swiftlint:enable accessibility_label_for_image
// swiftlint:enable closure_body_length

// MARK: Three-states checkboxes items

// swiftlint:disable accessibility_label_for_image
// swiftlint:disable closure_body_length
private struct ThreeStatesCheckboxesItemsView: View {

    @State private var state: OUDSCheckboxIndicatorState = .indeterminate
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
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
    }
}

// swiftlint:enable accessibility_label_for_image
// swiftlint:enable closure_body_length
