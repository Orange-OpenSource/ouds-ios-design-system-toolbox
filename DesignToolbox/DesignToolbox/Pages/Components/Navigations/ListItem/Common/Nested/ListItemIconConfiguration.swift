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

    @Published var type: IconType {
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

        type = .negative
        bageOnNeutralIcon = false
        size = .medium

        super.init()
    }

    // MARK: Builder

    @MainActor
    func icon(for theme: OUDSTheme) -> OUDSListItemIcon {
        let type: OUDSListItemIcon.IconType =
            switch type {
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

        return OUDSListItemIcon(type: type, size: size)
    }

    // MARK: Code helepr

    var iconPattern: String {
        let imagePattern = "Image(decorative: \"ic_heart\")"
        let typePattern =
        switch type {
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
        return ".init(type: \(typePattern), size: \(sizePattern))"
    }
}

struct ListItemIconConfiguration: View {

    @ObservedObject var configurationModel: ListItemIconConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(title: "app_components_listItem_iconType_tech".localized(),
                           selection: $configurationModel.type,
                           chips: IconType.chips)

            if configurationModel.type == .neutral {
                OUDSSwitchItem("app_components_listItem_iconBadge_label", isOn: $configurationModel.bageOnNeutralIcon)
            }

            if configurationModel.itemSize == .standard {
                OUDSChipPicker(title: "app_components_listItem_iconSize_tech".localized(),
                               selection: $configurationModel.size,
                               chips: OUDSListItemIcon.Size.chips)
            }
        }
    }
}

enum IconType: DesignToolboxEnumRepresentable {
    case neutral, info, warning, negative, positive
}

// MARK: - Extensions of OUDSListItemIcon.Size

extension OUDSListItemIcon.Size: @retroactive CaseIterable {}
extension OUDSListItemIcon.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemIcon.Size] = [.medium, .large]
}
