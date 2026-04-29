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

// MARK: - ListItem Configuration Model

final class ListItemConfigurationModel: ComponentConfiguration {

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var isOutlined: Bool {
        didSet { updateCode() }
    }

    @Published var isReadOnly: Bool {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
        didSet { updateCode() }
    }

    @Published var labelText: String {
        didSet { updateCode() }
    }

    @Published var overlineText: String {
        didSet { updateCode() }
    }

    @Published var extraLabelText: String {
        didSet { updateCode() }
    }

    @Published var descriptionText: String {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var containersAlignment: OUDSListItemStyle.ContainersAlignment {
        didSet { updateCode() }
    }

    @Published var affordanceType: OUDSListItemNavigationGrouped.AffordanceType {
        didSet { updateCode() }
    }

    override init() {
        enabled = true
        isOutlined = false
        isReadOnly = false
        hasDivider = false
        labelText = String(localized: "app_components_common_label_label")
        overlineText = "Overline"
        extraLabelText = "Extra Label"
        descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        helperText = "Helper text"

        affordanceType = .next
        containersAlignment = .center
        super.init()
    }

    deinit {}

    // MARK: - Code generation

    override func updateCode() {
        code =
            """
            OUDSListItem(label: "\(labelText)"\(overlinePattern)\(extraLabelPattern)\(descriptionPattern)\(helperTextPattern)\(isOutlinedPattern)\(isReadOnlyPattern)\(hasDividerPattern))
            \(disableCodePattern)
            """
    }

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var overlinePattern: String {
        overlineText.isEmpty ? "" : ", overline: \"\(overlineText)\""
    }

    private var extraLabelPattern: String {
        extraLabelText.isEmpty ? "" : ", extraLabel: \"\(extraLabelText)\""
    }

    private var descriptionPattern: String {
        descriptionText.isEmpty ? "" : ", description: \"\(descriptionText)\""
    }

    private var helperTextPattern: String {
        helperText.isEmpty ? "" : ", helperText: \"\(helperText)\""
    }

    private var isOutlinedPattern: String {
        isOutlined ? ", isOutlined: true" : ""
    }

    private var isReadOnlyPattern: String {
        isReadOnly ? ", isReadOnly: true" : ""
    }

    private var hasDividerPattern: String {
        hasDivider ? ", hasDivider: true" : ""
    }
}

// MARK: - ListItem Configuration

struct ListItemConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)

                OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

                OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                    .disabled(configurationModel.isReadOnly)

                OUDSSwitchItem("app_components_common_readOnly_tech", isOn: $configurationModel.isReadOnly)
                    .disabled(!configurationModel.enabled)

                OUDSChipPicker(title: "app_components_listItem_alignment_tech".localized(),
                               selection: $configurationModel.containersAlignment,
                               chips: OUDSListItemStyle.ContainersAlignment.chips)

                OUDSChipPicker(title: "app_components_listItem_affordance_tech".localized(),
                               selection: $configurationModel.affordanceType,
                               chips: OUDSListItemNavigationGrouped.AffordanceType.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.labelText, label: "app_components_common_label_tech")

                DesignToolboxTextField(text: $configurationModel.overlineText, label: "app_components_listItem_overline_tech")

                DesignToolboxTextField(text: $configurationModel.extraLabelText, label: "app_components_controlItem_extraLabel_tech")

                DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")

                DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")
            }
        }
    }
}


extension OUDSListItemStyle.ContainersAlignment: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public static let allCases: [OUDSListItemStyle.ContainersAlignment] = [.center, .top]

    public var description: String {
        switch self {
        case .center:
            "app_components_listItem_alignment_center_tech"
        case .top:
            "app_components_listItem_alignment_top_tech"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSListItemNavigationGrouped.AffordanceType: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    public static let allCases: [OUDSListItemNavigationGrouped.AffordanceType] = [.next, .previous, .external]

    public var description: String {
        switch self {
        case .next:
            "app_components_listItem_affordance_next_tech"
        case .previous:
            "app_components_listItem_affordance_previous_tech"
        case .external:
            "app_components_listItem_affordance_external_tech"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
