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

enum TextualContentMode: CaseIterable, CustomStringConvertible {

    /// To map to OUDS TextualContent.attributed(AttributedString)
    case rich
    /// To map to OUDS TextualContent.raw(String)
    case raw

    static let allCases: [TextualContentMode] = [.rich, .raw]

    var description: String {
        switch self {
        case .rich:
            "Rich"
        case .raw:
            "Raw"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
