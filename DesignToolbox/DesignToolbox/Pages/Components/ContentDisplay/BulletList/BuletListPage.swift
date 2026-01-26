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
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(Array(levels.enumerated()), id: \.offset) { offset, level in
                OUDSBulletList(label: configurationModel.label,
                               type: type(for: UInt8(offset + 1)),
                               textStyle: configurationModel.textStyle,
                               level: level,
                               isBold: configurationModel.isBold)
            }
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
    
    private var levels: [BulletListLevel] {
        switch configurationModel.level {
        case .zero:
            return [.zero, .zero, .zero]
        case .one:
            return [.zero, .one, .one]
        case .two:
            return [.zero, .one, .two]
        }
    }
    
    private func type(for index: UInt8) -> OUDSBulletList.`Type` {
        switch configurationModel.bulletType {
        case .unordered:
            .unordered(icon: unorderedIcon, isBranded: configurationModel.unorderedBulletIsBranded)
        case .bare:
            .bare
        case .ordered:
            .ordered(index: index)
        }
    }
    
    private var unorderedIcon: OUDSBulletList.UnorderedIcon {
        switch configurationModel.unorderedBulletIcon {
        case .bullet:
            .bullet
        case .tick:
            .tick
        case .free:
            .free(image: Image.defaultImage(prefixedBy: theme.name))
        }
    }
}
