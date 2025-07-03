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

// MARK: - SuggestionChip Configuration Model

/// The model shared between `SuggestionChipPageConfiguration` view and `SuggestionChipPageComponent` view.
final class SuggestionChipConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var text: String

    @Published var layout: ChipLayout {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = "app_components_chip_suggestionChip_suggestionChip_label".localized()
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
                OUDSChip(text: \"Chip\") {}
                \(disableCode)
                """
        case .iconOnly:
            code =
                """
                OUDSChip(icon: Image(\"ic_heart\")) {}
                \(disableCode)
                """
        case .textAndIcon:
            code =
                """
                OUDSChip(icon: Image(\"ic_heart\", text: \"Chip\")) {}
                \(disableCode)
                """
        }
    }
}

// MARK: - SuggestionChip Configuration View

struct SuggestionChipConfigurationView: View {

    @StateObject var configurationModel: SuggestionChipConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
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
