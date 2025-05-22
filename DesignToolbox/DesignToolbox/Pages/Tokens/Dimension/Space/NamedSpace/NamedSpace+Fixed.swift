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

import OUDS
import OUDSTokensSemantic
import SwiftUI

extension NamedSpace {

    enum Fixed: String, CaseIterable, NamedSpaceToken {
        case spaceFixedNone
        case spaceFixedSmash
        case spaceFixedShortest
        case spaceFixedShorter
        case spaceFixedShort
        case spaceFixedMedium
        case spaceFixedTall
        case spaceFixedTaller
        case spaceFixedTallest
        case spaceFixedSpacious
        case spaceFixedHuge
        case spaceFixedJumbo

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceFixedNone:
                theme.spaces.spaceFixedNone
            case .spaceFixedSmash:
                theme.spaces.spaceFixedSmash
            case .spaceFixedShortest:
                theme.spaces.spaceFixedShortest
            case .spaceFixedShorter:
                theme.spaces.spaceFixedShorter
            case .spaceFixedShort:
                theme.spaces.spaceFixedShort
            case .spaceFixedMedium:
                theme.spaces.spaceFixedMedium
            case .spaceFixedTall:
                theme.spaces.spaceFixedTall
            case .spaceFixedTaller:
                theme.spaces.spaceFixedTaller
            case .spaceFixedTallest:
                theme.spaces.spaceFixedTallest
            case .spaceFixedSpacious:
                theme.spaces.spaceFixedSpacious
            case .spaceFixedHuge:
                theme.spaces.spaceFixedHuge
            case .spaceFixedJumbo:
                theme.spaces.spaceFixedJumbo
            }
        }
    }
}
