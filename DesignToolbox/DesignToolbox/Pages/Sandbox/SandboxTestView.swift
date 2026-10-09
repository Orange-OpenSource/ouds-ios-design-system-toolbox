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
import UIKit

/// Flags and constants used by the DEBUG-only sandbox mode.
///
/// The sandbox is a debug playground surfaced as a dedicated tab at the very
/// first position of the tab bar. It is only compiled and displayed in `DEBUG`
/// builds and is gated at runtime by a user preference toggled from the About
/// page (see ``SandboxUserDefaultsKeys/sandboxEnabled``).
///
/// When ``kSandboxContainsThings`` is `false`, the sandbox tab displays a
/// placeholder view. When set to `true`, the sandbox tab loads
/// `SandboxTestView`, which is the surface intended to be pimped with
/// experimentations and debug helpers.

/// Toggle indicating whether the sandbox tab has actual content to display.
///
/// - `false` (default): the sandbox displays a placeholder (icon + labels).
/// - `true`: the sandbox loads `SandboxTestView` for experimentations.
///
/// Flip this flag when you start populating the sandbox with real content.
let kSandboxContainsThings: Bool = true

/// Actual sandbox surface, loaded when ``kSandboxContainsThings`` is `true`.
///
/// This view is intentionally empty by default so it can be pimped later with
/// experimentations, debug helpers and prototypes without touching the
/// scaffolding around it.
///
/// Current experiment: a "call history" list built with `OUDSStaticListItem`,
/// used to try out the new list item API (overline styling, custom trailing views).
struct SandboxTestView: View {

    @State private var fonts: [FontInfo] = []
    @State private var isLoading = true
    @State private var searchText = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Header
                HStack {
                    Text("iOS Fonts")
                        .font(.title)
                        .bold()
                    Spacer()
                    Button(action: {
                        loadFonts()
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
                .padding(.horizontal)

                // Search
                TextField("Search fonts...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                // Font List
                if isLoading {
                    ProgressView()
                        .padding()
                } else if fonts.isEmpty {
                    Text("No fonts found")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(filteredFonts) { font in
                            FontRowView(font: font)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle("iOS Font Explorer")
        .onAppear {
            loadFonts()
        }
    }

    private var filteredFonts: [FontInfo] {
        fonts.filter { font in
            searchText.isEmpty ||
                font.name.localizedCaseInsensitiveContains(searchText) ||
                font.familyName.localizedCaseInsensitiveContains(searchText)
        }
    }

    private func loadFonts() {
        fonts = []
        isLoading = true

        DispatchQueue.main.async {
            #if os(iOS) || os(tvOS) || os(watchOS)
            let families = UIFont.familyNames.sorted()
            for family in families {
                let fontNames = UIFont.fontNames(forFamilyName: family).sorted()
                for fontName in fontNames {
                    if let font = UIFont(name: fontName, size: 12) {
                        let isMono = font.fontDescriptor.symbolicTraits.contains(.traitMonoSpace)
                        fonts.append(FontInfo(
                            name: fontName,
                            familyName: family,
                            isMonospaced: isMono))
                    }
                }
            }
            #endif
            isLoading = false
        }
    }
}

// MARK: - Font Info Model

struct FontInfo: Identifiable {
    let id = UUID()
    let name: String
    let familyName: String
    let isMonospaced: Bool
}

// MARK: - Font Row View

struct FontRowView: View {
    let font: FontInfo

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(font.name)
                    .font(.custom(font.name, size: 16))
                    .lineLimit(1)

                Spacer()

                if font.isMonospaced {
                    Text("Mono")
                        .font(.caption)
                        .padding(4)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(4)
                }
            }

            Text("Family: " + font.familyName)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(8)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .padding(.bottom, 4)
    }
}
