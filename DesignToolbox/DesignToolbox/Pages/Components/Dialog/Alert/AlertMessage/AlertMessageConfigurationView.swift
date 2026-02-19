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

// MARK: - AlertMessage Configuration Model

/// The model shared between `AlertMessageConfigurationView` view and `AlertMessageDemo` view.
final class AlertMessageConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var descriptionText: String {
        didSet { updateCode() }
    }

    @Published var bullet1: String {
        didSet { updateCode() }
    }

    @Published var bullet2: String {
        didSet { updateCode() }
    }

    @Published var bullet3: String {
        didSet { updateCode() }
    }

    @Published var status: AlertMessageStatus {
        didSet { updateCode() }
    }

    @Published var statusIcon: Bool {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var closeButton: Bool {
        didSet { updateCode() }
    }

    @Published var actionLink: Bool {
        didSet { updateCode() }
    }

    @Published var actionPosition: OUDSAlertMessage.Link.Position {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        descriptionText = String(localized: "app_components_common_description_label")
        status = .positive
        statusIcon = true
        flipIcon = false
        actionLink = false
        actionPosition = .bottom
        closeButton = false
        bullet1 = "app_components_alert_alertMessage_bullet_label" <- Int(1)
        bullet2 = "app_components_alert_alertMessage_bullet_label" <- Int(2)
        bullet3 = "app_components_alert_alertMessage_bullet_label" <- Int(3)

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
    func status(from theme: OUDSTheme) -> OUDSAlertMessage.Status {
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

    var link: OUDSAlertMessage.Link? {
        actionLink ? .init(text: "Action", position: actionPosition, action: {}) : nil
    }

    var onClose: (() -> Void)? {
        closeButton ? {} : nil
    }

    var bulletList: [String] {
        [bullet1, bullet2, bullet3].filter { !$0.isEmpty }
    }

    // MARK: Component Code snippet

    private var flipIconPattern: String {
        flipIcon ? ", flipped: true" : ""
    }

    private var iconPattern: String {
        switch status {
        case .neutral, .accent:
            statusIcon ? "icon: Image(\"ic_heart\")\(flipIconPattern)" : ""
        default:
            statusIcon ? "showIcon: true" : ""
        }
    }

    private var statusPattern: String {
        ", status: \(status.technicalDescription)(\(iconPattern))"
    }

    private var descriptionPattern: String {
        descriptionText.isEmpty ? "" : ", description: \"\(descriptionText)\""
    }

    private var bulletListPattern: String {
        bulletList.isEmpty ? "" : ", bulletList: [\"\(bulletList.joined(separator: "\", \""))\"]"
    }

    private var linkPattern: String {
        actionLink ? ", link: .init(text: \"Action\", position: \(actionPosition.technicalDescription), action: {})" : ""
    }

    private var onClosePattern: String {
        closeButton ? ", onClose: { }" : ""
    }

    override func updateCode() {
        code =
            """
            OUDSAlertMessage(label: \"\(text)\"\(statusPattern)\(descriptionPattern)\(bulletListPattern)\(linkPattern)\(onClosePattern))
            """
    }
}

// MARK: - AlertMessage Configuration View

struct AlertMessageConfigurationView: View {

    @StateObject var configurationModel: AlertMessageConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                OUDSChipPicker(title: "app_components_common_status_label",
                               selection: $configurationModel.status,
                               chips: AlertMessageStatus.chips)

                OUDSSwitchItem("app_components_alert_alertMessage_statusIcon_label", isOn: $configurationModel.statusIcon)
                    .disabled(!configurationModel.hasIcon)

                OUDSSwitchItem("app_components_common_flipIcon_label", isOn: $configurationModel.flipIcon)
                    .disabled(!configurationModel.enableFlipIcon)

                OUDSSwitchItem("app_components_alert_alertMessage_closeButton_label", isOn: $configurationModel.closeButton)

                OUDSSwitchItem("app_components_alert_alertMessage_actionLink_label", isOn: $configurationModel.actionLink)

                OUDSChipPicker(title: "app_components_alert_alertMessage_actionLinkPosition_label",
                               selection: $configurationModel.actionPosition,
                               chips: OUDSAlertMessage.Link.Position.chips)
                    .disabled(!configurationModel.actionLink)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_label")
                DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_label")

                DesignToolboxTextField(text: $configurationModel.bullet1, label: "app_components_alert_alertMessage_bullet_label" <- Int(1))
                DesignToolboxTextField(text: $configurationModel.bullet2, label: "app_components_alert_alertMessage_bullet_label" <- Int(2))
                DesignToolboxTextField(text: $configurationModel.bullet3, label: "app_components_alert_alertMessage_bullet_label" <- Int(3))
            }
        }
    }
}

extension OUDSAlertMessage.Link.Position: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    nonisolated(unsafe) public static let allCases: [OUDSAlertMessage.Link.Position] = [.bottom, .topTrailing]
    public var description: String {
        switch self {
        case .bottom:
            "Bottom"
        case .topTrailing:
            "Top Trailing"
        }
    }

    var technicalDescription: String {
        switch self {
        case .bottom:
            ".bottom"
        case .topTrailing:
            ".topTrailing"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

enum AlertMessageStatus: String, CaseIterable, CustomStringConvertible {
    case neutral
    case accent
    case positive
    case info
    case warning
    case negative

    var description: String {
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

    var technicalDescription: String {
        ".\(rawValue)"
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
