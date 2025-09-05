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

    enum PaddingInline: String, CaseIterable, NamedSpaceToken {
        case spacePaddingInlineNone
        case spacePaddingInline4xs
        case spacePaddingInline3xs
        case spacePaddingInline2xs
        case spacePaddingInlineXs
        case spacePaddingInlineSm
        case spacePaddingInlineMd
        case spacePaddingInlineLg
        case spacePaddingInlineXl
        case spacePaddingInline2xl
        case spacePaddingInline3xl
        case spacePaddingInline4xl

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spacePaddingInlineNone:
                theme.spaces.spacePaddingInlineNone
            case .spacePaddingInline4xs:
                theme.spaces.spacePaddingInline4xs
            case .spacePaddingInline3xs:
                theme.spaces.spacePaddingInline3xs
            case .spacePaddingInline2xs:
                theme.spaces.spacePaddingInline2xs
            case .spacePaddingInlineXs:
                theme.spaces.spacePaddingInlineXs
            case .spacePaddingInlineSm:
                theme.spaces.spacePaddingInlineSm
            case .spacePaddingInlineMd:
                theme.spaces.spacePaddingInlineMd
            case .spacePaddingInlineLg:
                theme.spaces.spacePaddingInlineLg
            case .spacePaddingInlineXl:
                theme.spaces.spacePaddingInlineXl
            case .spacePaddingInline2xl:
                theme.spaces.spacePaddingInline2xl
            case .spacePaddingInline3xl:
                theme.spaces.spacePaddingInline3xl
            case .spacePaddingInline4xl:
                theme.spaces.spacePaddingInline4xl
            }
        }
    }
}
