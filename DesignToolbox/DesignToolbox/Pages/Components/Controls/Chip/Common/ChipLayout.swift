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

// MARK: - Chip Layout

enum ChipLayout: CaseIterable, CustomStringConvertible {
    case textOnly
    case textAndIcon
    case iconOnly

    var description: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_tech"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_tech"
        case .iconOnly:
            "app_components_common_iconOnlyLayout_tech"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
