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
        case spaceRowGap2xs
        case spaceRowGapXs
        case spaceRowGapSm
        case spaceRowGapMedium
        case spaceRowGapTall

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceRowGapNone:
                theme.spaces.spaceRowGapNone
            case .spaceRowGap2xs:
                theme.spaces.spaceRowGap2xs
            case .spaceRowGapXs:
                theme.spaces.spaceRowGapXs
            case .spaceRowGapSm:
                theme.spaces.spaceRowGapSm
            case .spaceRowGapMedium:
                theme.spaces.spaceRowGapMd
            case .spaceRowGapTall:
                theme.spaces.spaceRowGapLg
            }
        }
    }
}
