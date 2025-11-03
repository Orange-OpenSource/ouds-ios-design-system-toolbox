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

// MARK: - Radio Configuration Model

/// The model shared between `RadioConfiguration` view and `RadioPage` view.
final class RadioConfigurationModel: ComponentConfiguration {

    // MARK: - Properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var selection: Bool {
        didSet { updateCode() }
    }

    @Published var isError: Bool {
        didSet { updateCode() }
    }

    // MARK: - Initializer

    override init() {
        selection = false
        isError = false
        enabled = true
    }

    deinit {}

    // MARK: - Component Configuration

    override func updateCode() {
        code =
            """
            OUDSRadio(isOn: $isOn, accessibilityLabel: "A label for accessibility"\(isErrorPattern))
            \(disableCodePattern)
            """
    }

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var isErrorPattern: String {
        isError && enabled ? ", isError: true" : ""
    }
}

// MARK: - Radio Configuration View

struct RadioConfiguration: View {

    @ObservedObject var configurationModel: RadioConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_components_common_selection_label", isOn: $configurationModel.selection)
                .accessibilityIdentifier(A11YIdentifiers.configurationSwitchSelection)
                .disabled(!configurationModel.enabled || configurationModel.isError)

            OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
                .disabled(configurationModel.isError)

            OUDSSwitchItem("app_components_common_error_label", isOn: $configurationModel.isError)
                .disabled(!configurationModel.enabled)
        }
    }
}
