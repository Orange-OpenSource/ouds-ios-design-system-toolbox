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

#if !os(tvOS)

import OUDSSwiftUI
import SwiftUI

// MARK: - ToolBar Principal Configuration

struct ToolBarPrincipalConfiguration: View {

    @StateObject var configurationModel: ToolBarConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            OUDSChipPicker(title: "app_components_toolbar_principalType_tech",
                           selection: $configurationModel.principalType,
                           chips: PrincipalType.chips)

            if configurationModel.principalType != .none {
                switch configurationModel.principalType {
                case .none:
                    EmptyView()
                case .icon:
                    OUDSChipPicker(title: "app_components_badge_tech".localized(),
                                   selection: $configurationModel.badgeType,
                                   chips: BarItemBadgeType.chips)
                case .label:
                    EmptyView()
                case .custom:
                    EmptyView()
                }
            }
        }
    }
}

#endif
