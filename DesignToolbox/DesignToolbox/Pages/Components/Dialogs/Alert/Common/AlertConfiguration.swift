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

// MARK: - Alert Configuration Model

open class AlertConfigurationModel: ComponentConfiguration {

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var status: AlertStatus {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var statusIcon: StatusIcons {
        didSet { updateCode() }
    }

    override init() {
        text = String(localized: "app_components_common_label_label")
        statusIcon = .none
        status = .neutral
        flipIcon = false

        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    var enableFlipIcon: Bool {
        (statusIcon != .none) && hasIcon
    }

    var hasIcon: Bool {
        status == .neutral || status == .accent
    }

    @MainActor
    func status(from theme: OUDSTheme) -> OUDSAlertStatus {
        let imageRenderingMode: Image.TemplateRenderingMode = (statusIcon == .tintedIcon ? .template : .original)
        let imageAsset: Image = (statusIcon == .tintedIcon ? Image.defaultImage(prefixedBy: theme.name) : Image.placeholderImage())
        return switch status {
        case .neutral:
            .neutral(icon: statusIcon == .none ? nil : OUDSImage(asset: imageAsset, flipped: flipIcon, renderingMode: imageRenderingMode))
        case .accent:
            .accent(icon: statusIcon == .none ? nil : OUDSImage(asset: imageAsset, flipped: flipIcon, renderingMode: imageRenderingMode))
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

    // MARK: Component Code snippet

    var flipIconPattern: String {
        flipIcon ? ", flipped: true" : ""
    }

    var renderingModePattern: String {
        statusIcon == .image ? ", renderingMode: .original" : ""
    }

    var iconPattern: String {
        switch status {
        case .neutral, .accent:
            switch statusIcon {
            case .none:
                ""
            case .tintedIcon:
                "icon: OUDSImage(asset: Image(decorative: \"tips-and-tricks\")\(flipIconPattern)\(renderingModePattern))"
            case .image:
                "icon: OUDSImage(asset: Image(decorative: \"il_placeholder\")\(flipIconPattern)\(renderingModePattern))"
            }
        default:
            statusIcon != .none ? "showIcon: true" : ""
        }
    }

    var statusPattern: String {
        iconPattern.isEmpty
            ? ", status: \(status.technicalDescription)"
            : ", status: \(status.technicalDescription)(\(iconPattern))"
    }
}
