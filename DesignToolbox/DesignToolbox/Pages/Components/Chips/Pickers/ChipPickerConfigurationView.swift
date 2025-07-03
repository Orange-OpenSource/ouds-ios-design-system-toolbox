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

// MARK: - ChipPicker Configuration Model

/// The model shared between `ChipPickerPageConfiguration` view and `ChipPickerPageComponent` view.
final class ChipPickerConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var layout: ChipLayout {
        didSet { updateCode() }
    }

    @Published var selected: Drink

    enum Drink: String, CaseIterable {
        case virginHolyLava
        case ipaBeer
        case mineralWater

        var text: String {
            switch self {
            case .virginHolyLava:
                "Virgin Holy Lava"
            case .ipaBeer:
                "IPA beer"
            case .mineralWater:
                "Mineral water"
            }
        }

        var icon: Image {
            switch self {
            case .virginHolyLava:
                Image(systemName: "flame")
            case .ipaBeer:
                Image(systemName: "dog.fill")
            case .mineralWater:
                Image(systemName: "waterbottle.fill")
            }
        }
    }

    // MARK: - Data populating

    func dinks() -> [OUDSChipPickerData<Drink>] {
        Drink.allCases.map { drink in
            switch layout {
            case .textOnly:
                .init(tag: drink, layout: .text(text: drink.text))
            case .textAndIcon:
                .init(tag: drink, layout: .textAndIcon(text: drink.text, icon: drink.icon))
            case .iconOnly:
                .init(tag: drink, layout: .icon(icon: drink.icon, accessibilityLabel: drink.text))
            }
        }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        selected = .mineralWater
        layout = .textAndIcon
    }

    deinit {}

    // MARK: Component Configuration

    private var disableCode: String {
        !enabled ? ".disabled(true)" : ""
    }

    override func updateCode() {
        code = """
        OUDSChipPicker(title: "The title", selection: $selection, chips: someChipsDate)
        \(disableCode)
        """
    }
}

// MARK: - ChipPicker Configuration View

struct ChipPickerConfigurationView: View {

    @StateObject var configurationModel: ChipPickerConfigurationModel

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
        }
    }
}
