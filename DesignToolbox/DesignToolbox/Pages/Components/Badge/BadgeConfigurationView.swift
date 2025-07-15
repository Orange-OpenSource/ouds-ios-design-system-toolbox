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

// MARK: - Badge Configuration Model

/// The model shared between `BadgePageConfiguration` view and `BadgePageComponent` view.
final class BadgeConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var size: OUDSBadge.Size {
        didSet { updateCode() }
    }

    @Published var status: OUDSBadge.Status {
        didSet { updateCode() }
    }

    enum BadgeType: String, CaseIterable {
        case standard = "app_components_badge_standardType_label"
        case count = "app_components_badge_countType_label"
        case icon = "app_components_badge_iconType_label"
    }

    @Published var badgeType: BadgeType {
        didSet {
            // switching to icon or count so change to default size
            if badgeType == .icon || badgeType == .icon {
                size = .medium
            }
            updateCode()
        }
    }

    @Published var countText: String {
        didSet { updateCode() }
    }

    var count: UInt {
        UInt(countText) ?? 1
    }

    // MARK: Initializer

    override init() {
        size = .medium
        status = .neutral
        badgeType = .standard
        countText = "1"
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        switch badgeType {
        case .standard:
            code = "OUDSBadge(\(statusPattern), \(sizePattern))"
        case .count:
            code = "OUDSBadge(count: \(count), \(statusPattern), \(sizePattern))"
        case .icon:
            code = "OUDSBadge(icon: Image(\"ic_heart\"), \(statusPattern), \(sizePattern))"
        }
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var sizePattern: String {
        "size: \(size.technicalDescription)"
    }
}

// MARK: - Badge Configuration View

struct BadgeConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: BadgeConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            DesignToolboxChoicePicker(title: "app_components_badge_type_label",
                                      selection: $configurationModel.badgeType,
                                      style: .segmented)
            {
                ForEach(BadgeConfigurationModel.BadgeType.allCases, id: \.rawValue) { type in
                    Text(type.rawValue.localized()).tag(type)
                }
            }

            DesignToolboxChoicePicker(title: "app_components_badge_size_label",
                                      selection: $configurationModel.size,
                                      style: .segmented)
            {
                ForEach(OUDSBadge.Size.allCases, id: \.id) { size in
                    Text(size.description).tag(size)
                }
            }

            DesignToolboxChoicePicker(title: "app_components_badge_status_label",
                                      selection: $configurationModel.status,
                                      style: .segmented)
            {
                ForEach(OUDSBadge.Status.allCases, id: \.id) { status in
                    Text(status.description).tag(status)
                }
            }

            if configurationModel.badgeType == .count {
                DesignToolboxTextField(text: $configurationModel.countText, title: "app_components_badge_count_label")
                    .keyboardType(.numberPad)
                    .padding(.horizontal, theme.spaces.spaceFixedMd)
            }
        }
    }
}

extension OUDSBadge.Size: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSBadge.Size] = [.extraSmall, .small, .medium, .large]

    public var description: String {
        switch self {
        case .extraSmall:
            "Extra Small"
        case .small:
            "Small"
        case .medium:
            "Medium"
        case .large:
            "Large"
        }
    }

    public var technicalDescription: String {
        switch self {
        case .extraSmall:
            ".extraSmall"
        case .small:
            ".small"
        case .medium:
            ".medium"
        case .large:
            ".large"
        }
    }

    var id: String { description }
}

extension OUDSBadge.Status: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSBadge.Status] = [.accent, .info, .negative, .positive, .neutral, .warning, .disabled]

    public var description: String {
        switch self {
        case .accent:
            "Accent"
        case .info:
            "Info"
        case .negative:
            "Negative"
        case .neutral:
            "Neutral"
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
