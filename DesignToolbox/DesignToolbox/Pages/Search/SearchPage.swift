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

#if os(iOS)
import OUDSSwiftUI
import SwiftUI

/// Search page available on iOS 26+ via `Tab(role: .search)`.
/// Aggregates all tokens and components so the user can find any element by name.
@available(iOS 26, *)
struct SearchPage: View {

    // MARK: - Properties

    @State private var searchText = ""
    @Environment(\.theme) private var theme

    // MARK: - Elements

    /// All tokens and components merged and sorted alphabetically.
    private var allElements: [DesignToolboxElement] {
        let tokens = AllElements.tokenElements(themeName: theme.name)
        let components = AllElements.componentElements()
        return (tokens + components).sorted { $0.name < $1.name }
    }

    /// Elements filtered by the current search query (case- and diacritic-insensitive).
    private var filteredElements: [DesignToolboxElement] {
        guard !searchText.isEmpty else { return allElements }
        return allElements.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            Group {
                if filteredElements.isEmpty {
                    emptyState
                } else {
                    resultsList
                }
            }
            .background(theme.colors.bgPrimary)
            .navigationTitle("app_search_navigation_title")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarMenus(title: "app_search_navigation_title")
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: Text("app_search_placeholder"))
    }

    // MARK: - Helpers

    private var resultsList: some View {
        ScrollView {
            ElementsGridView(elements: filteredElements)
        }
    }

    private var emptyState: some View {
        VStack(spacing: theme.spaces.fixedMedium) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 48, weight: .light))
                .foregroundStyle(theme.colors.contentDefault)
                .accessibilityHidden(true)
            Text(String(format: String(localized: "app_search_empty_results"), searchText))
                .multilineTextAlignment(.center)
                .foregroundStyle(theme.colors.contentDefault)
                .padding(.horizontal, theme.spaces.fixedMedium)
            Spacer()
        }
    }
}
#endif
