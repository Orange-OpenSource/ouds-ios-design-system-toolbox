//
// Software Name: OUDSThemesContract iOS
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

/// Used to list all elements in the main screen of the application
/// (enumerate tokens and components)
struct DesignToolboxElementsPage: View {

    // MARK: - Properties

    let title: String
    let elements: [DesignToolboxElement]

    #if !os(iOS)
    @State private var selectedElement: DesignToolboxElement?
    #endif

    @AccessibilityFocusState private var requestFocus: AccessibilityFocusable?
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        #if os(iOS) || os(visionOS)
        NavigationView {
            elementsPage
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        #else // macOS
        // Trick to be sure the view refreshes because NavigationView not always refreshed with macOS
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
            #if os(visionOS)
            LazyVStack(spacing: 12) {
                ForEach(elements, id: \.id) { element in
                    NavigationLink {
                        element.pageDescription
                            .navigationBarMenus()
                    } label: {
                        cardView(for: element)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 20)
            .navigationBarMenus()
            #else
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
            #endif
        }
        .oudsBackground(theme.colors.bgPrimary)
        .oudsNavigationTitle(title)
    }

    private func cardView(for element: DesignToolboxElement) -> some View {
        #if os(visionOS)
        HStack(spacing: 16) {
            // Illustration
            element.illustration
                .frame(width: 44, height: 44)
                .scaleEffect(0.6)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))

            // Titre
            Text(LocalizedStringKey(element.name))
                .font(.headline)
                .foregroundStyle(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "chevron.right")
                .accessibilityHidden(true)
                .font(.subheadline)
                .foregroundStyle(.tertiary)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 18)
        .background(.regularMaterial, in: .capsule)
        .hoverEffect(.highlight)
        .accessibilityFocused($requestFocus, equals: .some(id: element.id))
        .oudsRequestAccessibleFocus(_requestFocus, for: .some(id: elements[0].id))
        #else
        Card(
            title: Text(LocalizedStringKey(element.name)),
            illustration: element.illustration)
            .accessibilityFocused($requestFocus, equals: .some(id: element.id))
            .oudsRequestAccessibleFocus(_requestFocus, for: .some(id: elements[0].id))
        #endif
    }
}
