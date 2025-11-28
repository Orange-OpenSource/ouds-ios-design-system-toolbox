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

//
//  NamedElevatio.swift
//  DesignToolbox
//
//  Created by Pierre-Yves Lapersonne on 11/11/2025.
//
import OUDSSwiftUI
import SwiftUI

enum NamedElevation: String, CaseIterable {
    case none
    case raised
    case drag
    case `default`
    case emphasized
    case sticky

    func token(from theme: OUDSTheme) -> ElevationCompositeSemanticToken {
        switch self {
        case .none:
            theme.elevations.none
        case .raised:
            theme.elevations.raised
        case .drag:
            theme.elevations.drag
        case .default:
            theme.elevations.default
        case .emphasized:
            theme.elevations.emphasized
        case .sticky:
            theme.elevations.sticky
        }
    }
}
