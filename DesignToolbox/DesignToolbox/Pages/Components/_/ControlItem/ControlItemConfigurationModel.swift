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

// MARK: - Control Item Configuration Model

/// The model shared between `ControlItemConfigurationModel` view and `ControlItemConfiguration` view.
class ControlItemConfigurationModel: ComponentConfiguration {

    typealias OutlinedConfiguration = (value: Bool, outlinedConfigurationLabel: String)
    typealias ExtraLabelConfiguration = String

    // MARK: - Properties

    var componentInitCode: String = ""
    var extraLabelConfiguration: ExtraLabelConfiguration?
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

    @Published var constrainedMaxWidth: Bool {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
        didSet { updateCode() }
    }

    @Published var isReversed: Bool {
        didSet { updateCode() }
    }

    @Published var labelText: String {
        didSet { updateCode() }
    }

    @Published var descriptionText: String {
        didSet { updateCode() }
    }

    @Published var errorText: String {
        didSet { updateCode() }
    }

    @Published var outlined: Bool {
        didSet { updateCode() }
    }

    @Published var extraLabelText: String {
        didSet { updateCode() }
    }

    // MARK: - Initializer

    // NOTE: "unused" false-positive for periphery (https://github.com/peripheryapp/periphery/issues/957)
    init(componentInitCode: String,
         outlinedConfiguration: OutlinedConfiguration? = nil,
         extraLabelConfiguration: ExtraLabelConfiguration? = nil)
    {
        self.componentInitCode = componentInitCode
        isError = false
        isReadOnly = false
        enabled = true
        icon = true
        flipIcon = false
        isReversed = false
        hasDivider = false
        constrainedMaxWidth = false
        labelText = String(localized: "app_components_common_label_label")
        descriptionText = String(localized: "app_components_controlItem_description_label")
        errorText = String(localized: "app_components_common_errorMessage_label")
        self.outlinedConfiguration = outlinedConfiguration
        self.extraLabelConfiguration = extraLabelConfiguration
        outlined = outlinedConfiguration?.value ?? false
        extraLabelText = extraLabelConfiguration ?? ""
        super.init()
    }

    deinit {}

    // MARK: - Component Configuration

    // swiftlint:disable line_length
    override func updateCode() {
        code =
            """
            \(componentInitCode), label: "\(labelText)"\(extraLabelTextPattern)\(descriptionTextPattern)\(iconPattern)\(flipIconPattern)\(outlinedPattern)\(isReversedPattern)\(isErrorPattern)\(errorTextPattern)\(isReadOnlyPattern)\(hasDividerPattern)\(constrainedMaxWidthPattern))
            \(disableCodePattern)
            """
    }

    // swiftlint:enable line_length

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var descriptionTextPattern: String {
        descriptionText.isEmpty ? "" : ", description: \"\(descriptionText)\""
    }

    private var iconPattern: String {
        icon ? ", icon: \(Image.defaultImageSample())" : ""
    }

    private var flipIconPattern: String {
        !isError && flipIcon ? ", flipIcon: true" : ""
    }

    private var isReversedPattern: String {
        isReversed ? ", isReversed: true" : ""
    }

    private var isErrorPattern: String {
        isError ? ", isError: true" : ""
    }

    private var errorTextPattern: String {
        isError && !errorText.isEmpty ? ", errorText: \"\(errorText)\"" : ""
    }

    private var isReadOnlyPattern: String {
        isReadOnly ? ", isReadOnly: true" : ""
    }

    private var hasDividerPattern: String {
        hasDivider ? ", hasDivider: true" : ""
    }

    private var constrainedMaxWidthPattern: String {
        constrainedMaxWidth ? ", constrainedMaxWidth: true" : ""
    }

    private var extraLabelTextPattern: String {
        !extraLabelText.isEmpty ? ", extraLabel: \"\(extraLabelText)\"" : ""
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

final class IndicatorControlItemConfigurationModel: ControlItemConfigurationModel {
    @Published var selection: OUDSCheckboxIndicatorState = .indeterminate

    deinit {}
}
