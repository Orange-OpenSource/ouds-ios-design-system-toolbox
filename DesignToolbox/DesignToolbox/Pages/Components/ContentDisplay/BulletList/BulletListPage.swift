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

// MARK: Bullet List page

struct BulletListPage: View {

    @StateObject private var configurationModel: BulletListConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BulletListConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BulletListDemo(configurationModel: configurationModel)
        } configurationView: {
            BulletListConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Bullet List Demo

struct BulletListDemo: View {

    @StateObject var configurationModel: BulletListConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        // To keep things simple, supposed the rich/raw mode is for all parameters
        switch configurationModel.textMode {
        case .raw:
            OUDSBulletList(type: bulletType,
                           textStyle: configurationModel.textStyle,
                           isBold: configurationModel.isBold,
                           items: rawItems)
        case .rich:
            OUDSBulletList(type: bulletType,
                           textStyle: configurationModel.textStyle,
                           isBold: configurationModel.isBold,
                           items: richItems)
        }
    }

    @OUDSBulletListItemBuilder
    private func rawItems() -> [OUDSBulletList.Item] {
        let label = configurationModel.label
        switch configurationModel.levelCount {
        case .one:
            OUDSBulletList.Item(label)
            OUDSBulletList.Item(label)
            OUDSBulletList.Item(label)
        case .two:
            OUDSBulletList.Item(label) {
                OUDSBulletList.Item(label)
                OUDSBulletList.Item(label)
            }
        case .three:
            OUDSBulletList.Item(label) {
                OUDSBulletList.Item(label) {
                    OUDSBulletList.Item(label)
                }
            }
        }
    }

    @OUDSBulletListItemBuilder
    private func richItems() -> [OUDSBulletList.Item] {
        let richLabel = configurationModel.richLabel
        switch configurationModel.levelCount {
        case .one:
            OUDSBulletList.Item(richLabel)
            OUDSBulletList.Item(richLabel)
            OUDSBulletList.Item(richLabel)
        case .two:
            OUDSBulletList.Item(richLabel) {
                OUDSBulletList.Item(richLabel)
                OUDSBulletList.Item(richLabel)
            }
        case .three:
            OUDSBulletList.Item(richLabel) {
                OUDSBulletList.Item(richLabel) {
                    OUDSBulletList.Item(richLabel)
                }
            }
        }
    }

    private var bulletType: OUDSBulletList.`Type` {
        switch configurationModel.bulletType {
        case .unordered:
            .unordered(asset: unorderedAsset, isBranded: configurationModel.unorderedBulletIsBranded)
        case .bare:
            .bare
        case .ordered:
            .ordered
        }
    }

    private var unorderedAsset: OUDSBulletList.UnorderedAsset {
        switch configurationModel.unorderedAsset {
        case .bullet:
            .bullet
        case .tick:
            .tick
        case .icon:
            .icon(Image.defaultImage(prefixedBy: theme.name))
        }
    }
}
