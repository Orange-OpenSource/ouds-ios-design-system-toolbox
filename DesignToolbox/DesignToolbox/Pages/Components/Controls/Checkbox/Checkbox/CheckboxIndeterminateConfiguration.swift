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

import OUDSComponents
import SwiftUI

// MARK: - Checkbox Configuration Model

/// The model shared between `CheckboxIndeterminateConfiguration` view and `CheckboxIndeterminatePage` view.
/// Related to `OUDSCheckboxIndeterminate` (i.e. with 3 available values).
final class CheckboxIndeterminateConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var indicatorState: OUDSCheckboxIndicatorState {
        didSet { updateCode() }
    }

    @Published var isError: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        indicatorState = .selected
        isError = false
        enabled = true
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code =
            """
            OUDSCheckboxInterminate(selection: $selection\(isErrorPattern))
            \(disableCodePattern)
            """
    }

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var isErrorPattern: String {
        if isError, enabled {
            ", isError: true"
        } else {
            ""
        }
    }
}

// MARK: - Checkbox Indeterminate Configuration View

struct CheckboxIndeterminateConfiguration: View {

    @ObservedObject var configurationModel: CheckboxIndeterminateConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
                .disabled(configurationModel.isError)

            OUDSSwitchItem("app_components_common_error_label", isOn: $configurationModel.isError)
                .disabled(!configurationModel.enabled)

            OUDSChipPicker(title: "app_components_common_selection_label",
                           selection: $configurationModel.indicatorState,
                           chips: OUDSCheckboxIndicatorState.chips)
        }
    }
}
