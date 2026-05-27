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

// MARK: - Badge Icon Configuration Model

/// The model shared between `BadgePageConfiguration` view and `BadgePageComponent` view.
final class BadgeIconConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var iconSize: OUDSBadgeIcon.Size {
        didSet { updateCode() }
    }

    @Published var statusKind: BadgeIconStatusKind {
        didSet {
            if !enableFlipIcon {
                flipIcon = false
            }
            updateCode()
        }
    }

    @Published var flipIcon: Bool {
        didSet {
            guard oldValue != flipIcon else { return }
            updateCode()
        }
    }

    // MARK: - Properties

    var enableFlipIcon: Bool {
        statusKind == .neutral || statusKind == .accent
    }

    func statusWithIcon(from theme: OUDSTheme) -> OUDSBadgeIcon.Status {
        switch statusKind {
        case .neutral:
            .neutral(icon: Image.defaultImage(prefixedBy: theme.name), flipped: flipIcon)
        case .accent:
            .accent(icon: Image.defaultImage(prefixedBy: theme.name), flipped: flipIcon)
        case .positive:
            .positive
        case .info:
            .info
        case .warning:
            .warning
        case .negative:
            .negative
        }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        iconSize = .medium
        statusKind = .neutral
        flipIcon = false
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSBadgeIcon(\(statusWithIconPattern), accessibilityLabel: \"\(accessibilityLabelValue)\", \(sizePattern))
        \(disablePattern)
        """
    }

    private var disablePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var statusWithIconPattern: String {
        switch statusKind {
        case .neutral:
            "status: .neutral(icon: \(Image.defaultImageSample())\(flipIcon ? ", flipped: true" : ""))"
        case .accent:
            "status: .accent(icon: \(Image.defaultImageSample())\(flipIcon ? ", flipped: true" : ""))"
        case .positive:
            "status: .positive"
        case .info:
            "status: .info"
        case .warning:
            "status: .warning"
        case .negative:
            "status: .negative"
        }
    }

    private var sizePattern: String {
        "size: \(iconSize.technicalDescription)"
    }

    private var accessibilityLabelValue: String {
        "app_components_badge_hint_a11y".localized()
    }
}

// MARK: - Badge Icon Configuration View

struct BadgeIconConfigurationView: View {

    // MARK: Stored properties

    @ObservedObject var configurationModel: BadgeIconConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            OUDSSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                .disabled(!configurationModel.enableFlipIcon)

            OUDSChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.iconSize,
                           chips: OUDSBadgeIcon.Size.chips)

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.statusKind,
                           chips: BadgeIconStatusKind.chips)
        }
    }
}

// MARK: - Badge Icon Status Kind

enum BadgeIconStatusKind: DesignToolboxEnumRepresentable, CaseIterable, Hashable {
    case neutral
    case accent
    case positive
    case info
    case warning
    case negative

    var formattedName: String {
        switch self {
        case .neutral:
            "Neutral"
        case .accent:
            "Accent"
        case .positive:
            "Positive"
        case .info:
            "Info"
        case .warning:
            "Warning"
        case .negative:
            "Negative"
        }
    }
}

extension OUDSBadgeIcon.Status: @retroactive Equatable, @retroactive Hashable, @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSBadgeIcon.Status] = [
        .neutral(icon: Image.defaultImage()),
        .accent(icon: Image.defaultImage()),
        .positive,
        .info,
        .warning,
        .negative,
    ]

    public static func == (lhs: OUDSBadgeIcon.Status, rhs: OUDSBadgeIcon.Status) -> Bool {
        switch (lhs, rhs) {
        case let (.neutral(_, lFlipped), .neutral(_, rFlipped)):
            lFlipped == rFlipped
        case let (.accent(_, lFlipped), .accent(_, rFlipped)):
            lFlipped == rFlipped
        case (.positive, .positive), (.info, .info), (.warning, .warning), (.negative, .negative):
            true
        default:
            false
        }
    }

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .neutral:
            hasher.combine("neutral")
        case .accent:
            hasher.combine("accent")
        case .positive:
            hasher.combine("positive")
        case .info:
            hasher.combine("info")
        case .warning:
            hasher.combine("warning")
        case .negative:
            hasher.combine("negative")
        }
    }

    var formattedName: String {
        switch self {
        case .neutral:
            "Neutral"
        case .accent:
            "Accent"
        case .positive:
            "Positive"
        case .info:
            "Info"
        case .warning:
            "Warning"
        case .negative:
            "Negative"
        }
    }
}

extension OUDSBadgeIcon.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSBadgeIcon.Size] = [.extraSmall, .small, .medium, .large]
}
