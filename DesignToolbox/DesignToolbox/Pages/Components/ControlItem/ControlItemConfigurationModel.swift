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

import OUDSComponents
import SwiftUI

// MARK: - Control Item Configuration Model

/// The model shared between `ControlItemConfigurationModel` view and `ControlItemConfiguration` view.
class ControlItemConfigurationModel: ComponentConfiguration {

    // MARK: - Properties
    typealias OutlinedConfiguration = (value: Bool, outlinedConfigurationLabel: String)
    typealias AdditionalLabelConfiguration = String

    var componentInitCode: String = ""
    var additionalLabelConfiguration: AdditionalLabelConfiguration?
    var outlinedConfiguration: OutlinedConfiguration?

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var icon: Bool {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var isError: Bool {
        didSet { updateCode() }
    }

    @Published var isReadOnly: Bool {
        didSet { updateCode() }
    }

    @Published var divider: Bool {
        didSet { updateCode() }
    }

    @Published var isReversed: Bool {
        didSet { updateCode() }
    }

    @Published var labelText: String {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var outlined: Bool {
        didSet { updateCode() }
    }

    @Published var additionalLabelText: String {
        didSet { updateCode() }
    }

    // MARK: - Initializer

    init(componentInitCode: String,
         outlinedConfiguration: OutlinedConfiguration? = nil,
         additionalLabelConfiguration: AdditionalLabelConfiguration? = nil)
    {
        self.componentInitCode = componentInitCode
        isError = false
        isReadOnly = false
        enabled = true
        icon = true
        flipIcon = false
        isReversed = false
        divider = true
        labelText = String(localized: "app_components_common_label_label")
        helperText = String(localized: "app_components_controlItem_helperText_label")
        self.outlinedConfiguration = outlinedConfiguration
        self.additionalLabelConfiguration = additionalLabelConfiguration
        outlined = outlinedConfiguration?.value ?? false
        additionalLabelText = additionalLabelConfiguration ?? ""
    }

    deinit {}

    // MARK: - Component Configuration

    // swiftlint:disable line_length
    override func updateCode() {
        code =
            """
            \(componentInitCode), label: "\(labelText)"\(additionalLabelTextPattern)\(helperTextPattern)\(iconPattern)\(flipIconPattern)\(outlinedPattern)\(isReversedPattern)\(isErrorPattern)\(isReadOnlyPattern)\(dividerPattern))
            \(disableCodePattern)
            """
    }
    // swiftlint:enable line_length

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var helperTextPattern: String {
        helperText.isEmpty ? "" : ", helper: \"\(helperText)\""
    }

    private var iconPattern: String {
        icon ? ", icon: Image(systemName: \"figure.handball\")" : ""
    }

    private var flipIconPattern: String {
        flipIcon ? ", flipIcon: true" : ""
    }

    private var isReversedPattern: String {
        isReversed ? ", isReversed: true" : ""
    }

    private var isErrorPattern: String {
        isError ? ", isError: true" : ""
    }

    private var isReadOnlyPattern: String {
        isReadOnly ? ", isReadOnly: true" : ""
    }

    private var dividerPattern: String {
        divider ? ", divider: true" : ""
    }

    private var additionalLabelTextPattern: String {
        !additionalLabelText.isEmpty ? ", additionalLabel: \"\(additionalLabelText)\"" : ""
    }

    private var outlinedPattern: String {
        outlined == true ? ", isOutlined: true" : ""
    }
}

// MARK: - ControlItem Configuration View (Bool selection)

final class BooleanControlItemConfigurationModel: ControlItemConfigurationModel {
    @Published var isOn: Bool = true

    deinit {}
}

// MARK: - ControlItem Configuration View (Indeterminate checkbox selection)

final class IndicatorStateControlItemConfigurationModel: ControlItemConfigurationModel {
    @Published var selection: OUDSCheckboxIndicatorState = .indeterminate

    deinit {}
}
