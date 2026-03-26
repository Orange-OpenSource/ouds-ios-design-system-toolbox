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

// MARK: - Inline Alert Configuration Model

/// The model shared between `InlineAlertConfigurationView` view and `InlineAlertDemo` view.
final class InlineAlertConfigurationModel: AlertConfigurationModel {

    // MARK: Initializer

    override init() {
        super.init()
        status = .neutral
        statusIcon = true
        flipIcon = false
    }

    deinit {}

    // MARK: Component Code snippet

    override func updateCode() {
        code =
            """
            OUDSInlineAlert(label: \"\(text)\"\(statusPattern))
            """
    }
}

// MARK: - Inline Alert Configuration View

struct InlineAlertConfigurationView: View {

    // MARK: Properties

    @StateObject var configurationModel: InlineAlertConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: AlertStatus.chips)

                OUDSSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                    .disabled(!configurationModel.enableFlipIcon)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}
