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

// MARK: BulletList page

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

// MARK: - BulletList Demo

struct BulletListDemo: View {

    @StateObject var configurationModel: BulletListConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        OUDSBulletList(type: bulletType,
                       textStyle: configurationModel.textStyle,
                       isBold: configurationModel.isBold,
                       items: items)
        .padding(.all, theme.spaces.fixedMedium)
    }

    @OUDSBulletListItemBuilder
    private func items() -> [OUDSBulletList.Item] {
        switch configurationModel.levelCount {
        case .one:
            OUDSBulletList.Item(configurationModel.label)
            OUDSBulletList.Item(configurationModel.label)
            OUDSBulletList.Item(configurationModel.label)
        case .two:
            OUDSBulletList.Item(configurationModel.label) {
                OUDSBulletList.Item(configurationModel.label)
                OUDSBulletList.Item(configurationModel.label)
            }
        case .three:
            OUDSBulletList.Item(configurationModel.label) {
                OUDSBulletList.Item(configurationModel.label) {
                    OUDSBulletList.Item(configurationModel.label)
                }
            }
        }
    }

    private var bulletType: OUDSBulletList.`Type` {
        switch configurationModel.bulletType {
        case .unordered:
            .unordered(icon: unorderedIcon, isBranded: configurationModel.unorderedBulletIsBranded)
        case .bare:
            .bare
        case .ordered:
            .ordered
        }
    }

    private var unorderedIcon: OUDSBulletList.UnorderedIcon {
        switch configurationModel.unorderedBulletIcon {
        case .bullet:
            .bullet
        case .tick:
            .tick
        case .free:
            .free(Image.defaultImage(prefixedBy: theme.name))
        }
    }
}
