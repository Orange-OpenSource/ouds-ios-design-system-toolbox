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

struct DesignToolboxConfiguration<Configuration>: View where Configuration: View {

    // MARK: Environment properties

    @Environment(\.theme) private var theme

    // MARK: Stored properties

    @ViewBuilder
    let configuration: () -> Configuration

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            Group {
                Text("app_common_configuration_label")
                    .headingMedium(theme)
                    .oudsForegroundColor(theme.colors.contentDefault)
                    .frame(maxWidth: .infinity, alignment: .leading)

                OUDSHorizontalDivider()
            }
            .padding(.horizontal, theme.spaces.fixedMedium)

            configuration()
        }
        .padding(.vertical, theme.spaces.fixedMedium)
        .oudsBorder(style: theme.borders.styeDefault,
                    width: theme.borders.widthThin,
                    radius: theme.borders.radiusMedium,
                    color: theme.colors.borderDefault)
    }
}
