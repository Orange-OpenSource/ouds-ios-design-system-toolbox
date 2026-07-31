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
import Combine

open class ListItemBadgeConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: OUDSListItemSize

    @Published var badgeTypeOption: BadgeType {
        didSet { updateCode() }
    }

    var stadardModel: BadgeStandardConfigurationModel
    var countModel: BadgeCountConfigurationModel

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        badgeTypeOption = .standard
        stadardModel = .init()
        countModel = .init()

        super.init()

        register(stadardModel)
        register(countModel)
    }

    // MARK: Builder

    @MainActor
    var badgeType: OUDSListItemTrailing.BadgeType {
        switch badgeTypeOption {
        case .standard:
                .standard(.init(accessibilityLabel: "", status: stadardModel.status, size: stadardModel.standardSize))
        case .count:
                .count(.init(countModel.count,
                             accessibilityLabel: code.count.description,
                             status: countModel.status,
                             size: countModel.countSize))
        }
    }
    // MARK: Code helper

    override func updateCode() {
        code = switch badgeTypeOption {
        case .standard:
            stadardModel.code
        case .count:
            countModel.code
        }
    }
}

struct ListItemBadgeConfiguration: View {

    @ObservedObject var configurationModel: ListItemBadgeConfigurationModel

    var body: some View {
        OUDSChipPicker(title: "app_components_listItem_trailing_badgeType_tech".localized(),
                       selection: $configurationModel.badgeTypeOption,
                       chips: BadgeType.chips)

        OUDSHorizontalDivider()

        switch configurationModel.badgeTypeOption {
        case .standard:
            OUDSChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.stadardModel.standardSize,
                           chips: OUDSBadgeStandard.Size.chips)

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.stadardModel.status,
                           chips: OUDSBadgeStandard.Status.chips)
        case .count:
            OUDSChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.countModel.countSize,
                           chips: OUDSBadgeCount.Size.chips)

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.countModel.status,
                           chips: OUDSBadgeStandard.Status.chips)
        }
    }
}

enum BadgeType: DesignToolboxEnumRepresentable {
    case standard, count
}
