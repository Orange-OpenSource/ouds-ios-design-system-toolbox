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

/// Used to list all elements in the main screen of the application
/// (enumerate tokens and components)
struct DesignToolboxElementsPage: View {

    // MARK: - Properties

    let title: String
    let elements: [DesignToolboxElement]

    #if !os(iOS) && !os(tvOS)
    @State private var selectedElement: DesignToolboxElement?
    #endif

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        #if os(iOS)
        OUDSNavigationStack {
            elementsPage
        }
        .navigationBarTitleDisplayMode(.inline)
        #elseif os(tvOS)
        // tvOS: focus engine works best with a simple stack; NavigationSplitView with
        // sidebar is awkward with the Siri Remote. We use NavigationStack + grid.
        NavigationStack {
            elementsPage
        }
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
                            .navigationBarMenus(title: title)
                    } label: {
                        visionOSCardView(for: element)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 20)
            .navigationBarMenus(title: title)
            #else
            #if os(iOS) || os(tvOS)
            ElementsGridView(elements: elements)
                .navigationBarMenus(title: title)
            #else // macOS
            ElementsGridView(elements: elements, onSelect: { selectedElement = $0 })
                .navigationBarMenus(title: title)
            #endif
            #endif
        }
        .background(theme.colors.bgPrimary)
        .oudsNavigationTitle(title)
    }

    // MARK: - visionOS-only card layout

    #if os(visionOS)
    private func visionOSCardView(for element: DesignToolboxElement) -> some View {
        HStack(spacing: 16) {
            element.illustration
                .frame(width: 44, height: 44)
                .scaleEffect(0.6)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))

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
    }
    #endif
}
