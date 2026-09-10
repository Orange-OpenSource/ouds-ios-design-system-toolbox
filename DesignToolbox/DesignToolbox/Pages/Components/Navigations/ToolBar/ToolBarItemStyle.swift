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

// MARK: - Toolbar Item Style

struct ToolBarItemStyle: View {

    @StateObject var configurationModel: ToolBarConfigurationModel
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    var body: some View {
        if !isLiquidGlassDisabled,
           configurationModel.trailing == .icon ||
           configurationModel.leading == .icon ||
           configurationModel.trailing == .label ||
           configurationModel.leading == .label
        {

            OUDSHorizontalDivider()

            OUDSChipPicker(title: "app_components_toolbar_item_ios26ButtonStyle_tech",
                           selection: $configurationModel.ios26ButtonStyle,
                           chips: OUDSToolBarItem.ActionStyle.chips)
        }
    }
}

#endif
