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

enum StatusIcons: DesignToolboxEnumRepresentable {

    /// No status icon for a given component
    case none

    /// Tinted icon for the given component
    case tintedIcon

    /// Raw image without tint for the given component
    case image
}

enum DefinedStatusIcons: DesignToolboxEnumRepresentable {

    /// Tinted icon for the given component
    case tintedIcon

    /// Raw image without tint for the given component
    case image
}
