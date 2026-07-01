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

// MARK: - Tag Configuration Model

/// The model shared between `TagPageConfiguration` view and `TagPageComponent` view.
final class TagConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var layout: TagLayout {
        didSet { updateCode() }
    }

    @Published var label: String {
        didSet { updateCode() }
    }

    @Published var size: OUDSTag.Size {
        didSet { updateCode() }
    }

    @Published var statusCategory: OUDSTag.Status.Category {
        didSet { updateCode() }
    }

    @Published var appearance: OUDSTag.Appearance {
        didSet { updateCode() }
    }

    @Published var shape: OUDSTag.Shape {
        didSet { updateCode() }
    }

    @Published var loader: Bool {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var iconType: DefinedStatusIcons {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        layout = .textOnly
        loader = false
        flipIcon = false
        iconType = .tintedIcon
        label = String(localized: "app_components_common_label_label")
        size = .default
        statusCategory = .neutral
        shape = .rounded
        appearance = .emphasized
        super.init()
    }

    deinit {}

    @MainActor func status(from theme: OUDSTheme) -> OUDSTag.Status {
        let asset: Image = iconType == .tintedIcon
            ? Image.defaultImage(prefixedBy: theme.name)
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = iconType == .tintedIcon ? .template : .original
        let iconImage = OUDSImage(asset: asset, flipped: flipIcon, renderingMode: renderingMode)

        return switch statusCategory {
        case .accent:
            switch layout.statusLeading {
            case .bullet:
                .accent(bullet: true)
            case .none:
                .accent(bullet: false)
            case .icon:
                .accent(icon: iconImage)
            }
        case .neutral:
            switch layout.statusLeading {
            case .bullet:
                .neutral(bullet: true)
            case .none:
                .neutral(bullet: false)
            case .icon:
                .neutral(icon: iconImage)
            }
        case .positive:
            .positive(leading: layout.statusLeading)
        case .warning:
            .warning(leading: layout.statusLeading)
        case .negative:
            .negative(leading: layout.statusLeading)
        case .info:
            .info(leading: layout.statusLeading)
        }
    }

    var enableFlipIcon: Bool {
        !loader && (layout == .textAndIcon && (statusCategory == .accent || statusCategory == .neutral))
    }

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSTag(label: \"\(label)\"\(statusPattern)\(appearancePattern)\(shapePattern)\(sizePattern)\(loaderPattern))
        \(disablePattern)
        """
    }

    private var disablePattern: String {
        !loader && !enabled ? ".disabled(true)" : ""
    }

    private var appearancePattern: String {
        ", appearance: \(appearance.technicalDescription)"
    }

    private var iconAssetSample: String {
        iconType == .tintedIcon ? Image.defaultImageSample() : "Image(decorative: \"il_placeholder\")"
    }

    private var renderingModeCode: String {
        iconType == .image ? ", renderingMode: .original" : ""
    }

    private var statusPattern: String {
        if statusCategory != .neutral, statusCategory != .accent {
            return ", status: \(statusCategory.technicalDescription)(leading: \(layout.statusLeading.technicalDescription))"
        } else {
            if layout == .textAndBullet {
                return ", status: \(statusCategory.technicalDescription)(bullet: true)"
            } else if layout == .textAndIcon {
                let flipIconPattern = flipIcon ? ", flipIcon: true" : ""
                return ", status: \(statusCategory.technicalDescription)(icon: \(iconAssetSample)\(flipIconPattern)\(renderingModeCode))"
            } else {
                return ", status: \(statusCategory.technicalDescription)()"
            }
        }
    }

    private var shapePattern: String {
        ", shape: \(shape.technicalDescription)"
    }

    private var sizePattern: String {
        ", size: \(size.technicalDescription)"
    }

    private var loaderPattern: String {
        loader ? ", hasLoader: true" : ""
    }
}

// MARK: - Tag Configuration View

struct TagConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: TagConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                .disabled(configurationModel.loader)

            OUDSSwitchItem("app_components_common_loader_tech", isOn: $configurationModel.loader)
                .disabled(!configurationModel.enabled)

            OUDSSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                .disabled(!configurationModel.enableFlipIcon)

            OUDSChipPicker(title: "app_components_common_layout_tech",
                           selection: $configurationModel.layout,
                           chips: TagLayout.chips)

            if configurationModel.layout == .textAndIcon,
               configurationModel.statusCategory == .neutral || configurationModel.statusCategory == .accent
            {
                OUDSChipPicker(title: "app_components_common_statusIcon_tech",
                               selection: $configurationModel.iconType,
                               chips: DefinedStatusIcons.chips)
            }

            OUDSChipPicker(title: "app_components_common_appearance_tech",
                           selection: $configurationModel.appearance,
                           chips: OUDSTag.Appearance.chips)

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.statusCategory,
                           chips: filteredStatusChips)

            OUDSChipPicker(title: "app_components_tag_shape_tech",
                           selection: $configurationModel.shape,
                           chips: OUDSTag.Shape.chips)

            OUDSChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.size,
                           chips: OUDSTag.Size.chips)

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")
            }
        }
    }

    private var filteredStatusChips: [OUDSChipPickerData<OUDSTag.Status.Category>] {
        OUDSTag.Status.Category.allCases.compactMap(\.chipData)
    }
}

extension OUDSTag.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSTag.Size] = [.default, .small]
}

extension OUDSTag.Status.Leading: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSTag.Status.Leading] = [.none, .icon, .bullet]
}

extension OUDSTag.Status.Category: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSTag.Status.Category] = [.neutral, .accent, .info, .negative, .positive, .warning]
}

extension OUDSTag.Appearance: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSTag.Appearance] = [.emphasized, .muted]
}

extension OUDSTag.Shape: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSTag.Shape] = [.rounded, .square]
}

enum TagLayout: DesignToolboxEnumLocalizedRepresentable {
    case textOnly, textAndBullet, textAndIcon

    var wordingKey: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_tech"
        case .textAndBullet:
            "app_components_tag_textAndBulletLayout_tech"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_tech"
        }
    }

    var statusLeading: OUDSTag.Status.Leading {
        switch self {
        case .textOnly:
            .none
        case .textAndBullet:
            .bullet
        case .textAndIcon:
            .icon
        }
    }
}
