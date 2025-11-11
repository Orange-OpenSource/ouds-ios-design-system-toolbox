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

/// Using Swift files from DesignToolbox folder, displays simply the elevations tokens
struct ElevationsView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(title: "Elevations",
                              watchLayout: { watchLayout },
                              tvLayout: { tvLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(NamedElevation.allCases, id: \.rawValue) { elevationName in
                IllustrationElevation(namedElevation: elevationName)
            }
        }
    }

    @ViewBuilder
    private var tvLayout: some View {
        TVVerticalLayout {
            ForEach(NamedElevation.allCases, id: \.rawValue) { elevationName in
                IllustrationElevation(namedElevation: elevationName)
            }
        }
    }
}
