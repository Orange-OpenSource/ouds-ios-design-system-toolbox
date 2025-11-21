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

// MARK: - TabBar Configuration Model

/// The model shared between `TabBarPageConfiguration` view and `TabBarPageComponent` view.
final class TabBarConfigurationModel: ComponentConfiguration {

    // MARK: Initializer

    override init() {}

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSTabBar() {}
        """
    }
}

// MARK: - TabBar Configuration View

struct TabBarConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: TabBarConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                Text("Configuration")
            }
        }
    }
}
