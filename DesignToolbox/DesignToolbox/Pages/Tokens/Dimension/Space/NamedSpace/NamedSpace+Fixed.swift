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
        case spaceFixed3xsmall
        case spaceFixed2xsmall
        case spaceFixedXsmall
        case spaceFixedSmall
        case spaceFixedMedium
        case spaceFixedLarge
        case spaceFixedXlarge
        case spaceFixed2xlarge
        case spaceFixed3xlarge
        case spaceFixed4xlarge
        case spaceFixed5xlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceFixedNone:
                theme.spaces.spaceFixedNone
            case .spaceFixed3xsmall:
                theme.spaces.spaceFixed3xsmall
            case .spaceFixed2xsmall:
                theme.spaces.spaceFixed2xsmall
            case .spaceFixedXsmall:
                theme.spaces.spaceFixedXsmall
            case .spaceFixedSmall:
                theme.spaces.spaceFixedSmall
            case .spaceFixedMedium:
                theme.spaces.spaceFixedMedium
            case .spaceFixedLarge:
                theme.spaces.spaceFixedLarge
            case .spaceFixedXlarge:
                theme.spaces.spaceFixedXlarge
            case .spaceFixed2xlarge:
                theme.spaces.spaceFixed2xlarge
            case .spaceFixed3xlarge:
                theme.spaces.spaceFixed3xlarge
            case .spaceFixed4xlarge:
                theme.spaces.spaceFixed4xlarge
            case .spaceFixed5xlarge:
                theme.spaces.spaceFixed5xlarge
            }
        }
    }
}
