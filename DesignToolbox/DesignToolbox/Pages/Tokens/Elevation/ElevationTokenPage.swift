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

// MARK: - Elevation Token Page

struct ElevationTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            #if !os(tvOS) && !os(watchOS)
            Section {
                DesignToolboxCode(code: "theme.elevations.none.elevation(for: colorScheme)", titleText: "app_tokens_common_viewCodeExample_label")
            }
            #endif
            Spacer().frame(height: theme.spaces.fixedMedium)

            ForEach(NamedElevation.allCases, id: \.rawValue) { elevationName in
                IllustrationElevation(namedElevation: elevationName)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, theme.spaces.fixedMedium)
    }
}
