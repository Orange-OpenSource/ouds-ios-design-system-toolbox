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

import OUDS
import OUDSComponents
import SwiftUI

/// Used to list all elements in the main screen of the application
/// (enumerate tokens and components)
struct DesignToolboxElementsPage: View {

    #if os(macOS)
    @State private var selectedElement: DesignToolboxElement?
    #endif

    @AccessibilityFocusState private var requestFocus: AccessibilityFocusable?
    @Environment(\.theme) private var theme

    // MARK: Stored properties

    let title: String
    let elements: [DesignToolboxElement]

    // MARK: Body

    var body: some View {
        #if os(iOS)
        NavigationView {
            elementsPage
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        #else // macOS
        // Trick to be sure the view refreshes because NavigationView not always refreshed
        NavigationSplitView {
            elementsPage
        } detail: {
            if let selectedElement {
                selectedElement.pageDescription
            } else {
                Text("app_common_select_element")
                    .foregroundColor(.secondary)
            }
        }
        #endif
    }

    // MARK: - Helper

    private var elementsPage: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), alignment: .topLeading)], spacing: theme.spaces.fixed2xsmall) {
                ForEach(elements, id: \.id) { element in
                    #if os(iOS)
                    NavigationLink {
                        element.pageDescription
                    } label: {
                        cardView(for: element)
                    }
                    #else // macOS
                    Button {
                        selectedElement = element
                    } label: {
                        cardView(for: element)
                    }
                    #endif
                }
            }
            .padding(.all, theme.spaces.fixedMedium)
            .navigationBarMenus()
        }
        .oudsBackground(theme.colors.bgPrimary)
        .oudsNavigationTitle(title)
    }

    private func cardView(for element: DesignToolboxElement) -> some View {
        Card(
            title: Text(LocalizedStringKey(element.name)),
            illustration: element.illustration)
            .accessibilityFocused($requestFocus, equals: .some(id: element.id))
            .oudsRequestAccessibleFocus(_requestFocus, for: .some(id: elements[0].id))
    }
}
