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

// MARK: - TextInput Configuration Model

/// The model shared between `TextInputPageConfiguration` view and `TextInputPageComponent` view.
final class TextInputConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var text: String

    @Published var rounded: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = String(localized: "app_components_common_label_label")
        rounded = false
    }

    deinit {}

    // MARK: Component Configuration

    private var roundedCodePattern: String {
        rounded ? ".environment(\\.oudsRoundedTextInput, true)" : ""
    }

    private var disableCodePattern: String {
        enabled ? "" : ".disabled(true)"
    }

    override func updateCode() {
        code =
            """
            OUDSTextInput()
            \(disableCodePattern)
            """
    }
}

// MARK: - TextInput Configuration View

struct TextInputConfigurationView: View {

    @StateObject var configurationModel: TextInputConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)

                OUDSSwitchItem("app_components_common_rounded_label", isOn: $configurationModel.rounded)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text)
                }
            }
        }
    }
}
