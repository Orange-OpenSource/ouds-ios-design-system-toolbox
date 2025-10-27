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

// MARK: - Input Tag Configuration Model

/// The model shared between `InputTagPageConfiguration` view and `InputTagPageComponent` view.
final class InputTagConfigurationModel: ComponentConfiguration {

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var label: String {
        didSet { updateCode() }
    }

    override init() {
        enabled = true
        label = String(localized: "app_components_common_label_label")
    }

    deinit {}

    override func updateCode() {
        code = """
        OUDSInputTag(label: \"\(label)\") {}
        \(disabledPattern)
        """
    }

    private var disabledPattern: String {
        enabled ? "" : ".disabled(true)"
    }
}

// MARK: - InputTag Configuration View

struct InputTagConfigurationView: View {

    @StateObject var configurationModel: InputTagConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_label")
            }
        }
    }
}
