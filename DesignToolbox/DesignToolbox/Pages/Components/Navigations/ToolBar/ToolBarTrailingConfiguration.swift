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

// MARK: - Toolbar Trailing Configuration

struct ToolBarTrailingConfiguration: View {

    @StateObject var configurationModel: ToolBarConfigurationModel
    @Environment(\.theme) private var theme
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    var body: some View {
        OUDSChipPicker(title: "app_components_toolbar_trailing_tech".localized(),
                       selection: $configurationModel.trailing,
                       chips: LeadingTrailingType.chips)

        switch configurationModel.trailing {
        case .label, .icon:
            Stepper("app_components_common_itemCount_label" <- "\(configurationModel.numberOfTrailingItems)",
                    value: $configurationModel.numberOfTrailingItems,
                    in: 1 ... 3)
                .padding(.horizontal, theme.spaces.fixedMedium)
                .labelStrongMedium(theme)

            if isLiquidGlassDisabled,
               configurationModel.trailing == .label
            {
                OUDSSwitchItem("app_components_toolbar_item_emphasized_tech", isOn: $configurationModel.isTrailingEmphasized)
            }

        default:
            EmptyView()
        }

        switch configurationModel.trailing {
        case .none:
            EmptyView()
        default:
            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.isTrailingEnabled)
        }
    }
}

#endif
