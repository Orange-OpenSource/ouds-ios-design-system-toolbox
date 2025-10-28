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
        case columnGapNone
        case columnGapXsmall
        case columnGapSmall
        case columnGapMedium
        case columnGapLarge
        case columnGapXlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .columnGapNone:
                theme.spaces.columnGapNone
            case .columnGapXsmall:
                theme.spaces.columnGapXsmall
            case .columnGapSmall:
                theme.spaces.columnGapSmall
            case .columnGapMedium:
                theme.spaces.columnGapMedium
            case .columnGapLarge:
                theme.spaces.columnGapLarge
            case .columnGapXlarge:
                theme.spaces.columnGapXlarge
            }
        }
    }
}
