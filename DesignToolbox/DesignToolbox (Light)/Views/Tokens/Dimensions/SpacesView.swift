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

/// Using Swift files from DesignToolbox folder, displays simply the spaces tokens
struct SpacesView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: { WatchVerticalLayout { watchLayout } })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            Section("Scaled") {
                ScaledSpaceProperty()
            }
            Section("Fixed") {
                FixedSpaceProperty()
            }
            Section("Inset") {
                InsetSpaceProperty()
            }
            Section("Padding inline") {
                PaddingInlineProperty()
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
}
