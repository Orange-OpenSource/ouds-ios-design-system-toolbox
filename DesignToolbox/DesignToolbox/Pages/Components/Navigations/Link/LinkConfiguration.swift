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

import OUDSComponents
import SwiftUI

// MARK: - Link Configuration Model

/// The model shared between `LinkPageConfiguration` view and `LinkPageComponent` view.
final class LinkConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool = true {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var layout: LinkLayout {
        didSet { updateCode() }
    }

    @Published var size: OUDSLink.Size {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = String(localized: "app_components_link_label")
        layout = .textOnly
        size = .default
    }

    deinit {}

    // MARK: Component Configuration

    private var coloredSurfaceCodeModifier: String {
        onColoredSurface ? ".oudsColoredSurface(theme.colorModes.onBrandPrimary)" : ""
    }

    private var disableCode: String {
        ".disabled(\(enabled ? "false" : "true"))"
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                OUDSLink(text: \"\(text)\", size: \(size.description.lowercased())) {}
                \(disableCode)
                \(coloredSurfaceCodeModifier)
                """
        case .textAndIcon:
            code =
                """
                OUDSLink(text: \"\(text)\", icon: Image(\"ic_heart\"), size: \(size.description.lowercased())) {}
                \(disableCode)
                \(coloredSurfaceCodeModifier)
                """
        case .indicatorNext:
            code =
                """
                OUDSLink(text: \"\(text)\", indicator: .next, size: \(size.description.lowercased())) {}
                \(disableCode)
                \(coloredSurfaceCodeModifier)
                """
        case .indicatorBack:
            code =
                """
                OUDSLink(text: \"\(text)\", indicator: .back, size: \(size.description.lowercased())) {}
                \(disableCode)
                \(coloredSurfaceCodeModifier)
                """
        }
    }
}

// MARK: - Link Layout

enum LinkLayout: CaseIterable, CustomStringConvertible {
    case textOnly
    case textAndIcon
    case indicatorBack
    case indicatorNext

    var description: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_label"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_label"
        case .indicatorBack:
            "app_components_link_backLayout_label"
        case .indicatorNext:
            "app_components_link_nextLayout_label"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: Link size extension

extension OUDSLink.Size: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    nonisolated(unsafe) public static let allCases: [OUDSLink.Size] = [.default, .small]

    public var description: String {
        switch self {
        case .default:
            "Default"
        case .small:
            "Small"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: - Link Configuration View

struct LinkConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: LinkConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)

                OUDSSwitchItem("app_components_common_onColoredSurface_label", isOn: $configurationModel.onColoredSurface)

                OUDSChipPicker(title: "app_components_common_size_label",
                               selection: $configurationModel.size,
                               chips: OUDSLink.Size.chips)

                OUDSChipPicker(title: "app_components_common_layout_label",
                               selection: $configurationModel.layout,
                               chips: LinkLayout.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_label")
            }
        }
    }
}
