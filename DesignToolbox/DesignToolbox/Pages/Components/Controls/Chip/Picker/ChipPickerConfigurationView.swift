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

    @Published var titleText: String {
        didSet { updateCode() }
    }

    /// The type of selection
    enum SelectionType: String, CaseIterable {
        /// Single selection with tag of the selected chip, or none
        case singleOrNone

        /// Single selection with tag of the selected chip
        case single

        /// Multiple selection with tags of the selected chips
        case multiple

        /// The technical description
        var description: String {
            rawValue.camelCase
        }

        private var chipData: OUDSChipPickerData<Self> {
            OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
        }

        static var chips: [OUDSChipPickerData<Self>] {
            allCases.map(\.chipData)
        }
    }

    @Published var selectionType: SelectionType {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        optionalSelectedDrink = nil
        selectedDrink = .virginHolyLava
        selectedDrinks = [.virginHolyLava]
        layout = .textAndIcon
        titleText = "Select a drink"
        selectionType = .single
    }

    deinit {}

    // MARK: Component Configuration

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var selectedValuePattern: String {
        switch selectionType {
        case .singleOrNone:
            "@State var selection: Tag?"
        case .single:
            "@State var selection: Tag"
        case .multiple:
            "@State var selections: [Tag]"
        }
    }

    private var selectionTypePattern: String {
        switch selectionType {
        case .singleOrNone:
            "selection: $selection"
        case .single:
            "selection: $selection"
        case .multiple:
            "selections: $selections"
        }
    }

    override func updateCode() {
        code = """
        \(selectedValuePattern)
        OUDSChipPicker(title: \"\(titleText)\", \(selectionTypePattern), chips: someChipsData)
        \(disableCodePattern)
        """
    }

    // MARK: - Data populating

    @Published var optionalSelectedDrink: Drink?
    @Published var selectedDrink: Drink
    @Published var selectedDrinks: [Drink]

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

    func drinks() -> [OUDSChipPickerData<Drink>] {
        Drink.allCases.map { drink in
            switch layout {
            case .textOnly:
                .init(tag: drink, layout: .text(text: drink.text), accessibilityIdentifier: drink.text)
            case .textAndIcon:
                .init(tag: drink, layout: .textAndIcon(text: drink.text, icon: drink.icon), accessibilityIdentifier: drink.text)
            case .iconOnly:
                .init(tag: drink, layout: .icon(icon: drink.icon, accessibilityLabel: drink.text), accessibilityIdentifier: drink.text)
            }
        }
    }
}

// MARK: - ChipPicker Configuration View

struct ChipPickerConfigurationView: View {

    @StateObject var configurationModel: ChipPickerConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)

                OUDSChipPicker(title: "app_components_common_layout_label",
                               selection: $configurationModel.layout,
                               chips: ChipLayout.chips)

                OUDSChipPicker(title: "app_components_chipPicker_selectionType_label",
                               selection: $configurationModel.selectionType,
                               chips: ChipPickerConfigurationModel.SelectionType.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.titleText, label: "app_components_common_label_label")
            }
        }
    }
}
