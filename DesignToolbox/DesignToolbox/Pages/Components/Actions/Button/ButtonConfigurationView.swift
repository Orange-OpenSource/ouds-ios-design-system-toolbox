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

// MARK: - Button Configuration Model

/// The model shared between `ButtonPageConfiguration` view and `ButtonPageComponent` view.
final class ButtonConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var layout: ButtonLayout {
        didSet { updateCode() }
    }
    
    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var appearance: OUDSButton.Appearance {
        didSet { updateCode() }
    }

    @Published var style: OUDSButton.Style {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = String(localized: "app_components_button_label")
        layout = .textOnly
        flipIcon = false
        appearance = .default
        style = .default
    }

    deinit {}

    // MARK: Component Configuration

    private var disableCodePattern: String {
        if case .default = style {
            ".disabled(\(enabled ? "false" : "true"))"
        } else {
            ""
        }
    }

    private var coloredSurfaceCodeModifier: String {
        onColoredSurface ? ".oudsColoredSurface(theme.colorModes.onBrandPrimary)" : ""
    }

    // swiftlint:disable line_length
    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                OUDSButton(text: \"\(text)\", appearance: .\(appearance.description.lowercased()), style: .\(style.description.lowercased())) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifier)
                """
        case .iconOnly:
            code =
                """
                OUDSButton(icon: Image(\"ic_heart\"), accessibilityLabel: \"app_components_common_icon_a11y\", appearance: .\(appearance.description.lowercased()), style: .\(style.description.lowercased())) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifier)
                """
        case .textAndIcon:
            code =
                """
                OUDSButton(icon: Image(\"ic_heart\", text: \"\(text)\"), appearance: .\(appearance.description.lowercased()), style: .\(style.description.lowercased())) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifier)
                """
        }
    }
    // swiftlint:enable line_length
}

// MARK: - Button Layout

enum ButtonLayout: CaseIterable, CustomStringConvertible {
    case textOnly
    case textAndIcon
    case iconOnly

    var description: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_label"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_label"
        case .iconOnly:
            "app_components_common_iconOnlyLayout_label"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: Button style extension

extension OUDSButton.Style: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    nonisolated(unsafe) public static let allCases: [OUDSButton.Style] = [.default, .loading]

    public var description: String {
        switch self {
        case .default:
            "Default"
        case .loading:
            "Loading"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: Button appearance extension

extension OUDSButton.Appearance: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    nonisolated(unsafe) public static let allCases: [OUDSButton.Appearance] = [.default, .strong, .brand, .minimal, .negative]

    // Note: Not localized because it is a technical name
    public var description: String {
        switch self {
        case .default:
            "Default"
        case .strong:
            "Strong"
        case .brand:
            "Brand"
        case .minimal:
            "Minimal"
        case .negative:
            "Negative"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: - Button Configuration View

struct ButtonConfigurationView: View {

    @StateObject var configurationModel: ButtonConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
                    .disabled(configurationModel.style != .default)

                OUDSSwitchItem("app_components_common_onColoredSurface_label", isOn: $configurationModel.onColoredSurface)

                OUDSChipPicker(title: "app_components_common_appearance_label",
                               selection: $configurationModel.appearance,
                               chips: OUDSButton.Appearance.chips)

                OUDSChipPicker(title: "app_components_common_style_label",
                               selection: $configurationModel.style,
                               chips: OUDSButton.Style.chips)

                OUDSChipPicker(title: "app_components_common_layout_label",
                               selection: $configurationModel.layout,
                               chips: ButtonLayout.chips)
                
                OUDSSwitchItem("app_components_common_flipIcon_label", isOn: $configurationModel.flipIcon)
                    .disabled(!(configurationModel.layout == .iconOnly || configurationModel.layout == .textAndIcon))
            }

            if configurationModel.layout == .textAndIcon || configurationModel.layout == .textOnly {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_label")
                }
            }
        }
    }
}
