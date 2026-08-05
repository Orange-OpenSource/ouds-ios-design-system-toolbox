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

    @Published var rawImage: Bool {
        didSet { updateCode() }
    }

    @Published var appearance: OUDSButton.Appearance {
        didSet { updateCode() }
    }

    @Published var style: OUDSButton.Style {
        didSet { updateCode() }
    }

    @Published var size: OUDSButton.Size {
        didSet { updateCode() }
    }

    @Published var isFullWidth: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = String(localized: "app_components_common_label_label")
        layout = .textOnly
        flipIcon = false
        rawImage = false
        appearance = .default
        style = .default
        size = .default
        isFullWidth = false
        super.init()
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

    private var layoutPattern: String {
        let imageModePattern = (rawImage ? ", renderingMode: .original" : "")
        let imageNamePattern = (rawImage ? Image.placeholderImageSample() : Image.defaultImageSample())
        return switch layout {
        case .textOnly:
            "text: \"\(text)\""
        case .iconOnly:
            "image: OUDSImage(asset: \(imageNamePattern)\(flipIconPattern), accessibilityLabel: \"\(accessibilityLabelValue)\", \(imageModePattern))"
        case .textAndIcon:
            "text: \"\(text)\", image: OUDSImage(asset: \(imageNamePattern)\(flipIconPattern)\(imageModePattern))"
        }
    }

    private var appearancePattern: String {
        ", appearance: \(appearance.technicalDescription)"
    }

    private var stylePattern: String {
        ", style: \(style.technicalDescription)"
    }

    private var sizePattern: String {
        ", size: \(size.technicalDescription)"
    }

    private var coloredSurfaceCodeModifier: String {
        onColoredSurface ? ".coloredSurface(theme.colorModes.onBrandPrimary)" : ""
    }

    private var flipIconPattern: String {
        flipIcon ? ", flipped: true" : ""
    }

    private var isFullWidthPattern: String {
        isFullWidth ? ", isFullWidth: true" : ""
    }

    private var accessibilityLabelValue: String {
        "app_components_common_icon_a11y".localized()
    }

    override func updateCode() {
        code =
            """
            OUDSButton(\(layoutPattern)\(appearancePattern)\(stylePattern)\(sizePattern)\(isFullWidthPattern)) {}
            \(disableCodePattern)
            \(coloredSurfaceCodeModifier)
            """
    }
}

// MARK: - Button Layout

enum ButtonLayout: DesignToolboxEnumLocalizedRepresentable {
    case textOnly, textAndIcon, iconOnly

    var wordingKey: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_tech"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_tech"
        case .iconOnly:
            "app_components_common_iconOnlyLayout_tech"
        }
    }
}

// MARK: Button style extension

extension OUDSButton.Style: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSButton.Style] = [.default, .loading]
}

// MARK: Button size extension

extension OUDSButton.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSButton.Size] = [.default, .small]
}

// MARK: Button appearance extension

extension OUDSButton.Appearance: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSButton.Appearance] = [.default, .strong, .brand, .minimal, .negative]
}

// MARK: - Button Configuration View

struct ButtonConfigurationView: View {

    @StateObject var configurationModel: ButtonConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                    .disabled(configurationModel.style != .default)

                OUDSSwitchItem("app_components_common_onColoredSurface_tech", isOn: $configurationModel.onColoredSurface)

                OUDSChipPicker(title: "app_components_common_appearance_tech",
                               selection: $configurationModel.appearance,
                               chips: OUDSButton.Appearance.chips)

                OUDSChipPicker(title: "app_components_common_style_tech",
                               selection: $configurationModel.style,
                               chips: OUDSButton.Style.chips)

                OUDSChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: OUDSButton.Size.chips)

                OUDSChipPicker(title: "app_components_common_layout_tech",
                               selection: $configurationModel.layout,
                               chips: ButtonLayout.chips)

                OUDSSwitchItem("app_components_button_fullWidth_tech", isOn: $configurationModel.isFullWidth)

                OUDSSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                    .disabled(!(configurationModel.layout == .iconOnly || configurationModel.layout == .textAndIcon))

                OUDSSwitchItem("app_components_common_rawImage_tech", isOn: $configurationModel.rawImage)
                    .disabled(!(configurationModel.layout == .iconOnly || configurationModel.layout == .textAndIcon))
            }

            if configurationModel.layout == .textAndIcon || configurationModel.layout == .textOnly {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                }
            }
        }
    }
}
