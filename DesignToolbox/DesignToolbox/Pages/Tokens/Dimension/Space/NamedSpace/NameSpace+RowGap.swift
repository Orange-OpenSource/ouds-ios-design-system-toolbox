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
        case spaceRowGapNone
        case spaceRowGap2xsmall
        case spaceRowGapXsmall
        case spaceRowGapSmall
        case spaceRowGapMedium
        case spaceRowGapLarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceRowGapNone:
                theme.spaces.spaceRowGapNone
            case .spaceRowGap2xsmall:
                theme.spaces.spaceRowGap2xsmall
            case .spaceRowGapXsmall:
                theme.spaces.spaceRowGapXsmall
            case .spaceRowGapSmall:
                theme.spaces.spaceRowGapSmall
            case .spaceRowGapMedium:
                theme.spaces.spaceRowGapMedium
            case .spaceRowGapLarge:
                theme.spaces.spaceRowGapLarge
            }
        }
    }
}
