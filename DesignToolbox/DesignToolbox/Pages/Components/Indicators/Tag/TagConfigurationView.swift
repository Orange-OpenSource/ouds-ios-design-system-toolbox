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

    @Published var label: String

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

    // MARK: Initializer

    override init() {
        enabled = true
        layout = .textOnly
        loader = false
        flipIcon = false
        label = String(localized: "app_components_common_label_label")
        size = .default
        statusCategory = .neutral
        shape = .rounded
        appearance = .emphasized
    }

    deinit {}

    var status: OUDSTag.Status {
        switch statusCategory {
        case .accent:
            switch layout.statusLeading {
            case .bullet:
                .accent(bullet: true)
            case .none:
                .accent(bullet: false)
            case .icon:
                .accent(icon: Image(systemName: "figure.handball"), flipIcon: flipIcon)
            }
        case .neutral:
            switch layout.statusLeading {
            case .bullet:
                .neutral(bullet: true)
            case .none:
                .neutral(bullet: false)
            case .icon:
                .neutral(icon: Image(systemName: "figure.handball"), flipIcon: flipIcon)
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

    private var statusPattern: String {
        if statusCategory != .neutral, statusCategory != .accent {
            return ", status: \(statusCategory.technicalDescription)(leading: \(layout.statusLeading.technicalDescription))"
        } else {
            if layout == .textAndBullet {
                return ", status: \(statusCategory.technicalDescription)(bullet: true)"
            } else if layout == .textAndIcon {
                let flipIconPattern = flipIcon ? ", flipIcon: true" : ""
                return ", status: \(statusCategory.technicalDescription)(icon: Image(systemName: \"figure.handball\")\(flipIconPattern))"
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
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
                .disabled(configurationModel.loader)

            OUDSSwitchItem("app_components_common_loader_label", isOn: $configurationModel.loader)
                .disabled(!configurationModel.enabled)

            OUDSChipPicker(title: "app_components_common_layout_label",
                           selection: $configurationModel.layout,
                           chips: TagLayout.chips)

            OUDSSwitchItem("app_components_controlItem_flipIcon_label", isOn: $configurationModel.flipIcon)
                .disabled(!configurationModel.enableFlipIcon)

            OUDSChipPicker(title: "app_components_common_appearance_label",
                           selection: $configurationModel.appearance,
                           chips: OUDSTag.Appearance.chips)

            OUDSChipPicker(title: "app_components_common_status_label",
                           selection: $configurationModel.statusCategory,
                           chips: filteredStatusChips)

            OUDSChipPicker(title: "app_components_tag_shape_label",
                           selection: $configurationModel.shape,
                           chips: OUDSTag.Shape.chips)

            OUDSChipPicker(title: "app_components_common_size_label",
                           selection: $configurationModel.size,
                           chips: OUDSTag.Size.chips)

<<<<<<< HEAD
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMedium) {
                OUDSSwitchItem("app_components_common_loader_label", isOn: $configurationModel.loader)
                    .disabled(configurationModel.status == .disabled)

                OUDSSwitchItem("app_components_controlItem_flipIcon_label", isOn: $configurationModel.flipIcon)
                    .disabled(configurationModel.layout != .textAndIcon)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_label")
                }
=======
            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.label)
>>>>>>> 5b8166cc (refactor: update api and internal adaptation for v1.3)
            }
        }
    }

    private var filteredStatusChips: [OUDSChipPickerData<OUDSTag.Status.Category>] {
        OUDSTag.Status.Category.allCases.compactMap(\.chipData)
    }
}

extension OUDSTag.Size: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSTag.Size] = [.default, .small]

    public var description: String {
        switch self {
        case .default:
            "Default"
        case .small:
            "Small"
        }
    }

    public var technicalDescription: String {
        ".\(description.lowercased())"
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSTag.Status.Leading: @retroactive CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            "none"
        case .bullet:
            "bullet"
        case .icon:
            "icon"
        }
    }

    public var technicalDescription: String {
        ".\(description)"
    }
}

extension OUDSTag.Status.Category: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSTag.Status.Category] = [.neutral, .accent, .info, .negative, .positive, .warning]

    public var description: String {
        switch self {
        case .neutral:
            "Neutral"
        case .accent:
            "Accent"
        case .info:
            "Info"
        case .negative:
            "Negative"
        case .positive:
            "Positive"
        case .warning:
            "Warning"
        }
    }

    public var technicalDescription: String {
        ".\(description.lowercased())"
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }
}

extension OUDSTag.Appearance: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSTag.Appearance] = [.emphasized, .muted]

    public var description: String {
        switch self {
        case .emphasized:
            "Emphasized"
        case .muted:
            "Muted"
        }
    }

    public var technicalDescription: String {
        ".\(description.lowercased())"
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSTag.Shape: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSTag.Shape] = [.rounded, .square]

    public var description: String {
        switch self {
        case .rounded:
            "Rounded"
        case .square:
            "Square"
        }
    }

    public var technicalDescription: String {
        ".\(description.lowercased())"
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

enum TagLayout: CaseIterable, CustomStringConvertible {
    case textOnly
    case textAndBullet
    case textAndIcon

    var description: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_label"
        case .textAndBullet:
            "app_components_tag_textAndBulletLayout_label"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_label"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
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
