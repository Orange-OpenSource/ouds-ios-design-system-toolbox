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
final class AlertMessageConfigurationModel: AlertConfigurationModel {

    // MARK: Published properties

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

    @Published var closeButton: Bool {
        didSet { updateCode() }
    }

    @Published var actionLink: Bool {
        didSet { updateCode() }
    }

    @Published var actionPosition: OUDSAlertMessage.Link.Position {
        didSet { updateCode() }
    }

    @Published var textMode: TextualContentMode {
        didSet { updateCode() }
    }

    // MARK: - Computed properties

    var richDescriptionText: AttributedString {
        do {
            return try AttributedString(markdown: descriptionText)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

    var richBulletList: [AttributedString] {
        do {
            return try bulletList.map { try AttributedString(markdown: $0) }
        } catch {
            return bulletList.map { _ in AttributedString("Supposed to be valid Markdown") }
        }
    }

    // MARK: Initializer

    override init() {
        descriptionText = ""
        actionLink = false
        actionPosition = .bottom
        closeButton = false
        bullet1 = "app_components_alert_alertMessage_bullet_tech" <- Int(1)
        bullet2 = "app_components_alert_alertMessage_bullet_tech" <- Int(2)
        bullet3 = "app_components_alert_alertMessage_bullet_tech" <- Int(3)
        textMode = .raw

        super.init()

        status = .positive
        statusIcon = true
        flipIcon = false
    }

    deinit {}

    // MARK: Component Configuration

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

    private var descriptionPattern: String {
        if descriptionText.isEmpty {
            return ""
        }
        switch textMode {
        case .raw:
            return ", description: \"\(descriptionText)\""
        case .rich:
            return ", description: yourAttributedString"
        }
    }

    private var bulletListPattern: String {
        if textMode == .raw {
            bulletList.isEmpty ? "" : ", bulletList: [\"\(bulletList.joined(separator: "\", \""))\"]"
        } else {
            bulletList.isEmpty ? "" : ", bulletList: yourArrayOfAttributedString"
        }
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

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: AlertStatus.chips)

                OUDSSwitchItem("app_components_alert_alertMessage_statusIcon_tech", isOn: $configurationModel.statusIcon)
                    .disabled(!configurationModel.hasIcon)

                OUDSSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                    .disabled(!configurationModel.enableFlipIcon)

                OUDSSwitchItem("app_components_alert_alertMessage_closeButton_tech", isOn: $configurationModel.closeButton)

                OUDSSwitchItem("app_components_alert_alertMessage_actionLink_tech", isOn: $configurationModel.actionLink)

                OUDSChipPicker(title: "app_components_alert_alertMessage_actionLinkPosition_tech",
                               selection: $configurationModel.actionPosition,
                               chips: OUDSAlertMessage.Link.Position.chips)
                    .disabled(!configurationModel.actionLink)

                OUDSChipPicker(title: "app_components_textMode_tech",
                               selection: $configurationModel.textMode,
                               chips: TextualContentMode.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")

                DesignToolboxTextField(text: $configurationModel.bullet1, label: "app_components_alert_alertMessage_bullet_tech" <- Int(1))
                DesignToolboxTextField(text: $configurationModel.bullet2, label: "app_components_alert_alertMessage_bullet_tech" <- Int(2))
                DesignToolboxTextField(text: $configurationModel.bullet3, label: "app_components_alert_alertMessage_bullet_tech" <- Int(3))
            }
        }
    }
}

extension OUDSAlertMessage.Link.Position: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public static let allCases: [OUDSAlertMessage.Link.Position] = [.bottom, .topTrailing]
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
