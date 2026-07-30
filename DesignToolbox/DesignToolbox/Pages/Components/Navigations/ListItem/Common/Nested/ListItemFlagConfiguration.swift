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

open class ListItemFlagConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: OUDSListItemSize

    @Published var size: OUDSListItemFlag.Size {
        didSet { updateCode() }
    }

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        size = .medium

        super.init()
    }

    // MARK: Builder

    @MainActor
    var flag: OUDSListItemFlag {
        OUDSListItemFlag(asset: Image(decorative: "il_flag_fr"), size: size)
    }

    // MARK: Code helper

    override func updateCode() {
        code = ".init(asset: Image(\"ic_flag_FR_fr\"), size: \(size.technicalDescription))"
    }
}

struct ListItemFlagConfiguration: View {

    @ObservedObject var configurationModel: ListItemFlagConfigurationModel

    var body: some View {
        if configurationModel.itemSize == .standard {
            OUDSChipPicker(title: "app_components_listItem_flagSize_tech".localized(),
                           selection: $configurationModel.size,
                           chips: OUDSListItemFlag.Size.chips)
        }
    }
}

// MARK: - Extensions of OUDSListItemFlag.Size

extension OUDSListItemFlag.Size: @retroactive CaseIterable {}
extension OUDSListItemFlag.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemFlag.Size] = [
        .medium, .large, .extraLarge,
    ]
}
