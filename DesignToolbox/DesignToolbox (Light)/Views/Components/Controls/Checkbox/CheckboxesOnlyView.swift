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

struct CheckboxesOnlyView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Two-states", destination: TwoStatesCheckboxesOnlyView())
                NavigationLink("Three-states", destination: ThreeStatesCheckboxesOnlyView())
            }
        }
    }
}

// MARK: - Two-states checkboxes only

private struct TwoStatesCheckboxesOnlyView: View {

    @State private var isOn: Bool = true

    var body: some View {
        WatchAndTVLayoutsView(watchLayout: {
            layout
        }, tvLayout: {
            layout
        })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Two-states checkboxes").font(.headline)

        Text("Enabled, no error").font(.subheadline)
        OUDSCheckbox(isOn: $isOn,
                     accessibilityLabel: "Normal",
                     isError: false)

        Text("Enabled, on error").font(.subheadline)
        OUDSCheckbox(isOn: $isOn,
                     accessibilityLabel: "Error",
                     isError: true)

        Text("Disabled, no error").font(.subheadline)
        OUDSCheckbox(isOn: $isOn,
                     accessibilityLabel: "Disabled",
                     isError: false)
            .disabled(true)
    }
}

// MARK: - Three-states checkboxes only

private struct ThreeStatesCheckboxesOnlyView: View {

    @State private var state: OUDSCheckboxIndicatorState = .indeterminate

    var body: some View {
        WatchAndTVLayoutsView(watchLayout: {
            layout
        }, tvLayout: {
            layout
        })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Three-states checkboxes").font(.headline)

        Text("Enabled, no error").font(.subheadline)
        OUDSCheckboxIndeterminate(selection: $state,
                                  accessibilityLabel: "Normal",
                                  isError: false)

        Text("Enabled, on error").font(.subheadline)
        OUDSCheckboxIndeterminate(selection: $state,
                                  accessibilityLabel: "Error",
                                  isError: true)

        Text("Disabled, no error").font(.subheadline)
        OUDSCheckboxIndeterminate(selection: $state,
                                  accessibilityLabel: "Disabled",
                                  isError: false)
            .disabled(true)
    }
}
