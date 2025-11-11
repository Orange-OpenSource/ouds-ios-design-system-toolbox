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

import OUDSSwiftUI

enum NamedBorderRadius: String, CaseIterable {
    case radiusNone
    case radiusDefault
    case radiusSmall
    case radiusMedium
    case radiusLarge
    case radiusPill

    func token(from theme: OUDSTheme) -> BorderRadiusSemanticToken {
        switch self {
        case .radiusNone:
            theme.borders.radiusNone
        case .radiusDefault:
            theme.borders.radiusDefault
        case .radiusSmall:
            theme.borders.radiusSmall
        case .radiusMedium:
            theme.borders.radiusMedium
        case .radiusLarge:
            theme.borders.radiusLarge
        case .radiusPill:
            theme.borders.radiusPill
        }
    }
}

enum NamedBorderWidth: String, CaseIterable {
    case widthNone
    case widthDefault
    case widthThin
    case widthMedium
    case widthThick
    case widthThicker
    case widthFocus
    case widthFocusInset

    func token(from theme: OUDSTheme) -> BorderWidthSemanticToken {
        switch self {
        case .widthNone:
            theme.borders.widthNone
        case .widthDefault:
            theme.borders.widthDefault
        case .widthThin:
            theme.borders.widthThin
        case .widthMedium:
            theme.borders.widthMedium
        case .widthThick:
            theme.borders.widthThick
        case .widthThicker:
            theme.borders.widthThicker
        case .widthFocus:
            theme.borders.widthFocus
        case .widthFocusInset:
            theme.borders.widthFocusInset
        }
    }
}

enum NamedBorderStyle: String, CaseIterable {
    case styleDefault
    case styleDrag

    func token(from theme: OUDSTheme) -> BorderStyleSemanticToken {
        switch self {
        case .styleDefault:
            theme.borders.styleDefault
        case .styleDrag:
            theme.borders.styleDrag
        }
    }
}
