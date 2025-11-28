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
//  NamedOpacity.swift
//  DesignToolbox
//
//  Created by Pierre-Yves Lapersonne on 11/11/2025.
//
import OUDSSwiftUI

enum NamedOpacity: String, CaseIterable {
    case invisible
    case weakest
    case weaker
    case weak
    case medium
    case strong
    case opaque
    case disabled

    func token(from theme: OUDSTheme) -> OpacitySemanticToken {
        switch self {
        case .invisible:
            theme.opacities.invisible
        case .weakest:
            theme.opacities.weakest
        case .weaker:
            theme.opacities.weaker
        case .weak:
            theme.opacities.weak
        case .medium:
            theme.opacities.medium
        case .strong:
            theme.opacities.strong
        case .opaque:
            theme.opacities.opaque
        case .disabled:
            theme.opacities.disabled
        }
    }
}
