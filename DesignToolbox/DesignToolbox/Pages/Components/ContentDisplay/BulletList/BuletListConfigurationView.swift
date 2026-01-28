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
import StoreKit

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

    @Published var unorderedBulletIcon: BulletListUnorderedIcon {
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
        
    // MARK: Initializer

    override init() {
        label = String(localized: "app_components_common_label_label")
        levelCount = .one
        bulletType = .unordered
        unorderedBulletIcon = .bullet
        unorderedBulletIsBranded = false
        textStyle = .bodyLarge
        isBold = true

        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    // swiftlint:disable line_length
        
    private var iconPattern: String {
        switch unorderedBulletIcon {
        case .bullet:
            ".bullet"
        case .tick:
            ".tick"
        case .free:
            ".free(\(Image.defaultImageSample()))"
        }
    }

    private var typePattern: String {
        let value = switch bulletType {
        case .bare:
            ".bare"
        case .ordered:
            ".ordered(index: 1)"
        case .unordered:
            ".unordered(icon: \(iconPattern), isBranded: \(unorderedBulletIsBranded))"
        }

        return "type: \(value)"
    }

    private var textStylePattern: String {
        let value = switch textStyle {
        case .bodyLarge:
            ".bodyLarge"
        case .bodyMedium:
            ".bodyMedium"
        }

        return ", textStyle: \(value)"
    }
    
    private var isBoldPattern: String {
        isBold ? ", isBold: true" : ""
    }

    private var itemsPattern: String {
        switch levelCount {
        case .one:
            """
            {
                OUDSBulletList.Item(\(label))
                OUDSBulletList.Item(\(label))
                OUDSBulletList.Item(\(label))
            }
            """
        case .two:
            """
            {
                OUDSBulletList.Item(\(label)) {
                    OUDSBulletList.Item(\(label))
                    OUDSBulletList.Item(\(label))
                }
            }
            """
        case .three:
            """
            {
                OUDSBulletList.Item(\(label)) {
                    OUDSBulletList.Item(\(label)) {
                        OUDSBulletList.Item(\(label))
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
    // swiftlint:enable line_length
}


// MARK: - BulletList Configuration View

struct BulletListConfigurationView: View {

    @StateObject var configurationModel: BulletListConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                OUDSChipPicker(title: "app_components_common_type_label",
                               selection: $configurationModel.bulletType,
                               chips: BulletListType.chips)
                
                if configurationModel.bulletType == .unordered {
                    OUDSChipPicker(title: "app_components_bulletList_unorderedIcon_label",
                                   selection: $configurationModel.unorderedBulletIcon,
                                   chips: BulletListUnorderedIcon.chips)
                    
                    OUDSSwitchItem("app_components_bulletList_unorderedIconBrandColor_label", isOn: $configurationModel.unorderedBulletIsBranded)
                }

                OUDSChipPicker(title: "app_components_bulletList_textStyle_label",
                               selection: $configurationModel.textStyle,
                               chips: OUDSBulletList.TextStyle.chips)
                
                OUDSSwitchItem("app_components_bulletList_bold_label", isOn: $configurationModel.isBold)

                OUDSChipPicker(title: "app_components_bulletList_levelCount_label",
                               selection: $configurationModel.levelCount,
                               chips: BulletListLevelCount.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_label")
                }
            }
        }
    }
}

// MARK: Bullet List Nested Level extension
enum BulletListLevelCount: CaseIterable, CustomStringConvertible {
    case one, two, three
    
    public var description: String {
        switch self {
        case .one:
            "app_components_bulletList_oneLevel_label"
        case .two:
            "app_components_bulletList_twoLevel_label"
        case .three:
            "app_components_bulletList_threeLevel_label"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: Bullet List Type extension

enum BulletListType: CaseIterable, CustomStringConvertible {
    case bare
    case ordered
    case unordered

    // Note: Not localized because it is a technical name
    var description: String {
        switch self {
        case .bare:
            "Bare"
        case .ordered:
            "Ordered"
        case .unordered:
            "Unordered"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: Bullet List Type extension
typealias BulletListTextStyle = OUDSBulletList.TextStyle
extension OUDSBulletList.TextStyle: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    
    nonisolated(unsafe) public static let allCases: [OUDSBulletList.TextStyle] = [.bodyLarge, .bodyMedium]
    
    // Note: Not localized because it is a technical name
    public var description: String {
        switch self {
        case .bodyLarge:
            "Body Large"
        case .bodyMedium:
            "Body Medium"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

enum BulletListUnorderedIcon: CaseIterable, CustomStringConvertible {
    case bullet
    case tick
    case free

    // Note: Not localized because it is a technical name
    public var description: String {
        switch self {
            case .bullet:
                "Bullet"
            case .tick:
                "Tick"
            case .free:
                "Free"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

