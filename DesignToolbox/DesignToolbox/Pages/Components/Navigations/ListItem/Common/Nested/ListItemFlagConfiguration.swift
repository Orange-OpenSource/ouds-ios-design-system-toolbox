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

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize
        super.init()
    }

    deinit {}

    // MARK: Builder

    @MainActor
    var flag: OUDSListItemFlag {
        OUDSListItemFlag(asset: Image(decorative: "il_flag_fr"))
    }

    // MARK: Code helper

    override func updateCode() {
        code = ".init(asset: Image(\"ic_flag_fr\"))"
    }
}
