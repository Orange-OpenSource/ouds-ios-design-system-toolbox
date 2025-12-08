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

import SwiftUI

struct ComponentsPage: View {

    var componentElements: [DesignToolboxElement] = [
        BadgeElement(),
        ButtonElement(),
        ColoredSurfaceElement(),
        CheckboxElements(),
        ChipElements(),
        DividerElements(),
        LinkElement(),
        RadioElements(),
        SwitchElements(),
        TabBarElement(),
        TagElements(),
        TextInputElement(),
    ]

    init() {
        // Tab bar element demo designed for iOS / iPhones
        // Demo is broken for other platforms (navigation troubles with this tab view integrate elsewhere)
        #if !os(iOS)
        componentElements.removeAll(where: { $0 is TabBarElement })
        #elseif canImport(UIKit)
        if UIDevice.current.userInterfaceIdiom == .pad {
            componentElements.removeAll(where: { $0 is TabBarElement })
        }
        #endif
    }

    var body: some View {
        DesignToolboxElementsPage(title: "app_bottomBar_components_label",
                                  elements: componentElements.sorted(by: { $0.name < $1.name }))
    }
}
