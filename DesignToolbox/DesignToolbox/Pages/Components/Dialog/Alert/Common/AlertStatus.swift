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

enum AlertStatus: String, CaseIterable, CustomStringConvertible {
    case neutral
    case accent
    case positive
    case info
    case warning
    case negative

    var description: String {
        switch self {
        case .neutral:
            "Neutral"
        case .accent:
            "Accent"
        case .positive:
            "Positive"
        case .info:
            "Info"
        case .warning:
            "Warning"
        case .negative:
            "Negative"
        }
    }

    var technicalDescription: String {
        ".\(rawValue)"
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
