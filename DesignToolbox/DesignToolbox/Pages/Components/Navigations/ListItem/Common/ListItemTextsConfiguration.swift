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

// MARK: - List Item Texts Configuration Model

open class ListItemTextsConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: OUDSListItemSize

    @Published var labelText: String {
        didSet { updateCode() }
    }

    @Published var overlineText: String {
        didSet { updateCode() }
    }

    @Published var overlineTextMode: TextualContentMode {
        didSet { updateCode() }
    }

    @Published var extraLabelText: String {
        didSet { updateCode() }
    }

    @Published var descriptionText: String {
        didSet { updateCode() }
    }

    @Published var hasBoldLabel: Bool {
        didSet { updateCode() }
    }

    @Published var hasSlot: Bool {
        didSet { updateCode() }
    }

    @Published var hasBottomSlot: Bool {
        didSet { updateCode() }
    }

    @Published var labelContentType: ListItemLabelContentType {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        labelText = String(localized: "app_components_common_label_label")
        labelContentType = .text

        overlineText = ""
        overlineTextMode = .raw
        extraLabelText = ""
        descriptionText = ""
        hasBoldLabel = false

        hasSlot = false
        hasBottomSlot = false

        helperText = ""

        super.init()
    }

    deinit {}

    // MARK: Builder

    @MainActor
    func textSlot() -> some View {
        OUDSInlineAlert(label: "This is a dumb text slot", status: .info)
    }

    @MainActor
    func bottomSlot() -> some View {
        OUDSInlineAlert(label: "This is a dumb bottom slot", status: .info)
    }

    @ViewBuilder
    var customLabelView: some View {
        let fakeText = "Missed call"
        HStack(spacing: 8) {
            Image(systemName: "phone.down.fill")
                .foregroundColor(.red)
                .accessibilityHidden(true)
            Text(fakeText)
                .fontWeight(.semibold)
        }
    }

    // MARK: Code helper

    override func updateCode() {
        code = switch labelContentType {
        case .text:
            "\(labelPattern)\(hasBoldLabelPattern)\(descriptionPattern)\(overlinePattern)\(extraLabelPattern)\(helperTextPattern)"
        case .customView:
            "label: customLabel, accessibilityLabel: \"\(labelText)\"\(descriptionPattern)\(overlinePattern)\(extraLabelPattern)\(helperTextPattern)"
        }
    }

    var customLabelPattern: String {
        """
        let customLabel = someLabel()
        """
    }

    private var labelPattern: String {
        "label: \"\(labelText)\""
    }

    private var hasBoldLabelPattern: String {
        hasBoldLabel ? ", hasBoldLabel: true" : ""
    }

    private var overlinePattern: String {
        guard !overlineText.isEmpty else { return "" }
        if overlineTextMode == .rich {
            return ", overline: yourAttributedString"
        }
        return ", overline: \"\(overlineText)\""
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
}

// MARK: - List Item Texts Configuration

struct ListItemTextsConfiguration: View {

    @ObservedObject var configurationModel: ListItemTextsConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        OUDSChipPicker(title: "app_components_listItem_labelContentType_tech".localized(),
                       selection: $configurationModel.labelContentType,
                       chips: ListItemLabelContentType.chips)

        VStack {
            if configurationModel.labelContentType == .text {
                DesignToolboxTextField(text: $configurationModel.labelText, label: "app_components_common_label_tech")

                OUDSSwitchItem("app_components_listItem_boldLabel_tech", isOn: $configurationModel.hasBoldLabel)
            }

            if configurationModel.itemSize == .default {
                let textModeTitle = "app_components_textMode_tech".localized() + " (Overline)"
                OUDSChipPicker(title: textModeTitle,
                               selection: $configurationModel.overlineTextMode,
                               chips: TextualContentMode.chips)

                DesignToolboxTextField(text: $configurationModel.overlineText, label: "app_components_listItem_overline_tech")

                DesignToolboxTextField(text: $configurationModel.extraLabelText, label: "app_components_common_extraLabel_tech")
            }

            DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")

            DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")

            OUDSSwitchItem("app_components_listItem_textSlot_tech", isOn: $configurationModel.hasSlot)

            OUDSSwitchItem("app_components_listItem_bottomSlot_tech", isOn: $configurationModel.hasBottomSlot)
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }
}

// MARK: - List Item Label Content Type

enum ListItemLabelContentType: CaseIterable, CustomStringConvertible {
    case text
    case customView

    var description: String {
        switch self {
        case .text:
            "Text"
        case .customView:
            "Custom View"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
