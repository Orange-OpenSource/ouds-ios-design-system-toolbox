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

    enum PaddingInset: String, CaseIterable, NamedSpaceToken {
        case spaceInsetNone
        case spaceInset4xsmall
        case spaceInset3xsmall
        case spaceInset2xsmall
        case spaceInsetXsmall
        case spaceInsetSmall
        case spaceInsetMedium
        case spaceInsetLarge
        case spaceInsetXlarge
        case spaceInset2xlarge
        case spaceInset3xlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceInsetNone:
                theme.spaces.spaceInsetNone
            case .spaceInset4xsmall:
                theme.spaces.spaceInset4xsmall
            case .spaceInset3xsmall:
                theme.spaces.spaceInset3xsmall
            case .spaceInset2xsmall:
                theme.spaces.spaceInset2xsmall
            case .spaceInsetXsmall:
                theme.spaces.spaceInsetXsmall
            case .spaceInsetSmall:
                theme.spaces.spaceInsetSmall
            case .spaceInsetMedium:
                theme.spaces.spaceInsetMedium
            case .spaceInsetLarge:
                theme.spaces.spaceInsetLarge
            case .spaceInsetXlarge:
                theme.spaces.spaceInsetXlarge
            case .spaceInset2xlarge:
                theme.spaces.spaceInset2xlarge
            case .spaceInset3xlarge:
                theme.spaces.spaceInset3xlarge
            }
        }
    }
}
