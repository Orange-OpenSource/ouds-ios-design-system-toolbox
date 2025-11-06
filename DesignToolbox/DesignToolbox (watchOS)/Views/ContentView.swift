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

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Badge", destination: BadgesView())
                NavigationLink("Button", destination: ButtonsView())
//                NavigationLink("Checkbox", destination: CheckboxView())
//                NavigationLink("Chip", destination: ChipView())
//                NavigationLink("Colored Background", destination: ColoredBackgroundView())
//                NavigationLink("Divider", destination: DividerView())
//                NavigationLink("Link", destination: LinkView())
//                NavigationLink("Radio Button", destination: RadioButtonView())
//                NavigationLink("Switch", destination: SwitchView())
//                NavigationLink("Tag", destination: TagView())
//                NavigationLink("Text Input", destination: TextInputView())
            }
            .navigationTitle("Demo App")
        }
    }
}
