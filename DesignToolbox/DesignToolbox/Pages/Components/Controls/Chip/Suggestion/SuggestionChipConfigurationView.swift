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

import OUDSSwiftUI
import SwiftUI

// MARK: - SuggestionChip Configuration Model

/// The model shared between `SuggestionChipPageConfiguration` view and `SuggestionChipPageComponent` view.
final class SuggestionChipConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var layout: ChipLayout {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = "app_components_chip_suggestionChip_chipContent_label".localized()
        layout = .textOnly
    }

    deinit {}

    // MARK: Component Configuration

    private var disabledCode: String {
        !enabled ? ".disabled(true)" : ""
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                OUDSSuggestionChip(text: \"\(text)\") {}
                \(disabledCode)
                """
        case .iconOnly:
            code =
                """
                OUDSSuggestionChip(icon: Image(\"ic_heart\"), accessibilityLabel: \"Some label\") {}
                \(disabledCode)
                """
        case .textAndIcon:
            code =
                """
                OUDSSuggestionChip(icon: Image(\"ic_heart\", text: \"\(text)\")) {}
                \(disabledCode)
                """
        }
    }
}

// MARK: - SuggestionChip Configuration View

struct SuggestionChipConfigurationView: View {

    @StateObject var configurationModel: SuggestionChipConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)

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
