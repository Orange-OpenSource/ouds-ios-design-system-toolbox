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

import Combine
import OUDSSwiftUI
import SwiftUI

// MARK: - List Item Badge Configuration Model

open class ListItemBadgeConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var standardModel: BadgeStandardConfigurationModel
    var countModel: BadgeCountConfigurationModel

    @Published var badgeTypeOption: ListItemBadgeType {
        didSet {
            defaultBadgeOptions()
            updateCode()
        }
    }

    // MARK: Initializer

    override init() {

        badgeTypeOption = .standard
        standardModel = .init()
        countModel = .init()

        super.init()

        defaultBadgeOptions()

        register(standardModel)
        register(countModel)
    }

    deinit {}

    // MARK: Builder

    private func defaultBadgeOptions() {
        standardModel.standardSize = .small
        standardModel.status = .negative
        countModel.countSize = .large
        countModel.status = .negative
    }

    @MainActor
    var badgeType: OUDSListItemTrailing.BadgeType {
        switch badgeTypeOption {
        case .standard:
            .standard(.init(accessibilityLabel: "", status: standardModel.status, size: standardModel.standardSize))
        case .count:
            .count(.init(countModel.count,
                         accessibilityLabel: code.count.description,
                         status: countModel.status,
                         size: countModel.countSize))
        }
    }

    override func updateCode() {
        code = switch badgeTypeOption {
        case .standard:
            ".standard(\(standardModel.code)))"
        case .count:
            ".count(\(countModel.code)))"
        }
    }
}

// MARK: - List Item Badge Configuration

struct ListItemBadgeConfiguration: View {

    @ObservedObject var configurationModel: ListItemBadgeConfigurationModel

    var body: some View {
        OUDSChipPicker(title: "app_components_listItem_trailing_badgeType_tech".localized(),
                       selection: $configurationModel.badgeTypeOption,
                       chips: ListItemBadgeType.chips)

        switch configurationModel.badgeTypeOption {
        case .standard:
            OUDSChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.standardModel.standardSize,
                           chips: OUDSBadgeStandard.Size.chips)

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.standardModel.status,
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

// MARK: - List Item Badge Type

enum ListItemBadgeType: DesignToolboxEnumRepresentable {
    case standard, count
}
