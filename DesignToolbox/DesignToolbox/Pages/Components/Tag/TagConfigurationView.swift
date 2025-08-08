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

    // MARK: Initializer

    override init() {
        layout = .textOnly
        label = String(localized: "app_components_common_label_label")
        size = .default
        status = .neutral
        shape = .rounded
        hierarchy = .emphasized
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = "OUDSTag(label: \"Label\", \(hierarchyPattern), \(statusPattern), \(shapePattern), \(sizePattern))"
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var sizePattern: String {
        "size: \(size.technicalDescription)"
    }

    private var shapePattern: String {
        "shape: \(shape.technicalDescription)"
    }

    private var hierarchyPattern: String {
        "hierarchy: \(hierarchy.technicalDescription)"
    }
}

// MARK: - Tag Configuration View

struct TagConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: TagConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            DesignToolboxChoicePicker(title: "app_components_common_layout_label",
                                      selection: $configurationModel.layout,
                                      style: .segmented)
            {
                ForEach(TagLayout.allCases, id: \.id) { layout in
                    Text(LocalizedStringKey(layout.description)).tag(layout)
                }
            }

            DesignToolboxChoicePicker(title: "app_components_common_hierarchy_label",
                                      selection: $configurationModel.hierarchy,
                                      style: .segmented)
            {
                ForEach(OUDSTag.Hierarchy.allCases, id: \.id) { hierarchy in
                    Text(hierarchy.description).tag(hierarchy)
                }
            }

            DesignToolboxChoicePicker(title: "app_components_common_status_label",
                                      selection: $configurationModel.status,
                                      style: .segmented)
            {
                ForEach(OUDSTag.Status.allCases, id: \.id) { status in
                    Text(status.description).tag(status)
                }
            }

            DesignToolboxChoicePicker(title: "app_components_tag_shape_label",
                                      selection: $configurationModel.shape,
                                      style: .segmented)
            {
                ForEach(OUDSTag.Shape.allCases, id: \.id) { shape in
                    Text(shape.description).tag(shape)
                }
            }

            DesignToolboxChoicePicker(title: "app_components_common_size_label",
                                      selection: $configurationModel.size,
                                      style: .segmented)
            {
                ForEach(OUDSTag.Size.allCases, id: \.id) { size in
                    Text(size.description).tag(size)
                }
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.label)
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
            ".default"
        case .small:
            ".small"
        }
    }

    var id: String { description }
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
        ".\(description.lowercased())"
    }

    var id: String { description }
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
            ".emphasized"
        case .muted:
            ".muted"
        }
    }

    var id: String { description }
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
            ".rounded"
        case .square:
            ".square"
        }
    }

    var id: String { description }
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

    var id: String { description }
}
