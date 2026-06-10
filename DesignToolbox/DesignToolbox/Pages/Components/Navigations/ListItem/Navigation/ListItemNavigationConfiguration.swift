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

// MARK: - ListItem Navigation Configuration Model

final class ListItemNavigationConfigurationModel: ListItemConfigurationModel {

    @Published var affordanceType: OUDSNavigationListItemAffordanceType {
        didSet { updateCode() }
    }

    override init() {
        affordanceType = .next
        super.init()
    }

    deinit {}
}

// MARK: - ListItem Configuration

struct ListItemNavigationConfiguration: View {

    @ObservedObject var configurationModel: ListItemNavigationConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            OUDSChipPicker(title: "app_components_listItem_affordance_tech".localized(),
                           selection: $configurationModel.affordanceType,
                           chips: OUDSNavigationListItemAffordanceType.chips)

            Divider().horizontal()

            ListItemConfiguration(configurationModel: configurationModel)
        }
    }
}

extension OUDSNavigationListItemAffordanceType: @retroactive CaseIterable {}
extension OUDSNavigationListItemAffordanceType: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSNavigationListItemAffordanceType] = [.next, .previous, .external]
}
