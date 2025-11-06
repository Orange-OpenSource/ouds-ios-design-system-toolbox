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

struct ChipsView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Filter chip", destination: FilterChipView())
                NavigationLink("Suggestion chip", destination: SuggestionChipView())
            }
        }
        .navigationTitle("Chips")
    }
}

// MARK: - Filter chip

// swiftlint:disable accessibility_label_for_image
private struct FilterChipView: View {

    @State private var isSelected: Bool = true
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                OUDSFilterChip(text: "Filter", selected: isSelected) { isSelected.toggle() }
                OUDSFilterChip(icon: Image(systemName: "sun.min.fill"), text: "Filter", selected: isSelected) { isSelected.toggle() }
                OUDSFilterChip(icon: Image(systemName: "sun.min.fill"), accessibilityLabel: "Filter", selected: isSelected) { isSelected.toggle() }
            }
        }
    }
}

// swiftlint:enable accessibility_label_for_image

// MARK: - Suggestion chip

// swiftlint:disable accessibility_label_for_image
private struct SuggestionChipView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                OUDSSuggestionChip(text: "Suggestion") {}
                OUDSSuggestionChip(icon: Image(systemName: "sun.min.fill"), text: "Suggestion") {}
                OUDSSuggestionChip(icon: Image(systemName: "sun.min.fill"), accessibilityLabel: "Suggestion") {}
            }
        }
    }
}

// swiftlint:enable accessibility_label_for_image
