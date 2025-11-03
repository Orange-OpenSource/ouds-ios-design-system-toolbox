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

// MARK: - Switch Configuration Model

/// The model shared between `SwitchConfiguration` view and `SwitchPage` view.
final class SwitchConfigurationModel: ComponentConfiguration {

    // MARK: - Properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var selection: Bool {
        didSet { updateCode() }
    }

    // MARK: - Initializer

    override init() {
        selection = true
        enabled = true
    }

    deinit {}

    // MARK: - Component Configuration

    override func updateCode() {
        code =
            """
            OUDSSwitch(isOn: $isOn, accessibilityLabel: "A label for accessibility")
            \(disableCodePattern)
            """
    }

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }
}

// MARK: - Switch Configuration View

struct SwitchConfiguration: View {

    @ObservedObject var configurationModel: SwitchConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_components_common_selection_label", isOn: $configurationModel.selection)
                .disabled(!configurationModel.enabled)

            OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
        }
    }
}
