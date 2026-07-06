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

extension NamedColor {

    enum Ai: String, CaseIterable {
        case colorAiPrimary
        case colorAiSecondary
        case colorAiTertiary
        case colorAiQuaternary

        func token(from theme: OUDSTheme) -> MultipleColorSemanticToken {
            switch self {
            case .colorAiPrimary:
                theme.colors.colorAiPrimary
            case .colorAiSecondary:
                theme.colors.colorAiSecondary
            case .colorAiTertiary:
                theme.colors.colorAiTertiary
            case .colorAiQuaternary:
                theme.colors.colorAiQuaternary
            }
        }
    }
}
