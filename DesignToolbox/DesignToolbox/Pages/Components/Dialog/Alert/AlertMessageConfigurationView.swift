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

// MARK: - AlertMessage Configuration Model

/// The model shared between `AlertMessagePageConfiguration` view and `AlertMessagePageComponent` view.
final class AlertMessageConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = String(localized: "app_components_button_label")
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var disableCodePattern: String {
        ".disabled(\(enabled ? "false" : "true"))"
    }


    override func updateCode() {
        code =
            """
            OUDSAlertMessage()
            """
    }
}


// MARK: - AlertMessage Configuration View

struct AlertMessageConfigurationView: View {

    @StateObject var configurationModel: AlertMessageConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
            }
            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_label")
            }   
        }
    }
}
