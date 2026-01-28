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
        OudsBulletList(type: bulletType,
                       textStyle: configurationModel.textStyle,
                       isBold: configurationModel.isBold,
                       items: items)
        .padding(.all, theme.spaces.fixedMedium)
    }

    
    private var items: [OudsBulletList.Item] {
        switch configurationModel.levelCount {
        case .one:
            [ .init(configurationModel.label),
              .init(configurationModel.label),
              .init(configurationModel.label),
            ]
        case .two:
            [ .init(configurationModel.label,
                    subItems: [
                        .init(configurationModel.label),
                        .init(configurationModel.label)
                    ])
            ]
        case .three:
            [ .init(configurationModel.label,
                    subItems: [
                        .init(configurationModel.label,
                              subItems: [
                                .init(configurationModel.label)
                              ])
                    ])
            ]
        }
    }

    private var bulletType: OudsBulletList.`Type` {
        switch configurationModel.bulletType {
        case .unordered:
            .unordered(icon: unorderedIcon, isBranded: configurationModel.unorderedBulletIsBranded)
        case .bare:
            .bare
        case .ordered:
            .ordered
        }
    }
    
    private var unorderedIcon: OudsBulletList.UnorderedIcon {
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
