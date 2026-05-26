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

// MARK: - BulletList Configuration Model

/// The model shared between `BulletListPageConfiguration` view and `BulletListPageComponent` view.
final class BulletListConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var label: String {
        didSet { updateCode() }
    }

    @Published var levelCount: BulletListLevelCount {
        didSet { updateCode() }
    }

    @Published var bulletType: BulletListType {
        didSet { updateCode() }
    }

    @Published var unorderedAsset: BulletListUnorderedAsset {
        didSet { updateCode() }
    }

    @Published var unorderedBulletIsBranded: Bool {
        didSet { updateCode() }
    }

    @Published var textStyle: BulletListTextStyle {
        didSet { updateCode() }
    }

    @Published var isBold: Bool {
        didSet { updateCode() }
    }

    @Published var textMode: TextualContentMode {
        didSet { updateCode() }
    }

    // MARK: - Computed properties

    var richLabel: AttributedString {
        do {
            return try AttributedString(markdown: label)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

    // MARK: Initializer

    override init() {
        label = String(localized: "app_components_common_label_label")
        levelCount = .one
        bulletType = .unordered
        unorderedAsset = .bullet
        unorderedBulletIsBranded = true
        textStyle = .bodyLarge
        isBold = true
        textMode = .raw

        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var labelPattern: String {
        switch textMode {
        case .rich:
            "yourAttributedString"
        case .raw:
            "\"\(label)\""
        }
    }

    private var iconPattern: String {
        switch unorderedAsset {
        case .bullet:
            ""
        case .tick:
            "asset: .tick"
        case .icon:
            "asset: .icon(\(Image.defaultImageSample()))"
        }
    }

    private var isBrandedPattern: String {
        unorderedBulletIsBranded ? ", isBranded: true" : ""
    }

    private var typePattern: String {
        var value = ""
        switch bulletType {
        case .bare:
            value = "type: .bare"
        case .ordered:
            value = "type: .ordered(index: 1)"
        case .unordered:
            let rawPattern = "type: .unordered(\(iconPattern)\(isBrandedPattern))"
            value = (rawPattern == "type: .unordered()" ? "" : rawPattern)
        }

        return "\(value)"
    }

    private var textStylePattern: String {
        if textStyle == .bodyMedium {
            ", textStyle: .bodyMedium"
        } else { // body large
            ""
        }
    }

    private var isBoldPattern: String {
        isBold ? "" : ", isBold: false"
    }

    private var itemsPattern: String {
        switch levelCount {
        case .one:
            """
            {
                OUDSBulletList.Item(\(labelPattern))
                OUDSBulletList.Item(\(labelPattern))
                OUDSBulletList.Item(\(labelPattern))
            }
            """
        case .two:
            """
            {
                OUDSBulletList.Item(\(labelPattern)) {
                    OUDSBulletList.Item(\(labelPattern))
                    OUDSBulletList.Item(\(labelPattern))
                }
            }
            """
        case .three:
            """
            {
                OUDSBulletList.Item(\(labelPattern)) {
                    OUDSBulletList.Item(\(labelPattern)) {
                        OUDSBulletList.Item(\(labelPattern))
                    }
                }
            }
            """
        }
    }

    override func updateCode() {
        code =
            """
            OUDSBulletList(\(typePattern)\(textStylePattern)\(isBoldPattern))
            \(itemsPattern)
            """
    }
}

// MARK: - BulletList Configuration View

struct BulletListConfigurationView: View {

    @StateObject var configurationModel: BulletListConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSChipPicker(title: "app_components_common_type_tech",
                               selection: $configurationModel.bulletType,
                               chips: BulletListType.chips)

                if configurationModel.bulletType == .unordered {
                    OUDSChipPicker(title: "app_components_bulletList_unorderedAsset_tech",
                                   selection: $configurationModel.unorderedAsset,
                                   chips: BulletListUnorderedAsset.chips)

                    OUDSSwitchItem("app_components_bulletList_unorderedAssetBrandColor_tech", isOn: $configurationModel.unorderedBulletIsBranded)
                }

                OUDSChipPicker(title: "app_components_bulletList_textStyle_tech",
                               selection: $configurationModel.textStyle,
                               chips: OUDSBulletList.TextStyle.chips)

                OUDSSwitchItem("app_components_bulletList_bold_tech", isOn: $configurationModel.isBold)

                OUDSChipPicker(title: "app_components_bulletList_levelCount_tech",
                               selection: $configurationModel.levelCount,
                               chips: BulletListLevelCount.chips)

                OUDSChipPicker(title: "app_components_textMode_tech",
                               selection: $configurationModel.textMode,
                               chips: TextualContentMode.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")
                }
            }
        }
    }
}

// MARK: Bullet List Level Count

enum BulletListLevelCount: DesignToolboxEnumLocalizedRepresentable {
    case one, two, three

    var wordingKey: String {
        switch self {
        case .one:
            "app_components_bulletList_oneLevel_label"
        case .two:
            "app_components_bulletList_twoLevels_label"
        case .three:
            "app_components_bulletList_threeLevels_label"
        }
    }
}

// MARK: Bullet List Type

enum BulletListType: DesignToolboxEnumRepresentable {
    case bare
    case ordered
    case unordered
}

// MARK: Bullet List Text Style extension

typealias BulletListTextStyle = OUDSBulletList.TextStyle
extension OUDSBulletList.TextStyle: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSBulletList.TextStyle] = [.bodyLarge, .bodyMedium]
}

// MARK: - Bullet List Unordered Icon

enum BulletListUnorderedAsset: DesignToolboxEnumRepresentable {
    case bullet
    case tick
    case icon
}
