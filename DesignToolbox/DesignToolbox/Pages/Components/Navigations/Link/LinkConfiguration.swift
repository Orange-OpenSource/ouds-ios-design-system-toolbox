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

// MARK: - Link Configuration Model

/// The model shared between `LinkPageConfiguration` view and `LinkPageComponent` view.
final class LinkConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool = true {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var layout: LinkLayout {
        didSet { updateCode() }
    }

    @Published var size: OUDSLink.Size {
        didSet { updateCode() }
    }

    @Published var iconType: DefinedStatusIcons {
        didSet { updateCode() }
    }

    @Published var isFullWidth: Bool = false {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = String(localized: "app_components_link_tech")
        layout = .textOnly
        size = .default
        iconType = .tintedIcon
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var coloredSurfaceCodeModifierPattern: String {
        onColoredSurface ? ".coloredSurface(theme.colorModes.onBrandPrimary)" : ""
    }

    private var iconAssetSample: String {
        iconType == .tintedIcon ? "Image(\"ic_heart\")" : "Image(decorative: \"il_placeholder\")"
    }

    private var renderingModeCode: String {
        iconType == .image ? ", renderingMode: .original" : ""
    }

    private var disableCodePattern: String {
        enabled ? "" : ".disabled(true)"
    }

    private var isFullWidthPattern: String {
        isFullWidth ? ", isFullWidth: true" : ""
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                OUDSLink(text: \"\(text)\", size: \(size.technicalDescription)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        case .textAndIcon:
            code =
                """
                OUDSLink(text: \"\(text)\", image: OUDSImage(asset: \(iconAssetSample)\(renderingModeCode)), size: \(size.technicalDescription)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        case .indicatorNext:
            code =
                """
                OUDSLink(text: \"\(text)\", indicator: .next, size: \(size.technicalDescription)\(isFullWidthPattern)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        case .indicatorPrevious:
            code =
                """
                OUDSLink(text: \"\(text)\", indicator: .previous, size: \(size.technicalDescription)\(isFullWidthPattern)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        }
    }
}

// MARK: - Link Layout

enum LinkLayout: DesignToolboxEnumLocalizedRepresentable {
    case textOnly, textAndIcon, indicatorPrevious, indicatorNext

    var wordingKey: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_tech"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_tech"
        case .indicatorPrevious:
            "app_components_link_backLayout_tech"
        case .indicatorNext:
            "app_components_link_nextLayout_tech"
        }
    }
}

// MARK: Link size extension

extension OUDSLink.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSLink.Size] = [.default, .small]
}

// MARK: - Link Configuration View

struct LinkConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: LinkConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

                OUDSSwitchItem("app_components_common_onColoredSurface_tech", isOn: $configurationModel.onColoredSurface)

                OUDSChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: OUDSLink.Size.chips)

                OUDSChipPicker(title: "app_components_common_layout_tech",
                               selection: $configurationModel.layout,
                               chips: LinkLayout.chips)

                if configurationModel.layout == .textAndIcon {
                    OUDSChipPicker(title: "app_components_common_statusIcon_tech",
                                   selection: $configurationModel.iconType,
                                   chips: DefinedStatusIcons.chips)
                }

                if configurationModel.layout == .indicatorPrevious || configurationModel.layout == .indicatorNext {
                    OUDSSwitchItem("app_components_link_fullWidth_tech", isOn: $configurationModel.isFullWidth)
                }
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}
