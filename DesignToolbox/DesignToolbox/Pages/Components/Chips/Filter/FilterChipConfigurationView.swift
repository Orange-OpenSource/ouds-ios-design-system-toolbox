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

    @Published var selection: Bool {
        didSet { updateCode() }
    }

    @Published var text: String

    @Published var layout: ChipLayout {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        selection = false
        text = "app_components_chip_filterChip_chipContent_label".localized(with: 1)
        layout = .textOnly
    }

    deinit {}

    // MARK: Component Configuration

    private var disableCode: String {
        !enabled ? ".disabled(true)" : ""
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                OUDSFilterChip(text: \"Chip\", selected: \(selection)) {}
                \(disableCode)
                """
        case .iconOnly:
            code =
                """
                OUDSFilterChip(icon: Image(\"ic_heart\"), selected: \(selection)) {}
                \(disableCode)
                """
        case .textAndIcon:
            code =
                """
                OUDSFilterChip(icon: Image(\"ic_heart\", text: \"Chip\"), selected: \(selection)) {}
                \(disableCode)
                """
        }
    }
}

// MARK: - FilterChip Configuration View

struct FilterChipConfigurationView: View {

    @StateObject var configurationModel: FilterChipConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)

                OUDSSwitchItem("app_components_common_selection_label", isOn: $configurationModel.selection)
                    .disabled(!configurationModel.enabled)
            }

            DesignToolboxChoicePicker(title: "app_components_common_layout_label",
                                      selection: $configurationModel.layout,
                                      style: .segmented)
            {
                ForEach(ChipLayout.allCases, id: \.id) { layout in
                    Text(LocalizedStringKey(layout.description)).tag(layout)
                }
            }

            if configurationModel.layout == .textAndIcon || configurationModel.layout == .textOnly {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text)
                }
            }
        }
    }
}
