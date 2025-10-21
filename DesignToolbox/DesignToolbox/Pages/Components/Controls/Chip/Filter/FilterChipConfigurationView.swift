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

// MARK: - FilterChip Configuration Model

/// The model shared between `FilterChipPageConfiguration` view and `FilterChipPageComponent` view.
final class FilterChipConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var selected: Bool {
        didSet { updateCode() }
    }

    @Published var text: String

    @Published var layout: ChipLayout {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        selected = false
        text = "app_components_chip_filterChip_chipContent_label".localized(with: 1)
        layout = .textOnly
    }

    deinit {}

    // MARK: Component Configuration

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var selectedCodePattern: String {
        selected ? ", selected: true" : ""
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                OUDSFilterChip(text: \"\(text)"\(selectedCodePattern)) {}
                \(disableCodePattern)
                """
        case .iconOnly:
            code =
                """
                OUDSFilterChip(icon: Image(\"ic_heart\"), accessibilityLabel: \"Some label\"\(selectedCodePattern)) {}
                \(disableCodePattern)
                """
        case .textAndIcon:
            code =
                """
                OUDSFilterChip(icon: Image(\"ic_heart\"), text: \"\(text)"\(selectedCodePattern)) {}
                \(disableCodePattern)
                """
        }
    }
}

// MARK: - FilterChip Configuration View

struct FilterChipConfigurationView: View {

    @StateObject var configurationModel: FilterChipConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)

                OUDSSwitchItem("app_components_common_selection_label", isOn: $configurationModel.selected)
                    .accessibilityIdentifier(A11YIdentifiers.configurationSwitchSelection)
                    .disabled(!configurationModel.enabled)

                OUDSChipPicker(title: "app_components_common_layout_label",
                               selection: $configurationModel.layout,
                               chips: ChipLayout.chips)
            }

            if configurationModel.layout == .textAndIcon || configurationModel.layout == .textOnly {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_label")
                }
            }
        }
    }
}
