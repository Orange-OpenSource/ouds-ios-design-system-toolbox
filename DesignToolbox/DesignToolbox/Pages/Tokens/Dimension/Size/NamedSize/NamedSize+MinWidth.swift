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

extension NamedSize {
    enum MinWidth: String, CaseIterable {
        case minInteractiveArea

        func token(for theme: OUDSTheme) -> SizeSemanticToken {
            switch self {
            case .minInteractiveArea:
                theme.sizes.minInteractiveArea
            }
        }
    }
}
