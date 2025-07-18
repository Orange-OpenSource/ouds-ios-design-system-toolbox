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

// MARK: - Button Configuration Model

/// The model shared between `ButtonPageConfiguration` view and `ButtonPageComponent` view.
final class ButtonConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var text: String

    @Published var layout: ButtonLayout {
        didSet { updateCode() }
    }

    @Published var hierarchy: OUDSButton.Hierarchy {
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
        hierarchy = .default
        style = .default
    }

    deinit {}

    // MARK: Component Configuration

    private var disableCode: String {
        if case .default = style {
            ".disabled(\(enabled ? "false" : "true"))"
        } else {
            ""
        }
    }

    private var coloredSurfaceCodeModifier: String {
        onColoredSurface ? ".oudsColoredSurface(theme.colorModes.modeOnBrandPrimary)" : ""
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                OUDSButton(text: \"Button\", hierarchy: .\(hierarchy.description.lowercased()), style: .\(style.description.lowercased())) {}
                \(disableCode)
                \(coloredSurfaceCodeModifier)
                """
        case .iconOnly:
            code =
                """
                OUDSButton(icon: Image(\"ic_heart\"), hierarchy: .\(hierarchy.description.lowercased()), style: .\(style.description.lowercased())) {}
                \(disableCode)
                \(coloredSurfaceCodeModifier)
                """
        case .textAndIcon:
            code =
                """
                OUDSButton(icon: Image(\"ic_heart\", text: \"Button\"), hierarchy: .\(hierarchy.description.lowercased()), style: .\(style.description.lowercased())) {}
                \(disableCode)
                \(coloredSurfaceCodeModifier)
                """
        }
    }
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

    var id: String { description }
}

// MARK: Button style extension

extension OUDSButton.Style: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSButton.Style] = [.default, .loading]

    public var description: String {
        switch self {
        case .default:
            "Default"
        case .loading:
            "Loading"
        }
    }

    var id: String { description }
}

// MARK: Button hierarchy extension

extension OUDSButton.Hierarchy: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    public nonisolated(unsafe) static let allCases: [OUDSButton.Hierarchy] = [.default, .strong, .minimal, .negative]

    // Note: Not localized because it is a technical name
    public var description: String {
        switch self {
        case .default:
            "Default"
        case .strong:
            "Strong"
        case .minimal:
            "Minimal"
        case .negative:
            "Negative"
        }
    }

    var id: String { description }
}

// MARK: - Button Configuration View

struct ButtonConfigurationView: View {

    @StateObject var configurationModel: ButtonConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
                    .disabled(configurationModel.style != .default)

                OUDSSwitchItem("app_components_common_onColoredSurface_label", isOn: $configurationModel.onColoredSurface)
            }

            DesignToolboxChoicePicker(title: "app_components_button_hierarchy_label",
                                      selection: $configurationModel.hierarchy,
                                      style: .segmented)
            {
                ForEach(OUDSButton.Hierarchy.allCases, id: \.id) { hierarchy in
                    Text(LocalizedStringKey(hierarchy.description)).tag(hierarchy)
                }
            }

            DesignToolboxChoicePicker(title: "app_components_common_style_label",
                                      selection: $configurationModel.style,
                                      style: .segmented)
            {
                ForEach(OUDSButton.Style.allCases, id: \.id) { style in
                    Text(LocalizedStringKey(style.description)).tag(style)
                }
            }

            DesignToolboxChoicePicker(title: "app_components_common_layout_label",
                                      selection: $configurationModel.layout,
                                      style: .segmented)
            {
                ForEach(ButtonLayout.allCases, id: \.id) { layout in
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
