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

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var layout: ChipLayout {
        didSet { updateCode() }
    }

    @Published var iconType: DefinedStatusIcons {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        selected = false
        text = "app_components_chip_filterChip_chipContent_label".localized(with: 1)
        layout = .textOnly
        iconType = .tintedIcon
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var selectedCodePattern: String {
        selected ? ", selected: true" : ""
    }

    private var accessibilityLabelValue: String {
        "app_components_common_icon_a11y".localized()
    }

    private var iconAssetName: String {
        iconType == .tintedIcon ? "ic_heart" : "il_placeholder"
    }

    private var renderingModeCode: String {
        iconType == .image ? ", renderingMode: .original" : ""
    }

    // swiftlint:disable line_length
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
                OUDSFilterChip(image: OUDSImage(asset: Image(\"\(iconAssetName)\")\(renderingModeCode)), accessibilityLabel: \"\(accessibilityLabelValue)\"\(selectedCodePattern)) {}
                \(disableCodePattern)
                """
        case .textAndIcon:
            code =
                """
                OUDSFilterChip(image: OUDSImage(asset: Image(\"\(iconAssetName)\")\(renderingModeCode)), text: \"\(text)"\(selectedCodePattern)) {}
                \(disableCodePattern)
                """
        }
    }
    // swiftlint:enable line_length
}

// MARK: - FilterChip Configuration View

struct FilterChipConfigurationView: View {

    @StateObject var configurationModel: FilterChipConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

                OUDSSwitchItem("app_components_common_selection_tech", isOn: $configurationModel.selected)
                    .accessibilityIdentifier(A11YIdentifiers.configurationSwitchSelection)
                    .disabled(!configurationModel.enabled)

                OUDSChipPicker(title: "app_components_common_layout_tech",
                               selection: $configurationModel.layout,
                               chips: ChipLayout.chips)

                if configurationModel.layout != .textOnly {
                    OUDSChipPicker(title: "app_components_common_statusIcon_tech",
                                   selection: $configurationModel.iconType,
                                   chips: DefinedStatusIcons.chips)
                }
            }

            if configurationModel.layout == .textAndIcon || configurationModel.layout == .textOnly {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                }
            }
        }
    }
}
