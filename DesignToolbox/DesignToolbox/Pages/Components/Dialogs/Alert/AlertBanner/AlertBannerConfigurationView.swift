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

// MARK: - AlertBanner Configuration Model

/// The model shared between `AlertBannerConfigurationView` view and `AlertBannerDemo` view.
final class AlertBannerConfigurationModel: AlertConfigurationModel {

    // MARK: Published properties

    @Published var descriptionText: String {
        didSet { updateCode() }
    }

    @Published var closeButton: Bool {
        didSet { updateCode() }
    }

    @Published var actionLink: Bool {
        didSet { updateCode() }
    }

    @Published var actionPosition: OUDSAlertBanner.Link.Position {
        didSet { updateCode() }
    }

    @Published var textMode: TextualContentMode {
        didSet { updateCode() }
    }

    @Published var showSkeleton: Bool {
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

    // MARK: Initializer

    override init() {
        descriptionText = ""
        actionLink = false
        actionPosition = .bottom
        closeButton = false
        textMode = .raw
        showSkeleton = false

        super.init()

        status = .positive
        statusIcon = .tintedIcon
        flipIcon = false
    }

    deinit {}

    // MARK: Component Configuration

    var link: OUDSAlertBanner.Link? {
        actionLink ? .init(text: "Action", position: actionPosition, action: {}) : nil
    }

    var onClose: (() -> Void)? {
        closeButton ? {} : nil
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

    private var linkPattern: String {
        actionLink ? ", link: .init(text: \"Action\", position: \(actionPosition.technicalDescription), action: {})" : ""
    }

    private var onClosePattern: String {
        closeButton ? ", onClose: { }" : ""
    }

    private var skeletonPattern: String {
        showSkeleton ? ".showSkeleton(isVisible: true)" : ""
    }

    override func updateCode() {
        code =
            """
            OUDSAlertBanner(label: \"\(text)\"\(statusPattern)\(descriptionPattern)\(linkPattern)\(onClosePattern))
                \(skeletonPattern)
            """
    }
}

// MARK: - AlertBanner Configuration View

struct AlertBannerConfigurationView: View {

    @StateObject var configurationModel: AlertBannerConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_components_common_skeleton_tech", isOn: $configurationModel.showSkeleton)

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: AlertStatus.chips)

                OUDSChipPicker(title: "app_components_common_statusIcon_tech",
                               selection: $configurationModel.statusIcon,
                               chips: StatusIcons.chips)
                    .disabled(!configurationModel.hasIcon)

                OUDSSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                    .disabled(!configurationModel.enableFlipIcon)

                OUDSSwitchItem("app_components_alert_alertBanner_closeButton_tech", isOn: $configurationModel.closeButton)

                OUDSSwitchItem("app_components_alert_alertBanner_actionLink_tech", isOn: $configurationModel.actionLink)

                OUDSChipPicker(title: "app_components_alert_alertBanner_actionLinkPosition_tech",
                               selection: $configurationModel.actionPosition,
                               chips: OUDSAlertBanner.Link.Position.chips)
                    .disabled(!configurationModel.actionLink)

                OUDSChipPicker(title: "app_components_textMode_tech",
                               selection: $configurationModel.textMode,
                               chips: TextualContentMode.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")
            }
        }
    }
}

extension OUDSAlertBanner.Link.Position: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSAlertBanner.Link.Position] = [.bottom, .topTrailing]
}
