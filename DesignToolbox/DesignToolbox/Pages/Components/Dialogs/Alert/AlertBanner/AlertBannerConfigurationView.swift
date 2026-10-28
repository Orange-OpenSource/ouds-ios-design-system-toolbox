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

    enum Layout: CaseIterable, DesignToolboxEnumRepresentable {
        case center, start
    }

    @Published var layout: Layout {
        didSet { updateCode() }
    }

    @Published var descriptionText: String {
        didSet { updateCode() }
    }

    @Published var closeButton: Bool {
        didSet { updateCode() }
    }

    @Published var hasActionLink: Bool {
        didSet { updateCode() }
    }

    @Published var actionPosition: OUDSAlertBanner.ActionLink.Position {
        didSet { updateCode() }
    }

    @Published var textMode: TextualContentMode {
        didSet { updateCode() }
    }

    @Published var showSkeleton: Bool {
        didSet { updateCode() }
    }

    @Published var containersAlignment: OUDSAlertBanner.Alignment {
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

    var richLabelText: AttributedString {
        do {
            return try AttributedString(markdown: text)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

    var centerLayouAction: (label: String, action: () -> Void)? {
        hasActionLink ? (label: "Action", action: {}) : nil
    }

    // MARK: Initializer

    override init() {
        layout = .start

        descriptionText = ""
        hasActionLink = false
        actionPosition = .bottom
        closeButton = false
        textMode = .raw
        showSkeleton = false
        containersAlignment = .top

        super.init(isEdgeToEdgeComponent: true)

        status = .positive
        statusIcon = .tintedIcon
        flipIcon = false
    }

    deinit {}

    // MARK: Component Configuration

    var centerLayoutAction: (label: String, onClick: () -> Void)? {
        hasActionLink ? (label: "Action", onClick: {}) : nil
    }

    var startLayoutActionLink: OUDSAlertBanner.ActionLink? {
        hasActionLink ? .init(text: "Action", position: actionPosition, action: {}) : nil
    }

    var onClose: (() -> Void)? {
        closeButton ? {} : nil
    }

    var labelContent: OUDSTextualContent {
        switch textMode {
        case .raw:
            .raw(text)
        case .rich:
            .rich(richLabelText)
        }
    }

    var descriptionContent: OUDSTextualContent {
        switch textMode {
        case .raw:
            .raw(descriptionText)
        case .rich:
            .rich(richDescriptionText)
        }
    }

    // MARK: Component Code snippet

    private var descriptionPattern: String {
        if descriptionText.isEmpty {
            return ""
        }

        return ", description: \(textMode.technicalDescription)(\"\(descriptionText)\")"
    }

    private var actionLinkPattern: String {
        hasActionLink ? ", actionLink: .init(text: \"Action\", position: \(actionPosition.technicalDescription), action: {})" : ""
    }

    private var onClosePattern: String {
        closeButton ? ", onClose: {}" : ""
    }

    private var skeletonPattern: String {
        showSkeleton ? ".showSkeleton(isVisible: true)" : ""
    }

    private var alignmentPattern: String {
        ", alignment: \(containersAlignment.technicalDescription)"
    }

    override func updateCode() {
        switch layout {
        case .center:
            code =
                """
                OUDSAlertBanner(label: \"\(text)\"\(statusPattern), action: nil)"
                    \(skeletonPattern)
                """

        case .start:
            code =
                """
                OUDSAlertBanner(label: \"\(text)\"\(statusPattern)\(descriptionPattern)\(actionLinkPattern)\(alignmentPattern)\(onClosePattern))
                    \(skeletonPattern)
                """
        }
    }
}

// MARK: - AlertBanner Configuration View

struct AlertBannerConfigurationView: View {

    @StateObject var configurationModel: AlertBannerConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSChipPicker(title: "app_components_common_layout_tech",
                               selection: $configurationModel.layout,
                               chips: AlertBannerConfigurationModel.Layout.chips)

                Divider().horizontal()

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

                OUDSSwitchItem("app_components_alert_actionLink_tech", isOn: $configurationModel.hasActionLink)

                if configurationModel.layout == .start {
                    OUDSChipPicker(title: "app_components_alert_actionLinkPosition_tech",
                                   selection: $configurationModel.actionPosition,
                                   chips: OUDSAlertBanner.ActionLink.Position.chips)
                    .disabled(!configurationModel.hasActionLink)

                    OUDSSwitchItem("app_components_common_closeButton_tech", isOn: $configurationModel.closeButton)

                    OUDSChipPicker(title: "app_components_common_contentAlignment_tech".localized(),
                                   selection: $configurationModel.containersAlignment,
                                   chips: OUDSAlertBanner.Alignment.chips)

                    OUDSChipPicker(title: "app_components_common_textMode_tech",
                                   selection: $configurationModel.textMode,
                                   chips: TextualContentMode.chips)
                }
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")

                if configurationModel.layout == .start {
                    DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")
                }
            }
        }
    }
}

extension OUDSAlertBanner.ActionLink.Position: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSAlertBanner.ActionLink.Position] = [.bottom, .topTrailing]
}

extension OUDSAlertBanner.Alignment: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSAlertBanner.Alignment] = [.center, .top]
}
