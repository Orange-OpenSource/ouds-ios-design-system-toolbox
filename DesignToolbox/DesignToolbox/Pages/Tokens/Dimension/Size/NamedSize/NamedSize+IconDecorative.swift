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

extension NamedSize {
    enum IconDecorative: String, CaseIterable {
        case sizeIconDecorative4xsmall
        case sizeIconDecorative3xsmall
        case sizeIconDecorative2xsmall
        case sizeIconDecorativeXsmall
        case sizeIconDecorativeSmall
        case sizeIconDecorativeMedium
        case sizeIconDecorativeLarge
        case sizeIconDecorativeXlarge
        case sizeIconDecorative2xlarge

        func token(from theme: OUDSTheme) -> SizeSemanticToken {
            switch self {
            case .sizeIconDecorative4xsmall:
                theme.sizes.sizeIconDecorative4xsmall
            case .sizeIconDecorative3xsmall:
                theme.sizes.sizeIconDecorative3xsmall
            case .sizeIconDecorative2xsmall:
                theme.sizes.sizeIconDecorative2xsmall
            case .sizeIconDecorativeXsmall:
                theme.sizes.sizeIconDecorativeXsmall
            case .sizeIconDecorativeSmall:
                theme.sizes.sizeIconDecorativeSmall
            case .sizeIconDecorativeMedium:
                theme.sizes.sizeIconDecorativeMedium
            case .sizeIconDecorativeLarge:
                theme.sizes.sizeIconDecorativeLarge
            case .sizeIconDecorativeXlarge:
                theme.sizes.sizeIconDecorativeXlarge
            case .sizeIconDecorative2xlarge:
                theme.sizes.sizeIconDecorative2xlarge
            }
        }
    }
}
