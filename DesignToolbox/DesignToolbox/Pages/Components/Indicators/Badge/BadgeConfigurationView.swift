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

    // MARK: - Types

    enum BadgeType: String, CaseIterable {
        case standard = "app_components_badge_standardType_label"
        case count = "app_components_badge_countType_label"
        case icon = "app_components_badge_iconType_label"

        private var chipData: OUDSChipPickerData<Self> {
            OUDSChipPickerData(tag: self, layout: .text(text: rawValue.localized()))
        }

        static var chips: [OUDSChipPickerData<Self>] {
            allCases.map(\.chipData)
        }
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
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            OUDSChipPicker(title: "app_components_badge_type_label",
                           selection: $configurationModel.badgeType,
                           chips: BadgeConfigurationModel.BadgeType.chips)

            OUDSChipPicker(title: "app_components_common_size_label",
                           selection: $configurationModel.size,
                           chips: OUDSBadge.Size.chips)

            OUDSChipPicker(title: "app_components_common_status_label",
                           selection: $configurationModel.status,
                           chips: OUDSBadge.Status.chips)

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

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
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

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
