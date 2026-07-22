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

/// A single-column lazy grid that renders a list of `DesignToolboxElement` items as `Card` views.
///
/// Used by both `DesignToolboxElementsPage` (Tokens / Components tabs) and `SearchPage`
/// so the grid layout is defined in one place only.
///
/// - Note: Only available on iOS and macOS — visionOS uses a distinct `LazyVStack` pill layout
///   that remains inside `DesignToolboxElementsPage`. tvOS and watchOS are in another project (the light version).
#if !os(visionOS)
struct ElementsGridView: View {

    // MARK: - Properties

    let elements: [DesignToolboxElement]

    @AccessibilityFocusState private var requestFocus: AccessibilityFocusable?
    @Environment(\.theme) private var theme

    // MARK: - macOS selection binding

    #if !os(iOS) && !os(tvOS)
    /// On macOS there is no `NavigationLink`; tapping a card updates this binding
    /// so the parent `NavigationSplitView` can display the detail pane.
    var onSelect: ((DesignToolboxElement) -> Void)?
    #endif

    // MARK: - Body

    var body: some View {
        LazyVGrid(
            columns: [GridItem(.flexible(), alignment: .topLeading)],
            spacing: theme.spaces.fixedMedium)
        {
            ForEach(elements, id: \.id) { element in
                #if os(iOS) || os(tvOS)
                NavigationLink {
                    element.pageDescription
                } label: {
                    cardView(for: element)
                }
                #else // macOS
                Button {
                    onSelect?(element)
                } label: {
                    cardView(for: element)
                }
                #endif
            }
        }
        .gridMargin(.horizontal)
        .padding(.vertical, theme.spaces.fixedMedium)
        #if os(tvOS)
            // Declare the grid as a focus region so the focus engine can route focus
            // out of it (upward) toward the top controls bar and the tab bar.
            .focusSection()
        #endif
    }

    // MARK: - Private

    @ViewBuilder private func cardView(for element: DesignToolboxElement) -> some View {
        let card = Card(
            title: Text(LocalizedStringKey(element.name)),
            illustration: element.illustration)
            .accessibilityFocused($requestFocus, equals: .some(id: element.id))
        if let firstElementID = elements.first?.id {
            card.requestAccessibleFocus(_requestFocus, for: .some(id: firstElementID))
        } else {
            card
        }
    }
}
#endif
