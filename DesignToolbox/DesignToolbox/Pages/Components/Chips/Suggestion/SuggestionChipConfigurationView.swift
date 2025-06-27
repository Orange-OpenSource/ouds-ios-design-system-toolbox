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
<<<<<<< HEAD
        text = "app_components_chip_suggestionChip_chipContent_label".localized()
=======
        text = "app_components_chip_suggestionChip_suggestionChip_label".localized(with: 1)
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
        layout = .textOnly
    }

    deinit {}

    // MARK: Component Configuration

<<<<<<< HEAD
    private var disabledCode: String {
=======
    private var disableCode: String {
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
        !enabled ? ".disabled(true)" : ""
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
<<<<<<< HEAD
                OUDSSuggestionChip(text: \"\(text)\") {}
                \(disabledCode)
=======
                OUDSChip(text: \"Chip\") {}
                \(disableCode)
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
                """
        case .iconOnly:
            code =
                """
<<<<<<< HEAD
                OUDSSuggestionChip(icon: Image(\"ic_heart\"), accessibilityLabel: \"Some label\") {}
                \(disabledCode)
                """
        case .textAndIcon:
            code =
                """
                OUDSSuggestionChip(icon: Image(\"ic_heart\", text: \"\(text)\")) {}
                \(disabledCode)
=======
                OUDSChip(icon: Image(\"ic_heart\")) {}
                \(disableCode)
                """
        case .iconAndText:
            code =
                """
                OUDSChip(icon: Image(\"ic_heart\", text: \"Chip\")) {}
                \(disableCode)
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
                """
        }
    }
}

<<<<<<< HEAD
=======
// MARK: - Chip Layout

enum ChipLayout: CaseIterable, CustomStringConvertible {
    case textOnly
    case iconAndText
    case iconOnly

    var description: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_label"
        case .iconAndText:
            "app_components_common_iconAndTextLayout_label"
        case .iconOnly:
            "app_components_common_iconOnlyLayout_label"
        }
    }

    var id: String { description }
}

>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
// MARK: - SuggestionChip Configuration View

struct SuggestionChipConfigurationView: View {

    @StateObject var configurationModel: SuggestionChipConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
<<<<<<< HEAD
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
=======
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMedium) {
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
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

<<<<<<< HEAD
            if configurationModel.layout == .textAndIcon || configurationModel.layout == .textOnly {
=======
            if configurationModel.layout == .iconAndText || configurationModel.layout == .textOnly {
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text)
                }
            }
        }
    }
}
