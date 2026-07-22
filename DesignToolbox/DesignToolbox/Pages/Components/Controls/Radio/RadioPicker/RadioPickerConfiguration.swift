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


#if !os(tvOS)

import OUDSSwiftUI
import SwiftUI

// MARK: - Radio Picker Configuration Model

/// The model shared between `RadioPickerConfiguration` view and `RadioPickerPage` view.
final class RadioPickerConfigurationModel: ComponentConfiguration {

    // MARK: - Properties

    @Published var pickerPlacement: OUDSRadioPickerPlacement {
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

    @Published var isOutlined: Bool {
        didSet { updateCode() }
    }

    @Published var isEnabled: Bool {
        didSet { updateCode() }
    }

    // MARK: - Initializer

    override init() {
        pickerPlacement = .vertical
        hasDivider = false
        isReadOnly = false
        isError = false
        isReversed = false
        isOutlined = false
        isEnabled = true
        super.init()
    }

    deinit {}

    // MARK: - Component Configuration

    // swiftlint:disable line_length
    override func updateCode() {
        code =
            """
            OUDSRadioPicker(selection: $selection, radios: someRadiosData, placement: \(pickerPlacementPattern)\(hasDividerPattern)\(isReadOnlyPattern)\(isErrorPattern)\(isReversedPattern)\(isOutlinedPattern))\(isEnabledPattern)
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

    private var isOutlinedPattern: String {
        !isOutlined ? "" : ", isOutlined: true"
    }

    private var isEnabledPattern: String {
        isEnabled ? "" : ".disabled(true)"
    }

    // MARK: - Data populating

    @MainActor func populate() -> [OUDSRadioPickerData<String>] {
        [
            OUDSRadioPickerData<String>(tag: "Choice_1",
                                        label: "Virgin Holy Lava",
                                        extraLabel: "Very spicy",
                                        description: "No alcohol, only tasty flavors",
                                        image: OUDSImage(asset: Image(systemName: "flame")),
                                        accessibilityIdentifier: "Virgin Holy Lava"),

            OUDSRadioPickerData<String>(tag: "Choice_2",
                                        label: "IPA beer",
                                        extraLabel: "From Brewdog company",
                                        image: OUDSImage(asset: Image(systemName: "dog.fill")),
                                        accessibilityIdentifier: "IPA beer"),

            OUDSRadioPickerData<String>(tag: "Choice_3",
                                        label: "Mineral water",
                                        image: OUDSImage(asset: Image(systemName: "waterbottle.fill")),
                                        accessibilityIdentifier: "Mineral water"),
        ]
    }
}

// MARK: - Radio Picker Configuration View

struct RadioPickerConfiguration: View {

    @ObservedObject var configurationModel: RadioPickerConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.isEnabled)
                .disabled(configurationModel.isError || configurationModel.isReadOnly)

            OUDSSwitchItem("app_components_common_readOnly_tech", isOn: $configurationModel.isReadOnly)
                .disabled(!configurationModel.isEnabled || configurationModel.isError)

            OUDSSwitchItem("app_components_common_error_tech", isOn: $configurationModel.isError)
                .disabled(!configurationModel.isEnabled || configurationModel.isReadOnly)

            OUDSSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)

            OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

            OUDSChipPicker(title: "app_components_common_orientation_tech",
                           selection: $configurationModel.pickerPlacement,
                           chips: OUDSRadioPickerPlacement.chips)
        }
    }
}

// MARK: - Extension of OUDSRadioPickerPlacement

extension OUDSRadioPickerPlacement: @retroactive Equatable, @retroactive CaseIterable, @retroactive Hashable, DesignToolboxEnumLocalizedRepresentable {

    // MARK: Case Iterable

    public static var allCases: [OUDSRadioPickerPlacement] {
        [.vertical, .horizontal(true), .horizontal(false)]
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
            "Vertical"
        default:
            "🥜"
        }
    }

    // MARK: Equatable

    public static func == (lhs: OUDSRadioPickerPlacement, rhs: OUDSRadioPickerPlacement) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

#endif
