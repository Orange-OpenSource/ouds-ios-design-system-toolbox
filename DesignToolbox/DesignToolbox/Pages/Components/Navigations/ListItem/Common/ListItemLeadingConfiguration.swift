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

import Combine
import OUDSSwiftUI
import SwiftUI

// MARK: - List Item Leading Configuration Model

open class ListItemLeadingConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var option: ListItemLeadingType {
        didSet { updateCode() }
    }

    var itemSize: OUDSListItemSize {
        didSet {
            avatarModel.itemSize = itemSize
            iconModel.itemSize = itemSize
            imageModel.itemSize = itemSize
        }
    }

    var avatarModel: ListItemAvatarConfigurationModel
    var flagModel: ListItemFlagConfigurationModel
    var iconModel: ListItemIconConfigurationModel
    var imageModel: ListItemImageConfigurationModel

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        option = .none

        avatarModel = ListItemAvatarConfigurationModel(itemSize: itemSize)
        flagModel = ListItemFlagConfigurationModel()
        iconModel = ListItemIconConfigurationModel(itemSize: itemSize)
        imageModel = ListItemImageConfigurationModel(itemSize: itemSize)

        super.init()

        register(avatarModel)
        register(flagModel)
        register(iconModel)
        register(imageModel)
    }

    deinit {}

    // MARK: Builder

    @MainActor
    func item(for theme: OUDSTheme) -> OUDSListItemLeading? {
        switch option {
        case .none:
            nil
        case .icon:
            .icon(iconModel.icon(for: theme))
        case .image:
            .image(imageModel.image(for: theme))
        case .flag:
            .flag(flagModel.flag)
        case .avatar:
            .avatar(avatarModel.avatar(for: theme))
        case .slot:
            .slot(AnyView(
                ZStack {
                    OUDSCircularProgressIndicator(
                        progress: 1.0,
                        status: .positive,
                        track: false,
                        animated: false)
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.green)
                }
                .frame(width: 48, height: 48)))
        }
    }

    // MARK: Media helper

    var needRoundedMediaOption: Bool {
        option == .image
    }

    // MARK: Code helper

    override func updateCode() {
        let pattern =
            switch option {
            case .none:
                ""
            case .icon:
                ".icon(\(iconModel.code)"
            case .image:
                ".image(\(imageModel.code))"
            case .flag:
                ".flag(\(flagModel.code))"
            case .avatar:
                ".avatar(\(avatarModel.code))"
            case .slot:
                """
                .slot(AnyView(
                    ...
                ))
                """
            }

        code = option == .none ? "" : "\n\nlet leading: OUDSListItemLeading = \n \(pattern)"
    }
}

// MARK: - List Item Leading Configuration

struct ListItemLeadingConfiguration: View {

    @ObservedObject var configurationModel: ListItemLeadingConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(title: "",
                           selection: $configurationModel.option,
                           chips: ListItemLeadingType.chips)

            switch configurationModel.option {
            case .image:
                ListItemImageConfiguration(configurationModel: configurationModel.imageModel)
            case .avatar:
                ListItemAvatarConfiguration(configurationModel: configurationModel.avatarModel)
            case .icon:
                ListItemIconConfiguration(configurationModel: configurationModel.iconModel)
            case .flag:
                EmptyView()
            case .none:
                EmptyView()
            case .slot:
                EmptyView()
            }
        }
    }
}

// MARK: - List Item Leading Type

enum ListItemLeadingType: DesignToolboxEnumRepresentable {
    case none, icon, image, flag, avatar, slot
}
