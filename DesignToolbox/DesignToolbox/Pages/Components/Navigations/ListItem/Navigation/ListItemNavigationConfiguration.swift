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

    @Published var affordanceType: OUDSListItemNavigation.AffordanceType {
        didSet { updateCode() }
    }

    override init() {
        affordanceType = .next
        super.init()
    }

    deinit {}

    // MARK: - Code generation

    override func updateCode() {
        code = ""
    }
}

// MARK: - ListItem Configuration

struct ListItemNavigationConfiguration: View {

    @ObservedObject var configurationModel: ListItemNavigationConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                OUDSChipPicker(title: "app_components_listItem_affordance_tech".localized(),
                               selection: $configurationModel.affordanceType,
                               chips: OUDSListItemNavigation.AffordanceType.chips)

                Divider().horizontal()

                ListItemCommonConfiguration(configurationModel: configurationModel)

            }

            ListItemTextsCommonConfiguration(configurationModel: configurationModel)
        }
    }
}

extension OUDSListItemNavigation.AffordanceType: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    public static let allCases: [OUDSListItemNavigation.AffordanceType] = [.next, .previous, .external]

    public var description: String {
        switch self {
        case .next:
            "Next"
        case .previous:
            "Previous"
        case .external:
            "External"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
