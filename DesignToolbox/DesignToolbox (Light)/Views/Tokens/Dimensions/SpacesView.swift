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

struct SpacesView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(watchLayout: { WatchVerticalLayout { watchLayout } },
                              tvLayout: { TVVerticalLayout { tvLayout } })
    }

    // MARK: - watchOS

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            Section("Scaled") {
                ScaledSpaceProperty()
            }
            Section("Fixed") {
                FixedSpaceProperty()
            }
            Section("Padding inline") {
                PaddingInlineProperty()
            }
            Section("Padding inset") {
                PaddingInsetProperty()
            }
            Section("Padding block") {
                PaddingBlockProperty()
            }
            Section("Column gap") {
                ColumnGapProperty()
            }
            Section("Row gap") {
                RowGapProperty()
            }
        }
    }

    // MARK: - tvOS

    @ViewBuilder
    private var tvLayout: some View {
        TVGridLayout(count: 2) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Scaled").font(.headline)
                ScaledSpaceProperty()
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            VStack(alignment: .leading, spacing: 16) {
                Text("Fixed").font(.headline)
                FixedSpaceProperty()
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            VStack(alignment: .leading, spacing: 16) {
                Text("Padding inline").font(.headline)
                PaddingInlineProperty()
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            VStack(alignment: .leading, spacing: 16) {
                Text("Padding inset").font(.headline)
                PaddingInsetProperty()
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            VStack(alignment: .leading, spacing: 16) {
                Text("Padding block").font(.headline)
                PaddingBlockProperty()
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            VStack(alignment: .leading, spacing: 16) {
                Text("Column gap").font(.headline)
                ColumnGapProperty()
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()

            VStack(alignment: .leading, spacing: 16) {
                Text("Row gap").font(.headline)
                RowGapProperty()
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            .focusable()
        }
    }
}
