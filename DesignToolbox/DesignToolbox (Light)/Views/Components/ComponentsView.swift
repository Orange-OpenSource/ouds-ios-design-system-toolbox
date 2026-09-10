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

struct ComponentsView: View {

    @ViewBuilder
    var body: some View {
        NavigationLink("Actions", destination: ActionsView())
        NavigationLink("Content Display", destination: ContentDisplayView())
        NavigationLink("Controls", destination: ControlsView())
        NavigationLink("Dialogs", destination: DialogsView())
        NavigationLink("Foundations", destination: FoundationsView())
        NavigationLink("Indicators", destination: IndicatorsView())
        NavigationLink("Layouts", destination: LayoutsView())
        NavigationLink("Navigations", destination: NavigationsView())
    }
}
