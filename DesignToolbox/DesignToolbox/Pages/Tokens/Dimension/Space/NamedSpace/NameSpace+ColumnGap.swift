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

extension NamedSpace {

    enum ColumnGap: String, CaseIterable, NamedSpaceToken {
        case spaceColumnGapNone
        case spaceColumnGapShorter
        case spaceColumnGapShort
        case spaceColumnGapMedium
        case spaceColumnGapTall
        case spaceColumnGapTaller

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceColumnGapNone:
                theme.spaces.spaceColumnGapNone
            case .spaceColumnGapShorter:
                theme.spaces.spaceColumnGapShorter
            case .spaceColumnGapShort:
                theme.spaces.spaceColumnGapShort
            case .spaceColumnGapMedium:
                theme.spaces.spaceColumnGapMedium
            case .spaceColumnGapTall:
                theme.spaces.spaceColumnGapTall
            case .spaceColumnGapTaller:
                theme.spaces.spaceColumnGapTaller
            }
        }
    }
}
