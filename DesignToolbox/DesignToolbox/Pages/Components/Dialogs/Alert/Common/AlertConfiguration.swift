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

class AlertConfigurationModel: ComponentConfiguration {

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var status: AlertStatus {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var statusIcon: Bool {
        didSet { updateCode() }
    }

    override init() {
        text = String(localized: "app_components_common_label_label")
        statusIcon = false
        status = .neutral
        flipIcon = false

        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    var enableFlipIcon: Bool {
        statusIcon && hasIcon
    }

    var hasIcon: Bool {
        status == .neutral || status == .accent
    }

    @MainActor
    func status(from theme: OUDSTheme) -> OUDSAlertStatus {
        switch status {
        case .neutral:
                .neutral(icon: statusIcon ? OUDSIcon(asset: Image.defaultImage(prefixedBy: theme.name), flipped: flipIcon) : nil)
        case .accent:
                .accent(icon: statusIcon ? OUDSIcon(asset: Image.defaultImage(prefixedBy: theme.name), flipped: flipIcon) : nil)
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

    var iconPattern: String {
        switch status {
        case .neutral, .accent:
            statusIcon ? "icon: Image(\"ic_heart\")\(flipIconPattern)" : ""
        default:
            statusIcon ? "showIcon: true" : ""
        }
    }

    var statusPattern: String {
        ", status: \(status.technicalDescription)(\(iconPattern))"
    }
}
