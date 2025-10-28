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

    enum RowGap: String, CaseIterable, NamedSpaceToken {
        case rowGapNone
        case rowGap2xsmall
        case rowGapXsmall
        case rowGapSmall
        case rowGapMedium
        case rowGapLarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .rowGapNone:
                theme.spaces.rowGapNone
            case .rowGap2xsmall:
                theme.spaces.rowGap2xsmall
            case .rowGapXsmall:
                theme.spaces.rowGapXsmall
            case .rowGapSmall:
                theme.spaces.rowGapSmall
            case .rowGapMedium:
                theme.spaces.rowGapMedium
            case .rowGapLarge:
                theme.spaces.rowGapLarge
            }
        }
    }
}
