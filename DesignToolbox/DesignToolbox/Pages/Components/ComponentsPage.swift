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
import OUDSComponents
import SwiftUI

struct ComponentsPage: View {

    let componentElements: [DesignToolboxElement] = [
        BadgeElement(),
        ButtonElement(),
        ColoredSurfaceElement(),
        CheckboxElements(),
        ChipElements(),
        DividerElements(),
        LinkElement(),
        RadioElements(),
        SwitchElements(),
    ]

    var body: some View {
        DesignToolboxElementsPage(title: "app_bottomBar_components_label",
                                  elements: componentElements.sorted(by: { $0.name < $1.name }))
    }
}
