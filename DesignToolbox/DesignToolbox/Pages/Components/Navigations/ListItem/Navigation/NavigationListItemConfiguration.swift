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

// MARK: - Navigation List Item Configuration Model

final class NavigationListItemConfigurationModel: ListItemConfigurationModel {

    @Published var indicatorType: OUDSNavigationListItemIndicatorType {
        didSet { updateCode() }
    }

    override init() {
        indicatorType = .next
        super.init()
        componentInitCode = "OUDSNavigationListItem"
    }

    deinit {}
}

// MARK: - Navigation List Item Configuration

struct NavigationListItemConfiguration: View {

    @ObservedObject var configurationModel: NavigationListItemConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            ListItemConfiguration(configurationModel: configurationModel)

            Divider().horizontal()

            OUDSChipPicker(title: "app_components_listItem_indicator_tech".localized(),
                           selection: $configurationModel.indicatorType,
                           chips: OUDSNavigationListItemIndicatorType.chips)
        }
    }
}

// MARK: Extension for OUDSNavigationListItemIndicatorType

extension OUDSNavigationListItemIndicatorType: @retroactive CaseIterable {}
extension OUDSNavigationListItemIndicatorType: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSNavigationListItemIndicatorType] = [.next, .external, .previous]
}
