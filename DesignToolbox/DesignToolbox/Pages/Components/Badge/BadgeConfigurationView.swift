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

    @Published var text: String
    @Published var size: OUDSBadge.Size {
        didSet { updateCode() }
    }

    @Published var status: OUDSBadge.Status {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        size = .medium
        status = .accent
        text = String(localized: "app_components_badge_label")
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = ""
    }
}

// MARK: - Badge Configuration View

struct BadgeConfigurationView: View {

    @StateObject var configurationModel: BadgeConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            DesignToolboxChoicePicker(title: "Select size",
                                      selection: $configurationModel.size,
                                      style: .segmented)
            {
                ForEach(OUDSBadge.Size.allCases, id: \.id) { size in
                    Text(size.description).tag(size)
                }
            }

            DesignToolboxChoicePicker(title: "Select Status",
                                      selection: $configurationModel.status,
                                      style: .segmented)
            {
                ForEach(OUDSBadge.Status.allCases, id: \.id) { status in
                    Text(status.description).tag(status)
                }
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
            "Negatice"
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

    var id: String { description }
}
