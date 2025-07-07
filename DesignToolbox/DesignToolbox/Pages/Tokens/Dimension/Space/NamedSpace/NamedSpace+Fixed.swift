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
        case spaceFixed3xs
        case spaceFixed2xs
        case spaceFixedXs
        case spaceFixedSm
        case spaceFixedMd
        case spaceFixedLg
        case spaceFixedXl
        case spaceFixed2xl
        case spaceFixed3xl
        case spaceFixed4xl
        case spaceFixed5xl

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceFixedNone:
                theme.spaces.spaceFixedNone
            case .spaceFixed3xs:
                theme.spaces.spaceFixed3xs
            case .spaceFixed2xs:
                theme.spaces.spaceFixed2xs
            case .spaceFixedXs:
                theme.spaces.spaceFixedXs
            case .spaceFixedSm:
                theme.spaces.spaceFixedSm
            case .spaceFixedMd:
                theme.spaces.spaceFixedMd
            case .spaceFixedLg:
                theme.spaces.spaceFixedLg
            case .spaceFixedXl:
                theme.spaces.spaceFixedXl
            case .spaceFixed2xl:
                theme.spaces.spaceFixed2xl
            case .spaceFixed3xl:
                theme.spaces.spaceFixed3xl
            case .spaceFixed4xl:
                theme.spaces.spaceFixed4xl
            case .spaceFixed5xl:
                theme.spaces.spaceFixed5xl
            }
        }
    }
}
