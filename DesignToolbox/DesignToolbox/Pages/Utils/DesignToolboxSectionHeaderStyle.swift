//
// Software Name: OUDSThemesContract iOS
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

struct DesignToolboxSectionHeaderModifier: ViewModifier {

    @Environment(\.theme) private var theme

    func body(content: Content) -> some View {
        content
            .headingMedium(theme)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension Text {
    func designToolboxSectionHeaderStyle() -> some View {
        modifier(DesignToolboxSectionHeaderModifier())
    }
}
