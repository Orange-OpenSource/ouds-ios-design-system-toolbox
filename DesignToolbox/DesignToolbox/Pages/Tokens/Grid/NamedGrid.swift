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
import SwiftUI

enum NamedGrid: String, CaseIterable {
    case minWidth
    case maxWidth
    case margin
    case columnGap

    @MainActor
    func token(from theme: OUDSTheme, for sizeClass: OUDSUserInterfaceSizeClass) -> GridRawToken {
        switch self {
        case .minWidth:
            theme.gridMinWidth(for: sizeClass)
        case .maxWidth:
            theme.gridMaxWidth(for: sizeClass)
        case .margin:
            theme.gridMargin(for: sizeClass)
        case .columnGap:
            theme.gridColumnGap(for: sizeClass)
        }
    }
}
