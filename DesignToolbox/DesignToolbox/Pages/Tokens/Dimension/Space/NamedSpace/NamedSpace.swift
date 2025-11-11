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

enum NamedSpace {}

/// Interface all `NamedSpace` tokens must implement  provide a displayable name and the sementic token
protocol NamedSpaceToken {
    var name: String { get }

    func token(from theme: OUDSTheme) -> SpaceSemanticToken
}
