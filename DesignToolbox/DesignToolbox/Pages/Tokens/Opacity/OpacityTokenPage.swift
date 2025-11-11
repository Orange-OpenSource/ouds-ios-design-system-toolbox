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

// MARK: - Opacity Token Page

struct OpacityTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            Section {
                DesignToolboxCode(code: "theme.opacities.invisible", titleText: "app_tokens_common_viewCodeExample_label")
            }

            Spacer().frame(height: theme.spaces.fixedMedium)

            ForEach(NamedOpacity.allCases, id: \.rawValue) { opacityName in
                IllustrationOpacity(opacityName: opacityName)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, theme.spaces.fixedMedium)
    }
}
