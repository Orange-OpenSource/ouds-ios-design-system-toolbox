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

/// The model shared between `AlertMessagePageConfiguration` view and `AlertMessagePageComponent` view.
final class AlertMessageConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var descriptionText: String {
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
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    var enableFlipIcon: Bool {
        statusIcon && status == .neutral || status == .accent
    }

    func status(from theme: OUDSTheme) -> OUDSAlertMessage.Status {
        switch status {
        case .neutral:
            .neutral(icon: Image.defaultImage(prefixedBy: theme.name), flipped: flipIcon)
        case .accent:
            .accent(icon: Image.defaultImage(prefixedBy: theme.name), flipped: flipIcon)
        case .positive:
            .positive(showIcon: statusIcon)
        case .info:
            .info(showIcon: statusIcon)
        case .warning:
            .warning(showIcon: statusIcon)
        case .negative:
            .negative(showIcon: statusIcon)
        }
    }

    var link: OUDSAlertMessage.Link? {
        actionLink ? .init(text: "Action", position: actionPosition, action: {}) : nil
    }

    var onClose: (() -> Void)? {
        closeButton ? { } : nil
    }


    // MARK: Component Code snippet

    override func updateCode() {
        code =
            """
            OUDSAlertMessage()
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

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

enum AlertMessageStatus: CaseIterable, CustomStringConvertible {
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

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
