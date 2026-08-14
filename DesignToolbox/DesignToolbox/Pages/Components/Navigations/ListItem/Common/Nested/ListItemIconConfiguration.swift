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

open class ListItemIconConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: OUDSListItemSize

    @Published var status: IconStatus {
        didSet { updateCode() }
    }

    @Published var size: OUDSListItemIcon.Size {
        didSet { updateCode() }
    }

    @Published var bageOnNeutralIcon: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        status = .negative
        bageOnNeutralIcon = false
        size = .medium

        super.init()
    }

    deinit {}

    // MARK: Builder

    @MainActor
    func icon(for theme: OUDSTheme) -> OUDSListItemIcon {
        let status: OUDSListItemIcon.IconStatus =
            switch status {
            case .neutral:
                .neutral(
                    asset: Image(
                        decorative: "ic_heart",
                        bundle: theme.resourcesBundle),
                    badge: bageOnNeutralIcon)
            case .info:
                .info
            case .warning:
                .warning
            case .negative:
                .negative
            case .positive:
                .positive
            }

        return OUDSListItemIcon(status: status,
                                description: "app_components_listItem_icon_a11y".localized(),
                                size: size)
    }

    // MARK: Code helepr

    override func updateCode() {
        let imagePattern = "Image(decorative: \"ic_heart\")"
        let statusPattern =
            switch status {
            case .neutral:
                ".neutral(asset: \(imagePattern), badge: \(bageOnNeutralIcon))"
            case .info:
                ".info"
            case .warning:
                ".warning"
            case .negative:
                ".negative"
            case .positive:
                ".positive"
            }

        let sizePattern: String = size.technicalDescription
        let descriptionPattern = "app_components_listItem_icon_a11y".localized()

        code = ".init(status: \(statusPattern), description: \"\(descriptionPattern)\", size: \(sizePattern))"
    }
}

struct ListItemIconConfiguration: View {

    @ObservedObject var configurationModel: ListItemIconConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(title: "app_components_listItem_iconStatus_tech".localized(),
                           selection: $configurationModel.status,
                           chips: IconStatus.chips)

            if configurationModel.status == .neutral {
                OUDSSwitchItem("app_components_listItem_iconBadge_label", isOn: $configurationModel.bageOnNeutralIcon)
            }

            if configurationModel.itemSize == .default {
                OUDSChipPicker(title: "app_components_listItem_iconSize_tech".localized(),
                               selection: $configurationModel.size,
                               chips: OUDSListItemIcon.Size.chips)
            }
        }
    }
}

enum IconStatus: DesignToolboxEnumRepresentable {
    case neutral, info, warning, negative, positive
}

// MARK: - Extensions of OUDSListItemIcon.Size

extension OUDSListItemIcon.Size: @retroactive CaseIterable {}
extension OUDSListItemIcon.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemIcon.Size] = [.medium, .large]
}
