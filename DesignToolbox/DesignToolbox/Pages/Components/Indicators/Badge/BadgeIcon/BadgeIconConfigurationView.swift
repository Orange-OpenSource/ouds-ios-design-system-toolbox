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

    @Published var size: OUDSBadgeStandard.Size {
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

    @Published var statusIcon: DefinedStatusIcons {
        didSet { updateCode() }
    }

    // MARK: - Properties

    var enableFlipIcon: Bool {
        statusKind == .neutral || statusKind == .accent
    }

    func statusWithIcon(from theme: OUDSTheme) -> OUDSBadgeIcon.Status {
        let imageRenderingMode: Image.TemplateRenderingMode = (statusIcon == .tintedIcon ? .template : .original)
        let imageAsset: Image = (statusIcon == .tintedIcon ? Image.defaultImage(prefixedBy: theme.name) : Image.placeholderImage())
        return switch statusKind {
        case .neutral:
            .neutral(icon: imageAsset, flipped: flipIcon, renderingMode: imageRenderingMode)
        case .accent:
            .accent(icon: imageAsset, flipped: flipIcon, renderingMode: imageRenderingMode)
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
        size = .medium
        statusKind = .neutral
        flipIcon = false
        statusIcon = .tintedIcon
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSBadgeIcon(\(statusWithIconPattern), accessibilityLabel: someLabel, \(sizePattern))
        \(disablePattern)
        """
    }

    private var disablePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var statusWithIconPattern: String {
        switch statusKind {
        case .neutral:
            switch statusIcon {
            case .image:
                "status: .neutral(icon: \(Image.defaultImageSample())\(flipIcon ? ", flipped: true" : ""))"
            case .tintedIcon:
                "status: .neutral(icon: \(Image.placeholderImageSample())\(flipIcon ? ", flipped: true" : ""), renderingMode: .original)"
            }
        case .accent:
            switch statusIcon {
            case .image:
                "status: .accent(icon: \(Image.defaultImageSample())\(flipIcon ? ", flipped: true" : ""))"
            case .tintedIcon:
                "status: .accent(icon: \(Image.placeholderImageSample())\(flipIcon ? ", flipped: true" : ""), renderingMode: .original)"
            }
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
        "size: \(size.technicalDescription)"
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

            OUDSChipPicker(title: "app_components_common_statusIcon_tech",
                           selection: $configurationModel.statusIcon,
                           chips: DefinedStatusIcons.chips)

            OUDSSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                .disabled(!configurationModel.enableFlipIcon)

            OUDSChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.size,
                           chips: OUDSBadgeStandard.Size.chips)

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.statusKind,
                           chips: BadgeIconStatusKind.chips)
        }
    }
}

// MARK: - Badge Icon Status Kind

enum BadgeIconStatusKind: DesignToolboxEnumRepresentable, CaseIterable, Hashable {
    case neutral, accent, positive, info, warning, negative
}
