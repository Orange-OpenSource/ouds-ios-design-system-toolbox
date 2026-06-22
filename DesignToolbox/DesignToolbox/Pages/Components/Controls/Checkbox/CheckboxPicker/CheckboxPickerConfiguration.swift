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

// MARK: - Checkbox Picker Configuration Model

/// The model shared between `CheckboxPickerConfiguration` view and `CheckboxPickerPage` view.
final class CheckboxPickerConfigurationModel: ComponentConfiguration {

    // MARK: - Properties

    @Published var pickerPlacement: OUDSCheckboxPickerPlacement {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
        didSet { updateCode() }
    }

    @Published var isReadOnly: Bool {
        didSet { updateCode() }
    }

    @Published var isError: Bool {
        didSet { updateCode() }
    }

    @Published var isReversed: Bool {
        didSet { updateCode() }
    }

    @Published var rawImages: Bool {
        didSet { updateCode() }
    }

    @Published var isEnabled: Bool {
        didSet { updateCode() }
    }

    // MARK: - Initializer

    override init() {
        pickerPlacement = .verticalRooted("app_components_checkboxPicker_root".localized(), .textAndCount)
        hasDivider = false
        isReadOnly = false
        isError = false
        isReversed = false
        rawImages = false
        isEnabled = true
        super.init()
    }

    deinit {}

    // MARK: - Component Configuration

    // swiftlint:disable line_length
    override func updateCode() {
        code =
            """
            OUDSCheckboxPicker(selections: $selections, checkboxes: someCheckboxData, placement: \(pickerPlacementPattern)\(hasDividerPattern)\(isReadOnlyPattern)\(isErrorPattern)\(isReversedPattern))\(isEnabledPattern)
            """
    }

    // swiftlint:enable line_length

    private var pickerPlacementPattern: String {
        switch pickerPlacement {
        case .vertical:
            ".vertical"
        case let .horizontal(showsIndicator) where showsIndicator == true:
            ".horizontal(true)"
        case let .horizontal(showsIndicator) where showsIndicator == false:
            ".horizontal(false)"
        case let .verticalRooted(_, type):
            ".verticalRooted(label, .\(type))"
        default:
            "🥜"
        }
    }

    private var hasDividerPattern: String {
        !hasDivider ? "" : ", hasDivider: true"
    }

    private var isReadOnlyPattern: String {
        !isReadOnly ? "" : ", isReadOnly: true"
    }

    private var isErrorPattern: String {
        !isError ? "" : ", isError: true"
    }

    private var isReversedPattern: String {
        !isReversed ? "" : ", isReversed: true"
    }

    private var isEnabledPattern: String {
        isEnabled ? "" : ".disabled(true)"
    }

    // MARK: - Data populating

    func populate() -> [OUDSCheckboxPickerData<String>] {
        [
            OUDSCheckboxPickerData<String>(tag: "Choice_1",
                                           label: "Virgin Holy Lava",
                                           description: "No alcohol, only tasty flavors",
                                           icon: rawImages ? Image.placeholderImage() : Image(systemName: "flame"),
                                           renderingMode: rawImages ? .original : .template,
                                           accessibilityIdentifier: "Virgin Holy Lava"),

            OUDSCheckboxPickerData<String>(tag: "Choice_2",
                                           label: "IPA beer",
                                           description: "From Brewdog company",
                                           icon: rawImages ? Image.placeholderImage() : Image(systemName: "dog.fill"),
                                           renderingMode: rawImages ? .original : .template,
                                           accessibilityIdentifier: "IPA beer"),

            OUDSCheckboxPickerData<String>(tag: "Choice_3",
                                           label: "Mineral water",
                                           icon: rawImages ? Image.placeholderImage() : Image(systemName: "waterbottle.fill"),
                                           renderingMode: rawImages ? .original : .template,
                                           accessibilityIdentifier: "Mineral water"),
        ]
    }
}

// MARK: - Checkbox Picker Configuration View

struct CheckboxPickerConfiguration: View {

    @ObservedObject var configurationModel: CheckboxPickerConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.isEnabled)
                .disabled(configurationModel.isError || configurationModel.isReadOnly)

            OUDSSwitchItem("app_components_common_error_tech", isOn: $configurationModel.isError)
                .disabled(!configurationModel.isEnabled || configurationModel.isReadOnly)

            OUDSSwitchItem("app_components_common_readOnly_tech", isOn: $configurationModel.isReadOnly)
                .disabled(!configurationModel.isEnabled || configurationModel.isError)

            OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

            OUDSSwitchItem("app_components_common_rawImage_tech", isOn: $configurationModel.rawImages)

            OUDSChipPicker(title: "app_components_common_orientation_tech",
                           selection: $configurationModel.pickerPlacement,
                           chips: OUDSCheckboxPickerPlacement.chips)
        }
    }
}

// MARK: - Extension of OUDS Checkbox Picker Placement

extension OUDSCheckboxPickerPlacement: @retroactive CaseIterable, @retroactive Equatable, @retroactive Hashable, DesignToolboxEnumLocalizedRepresentable {

    // MARK: Case Iterable

    public static var allCases: [OUDSCheckboxPickerPlacement] {
        [
            .vertical,
            .verticalRooted("app_components_checkboxPicker_root".localized(), .textOnly),
            .verticalRooted("app_components_checkboxPicker_root".localized(), .textAndPositiveCount),
            .verticalRooted("app_components_checkboxPicker_root".localized(), .textAndCount),
            .horizontal(true),
            .horizontal(false),
        ]
    }

    var id: String {
        wordingKey
    }

    // MARK: Custom String Convertible

    var wordingKey: String {
        switch self {
        case let .horizontal(showIndicator) where showIndicator == true:
            "Horizontal with indicator"
        case let .horizontal(showIndicator) where showIndicator == false:
            "Horizontal without indicator"
        case .vertical:
            "Vertical without root"
        case let .verticalRooted(_, type):
            "Vertical with root item (\(type))"
        default:
            "🥜"
        }
    }

    // MARK: Equatable

    public static func == (lhs: OUDSCheckboxPickerPlacement, rhs: OUDSCheckboxPickerPlacement) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
