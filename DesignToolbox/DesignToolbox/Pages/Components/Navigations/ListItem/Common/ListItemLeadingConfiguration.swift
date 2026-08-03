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
import Combine

open class ListItemLeadingConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var option: Leading {
        didSet { updateCode() }
    }

    var itemSize: OUDSListItemSize {
        didSet {
            avatarModel.itemSize = itemSize
            flagModel.itemSize = itemSize
            iconModel.itemSize = itemSize
            imageModel.itemSize = itemSize
            #if os(iOS) && canImport(UIKit)
            videoModel.itemSize = itemSize
            #endif
        }
    }

    var avatarModel: ListItemAvatarConfigurationModel
    var flagModel: ListItemFlagConfigurationModel
    var iconModel: ListItemIconConfigurationModel
    var imageModel: ListItemImageConfigurationModel
    #if os(iOS) && canImport(UIKit)
    var videoModel: ListItemVideoConfigurationModel
    #endif

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        option = .none

        avatarModel = ListItemAvatarConfigurationModel(itemSize: itemSize)
        flagModel = ListItemFlagConfigurationModel(itemSize: itemSize)
        iconModel = ListItemIconConfigurationModel(itemSize: itemSize)
        imageModel = ListItemImageConfigurationModel(itemSize: itemSize)
        #if os(iOS) && canImport(UIKit)
        videoModel = ListItemVideoConfigurationModel(itemSize: itemSize)
        #endif

        super.init()

        register(avatarModel)
        register(flagModel)
        register(iconModel)
        register(imageModel)
        #if os(iOS) && canImport(UIKit)
        register(videoModel)
        #endif
    }

    // MARK: Builder

    @MainActor
    func item(for theme: OUDSTheme) -> OUDSListItemLeading? {
        switch option {
        case .none:
            return nil
        case .icon:
            return .icon(iconModel.icon(for: theme))
        case .image:
            return .image(imageModel.image(for: theme))
        case .flag:
            return .flag(flagModel.flag)
        case .avatar:
            return .avatar(avatarModel.avatar(for: theme))
        #if os(iOS) && canImport(UIKit)
        case .video:
            return .video(videoModel.video)
        #endif
        }
    }

    // MARK: Media helper

    var needRoundedMediaOption: Bool {
        switch option {
        case .image:
            true
        #if os(iOS) && canImport(UIKit)
        case .video:
            true
        #endif
        default:
            false
        }
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
        #if os(iOS) && canImport(UIKit)
        case .video:
            ".video(\(videoModel.code))"
        #endif
        case .flag:
            ".flag(\(flagModel.code))"
        case .avatar:
            ".avatar(\(avatarModel.code))"
        }

        code = option == .none ? "" : "\n\nlet leading: OUDSListItemLeading = \n \(pattern)"
    }
}

struct ListItemLeadingConfiguration: View {
    
    @ObservedObject var configurationModel: ListItemLeadingConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(selection: $configurationModel.option,
                           chips: Leading.chips)
            
            switch configurationModel.option {
            case .image:
                ListItemImageConfiguration(configurationModel: configurationModel.imageModel)
            case .avatar:
                ListItemAvatarConfiguration(configurationModel: configurationModel.avatarModel)
            case .icon:
                ListItemIconConfiguration(configurationModel: configurationModel.iconModel)
            case .flag:
                ListItemFlagConfiguration(configurationModel: configurationModel.flagModel)
            case .video:
#if os(iOS) && canImport(UIKit)
                ListItemVideoConfiguration(configurationModel: configurationModel.videoModel)
#endif
            case .none:
                EmptyView()
            }
        }
    }
}

enum Leading: DesignToolboxEnumRepresentable {
#if os(iOS) && canImport(UIKit)
    case none, icon, image, video, flag, avatar
#else
    case none, icon, image, flag, avatar
#endif
}
