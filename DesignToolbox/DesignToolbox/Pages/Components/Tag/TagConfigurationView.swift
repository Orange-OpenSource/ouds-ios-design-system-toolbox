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

    @Published var layout: TagLayout {
        didSet { updateCode() }
    }

    @Published var label: String

    @Published var size: OUDSTag.Size {
        didSet { updateCode() }
    }

    @Published var status: OUDSTag.Status {
        didSet { updateCode() }
    }

    @Published var hierarchy: OUDSTag.Hierarchy {
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
        layout = .textOnly
        loader = false
        flipIcon = false
        label = String(localized: "app_components_common_label_label")
        size = .default
        status = .neutral
        shape = .rounded
        hierarchy = .emphasized
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = "OUDSTag(label: \"\(label)\"\(iconPattern)\(flipIconPattern)\(hierarchyPattern)\(statusPattern)\(shapePattern)\(sizePattern)\(loaderPattern))"
    }

    private var iconPattern: String {
        switch layout {
        case .textOnly:
            ""
        case .textAndBullet:
            ", icon: .bullet"
        case .textAndIcon:
            ", icon: .asset(Image(decorative: \"ic_heart\"))"
        }
    }

    private var hierarchyPattern: String {
        ", hierarchy: .\(hierarchy.technicalDescription)"
    }

    private var statusPattern: String {
        ", status: .\(status.technicalDescription)"
    }

    private var shapePattern: String {
        ", shape: .\(shape.technicalDescription)"
    }

    private var sizePattern: String {
        ", size: .\(size.technicalDescription)"
    }

    private var loaderPattern: String {
        loader ? ", hasLoader: true" : ""
    }

    private var flipIconPattern: String {
        flipIcon ? ", flipIcon: true" : ""
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
            OUDSChipPicker(title: "app_components_common_layout_label",
                           selection: $configurationModel.layout,
                           chips: TagLayout.chips)

            OUDSChipPicker(title: "app_components_common_hierarchy_label",
                           selection: $configurationModel.hierarchy,
                           chips: OUDSTag.Hierarchy.chips)

            OUDSChipPicker(title: "app_components_common_status_label",
                           selection: $configurationModel.status,
                           chips: filteredStatusChips)

            OUDSChipPicker(title: "app_components_tag_shape_label",
                           selection: $configurationModel.shape,
                           chips: OUDSTag.Shape.chips)

            OUDSChipPicker(title: "app_components_common_size_label",
                           selection: $configurationModel.size,
                           chips: OUDSTag.Size.chips)

            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
                OUDSSwitchItem("app_components_common_loader_label", isOn: $configurationModel.loader)
                    .disabled(configurationModel.status == .disabled)

                OUDSSwitchItem("app_components_controlItem_flipIcon_label", isOn: $configurationModel.flipIcon)
                    .disabled(configurationModel.layout != .textAndIcon)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label)
                }
            }
        }
    }

    private var filteredStatusChips: [OUDSChipPickerData<OUDSTag.Status>] {
        OUDSTag.Status.allCases.compactMap {
            if $0 == .disabled, configurationModel.loader {
                nil
            } else {
                $0.chipData
            }
        }
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
        switch self {
        case .default:
            "default"
        case .small:
            "small"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSTag.Status: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSTag.Status] = [.neutral, .accent, .info, .negative, .positive, .warning, .disabled]

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
        case .disabled:
            "Disabled"
        }
    }

    public var technicalDescription: String {
        "\(description.lowercased())"
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }
}

extension OUDSTag.Hierarchy: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSTag.Hierarchy] = [.emphasized, .muted]

    public var description: String {
        switch self {
        case .emphasized:
            "Emphasized"
        case .muted:
            "Muted"
        }
    }

    public var technicalDescription: String {
        switch self {
        case .emphasized:
            "emphasized"
        case .muted:
            "muted"
        }
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
        switch self {
        case .rounded:
            "rounded"
        case .square:
            "square"
        }
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

    public var technicalDescription: String {
        switch self {
        case .textOnly:
            "textOnlyLayout"
        case .textAndBullet:
            "textAndBullet"
        case .textAndIcon:
            "textAndIcon"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
