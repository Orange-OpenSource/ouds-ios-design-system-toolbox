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

open class ListItemTrailingConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var option: Trailing {
        didSet { updateCode() }
    }

    @Published var textType: OUDSListItemTrailing.TextType {
        didSet { updateCode() }
    }

    private var cancellables = Set<AnyCancellable>()
    var avatarModel: ListItemAvatarConfigurationModel
    var flagModel: ListItemFlagConfigurationModel
    var iconModel: ListItemIconConfigurationModel
    var imageModel: ListItemImageConfigurationModel
    #if os(iOS) && canImport(UIKit)
    var videoModel: ListItemVideoConfigurationModel
    #endif

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


    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        option = .none
        textType = .label(OUDSListItemTrailing.TextType.labelValue)

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
        #if os(iOS) && canImport(UIKit)
        register(videoModel)
        #endif
    }

    private func register(_ model: ComponentConfiguration) {
        model
            .objectWillChange
            .sink { [weak self] _ in
            self?.objectWillChange.send()
        }
        .store(in: &self.cancellables)
    }

    // MARK: Builder

    @MainActor
    func item(for theme: OUDSTheme) -> OUDSListItemTrailing? {
        switch option {
        case .none:
            return nil
        case .text:
            return .text(textType)
        case .badge:
            return .badge(.count(.init(1,
                                       accessibilityLabel: "1",
                                       status: .negative,
                                       size: .large)))
        case .tag:
            return .tag(.init(label: "Label", size: .small))
        case .icon:
            return .icon(iconModel.icon(for: theme))
        case .image:
            return .image(imageModel.image)
        #if os(iOS) && canImport(UIKit)
        case .video:
            return .video(videoModel.video)
        #endif
        case .flag:
            return .flag(flagModel.flag)
        case .avatar:
            return .avatar(avatarModel.avatar)
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
        case .text:
            ".text(\(textPattern))"
        case .badge:
            "TODO"
//            ".badge(\(badgePattern))"
        case .tag:
            ".tag(OUDSTag(label: \"Label\", size: .small))"
        case .icon:
            ".icon(\(iconModel.code)"
        case .image:
            ".image(\(imageModel.code))"
        #if os(iOS) && canImport(UIKit)
        case .video:
            ".video(\(videoModel.code)"
        #endif
        case .flag:
            ".flag(\(flagModel.code))"
        case .avatar:
            ".avatar(\(avatarModel.code))"
        }

        code =  option == .none ? "" : "\n\nlet trailing: OUDSListItemTrailing = \n \(pattern)"
    }

    private var textPattern: String {
        let labelText = "TODO"
        let extraLabelText = "TODO"

        let textPattern = switch textType {
        case .label:
            ".label(\"\(labelText)\")"
        case .labelMuted:
            ".labelMuted(\"\(labelText)\")"
        case .labelStrong:
            ".labelStrong(\"\(labelText)\")"
        case .labelAndExtraLabel:
            ".labelMuted(\"\(labelText)\", \"\(extraLabelText)\")"
        }

        return textPattern
    }
}

struct ListItemTrailingConfiguration: View {

    @ObservedObject var configurationModel: ListItemTrailingConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            OUDSChipPicker(selection: $configurationModel.option,
                           chips: Trailing.chips)
            
            switch configurationModel.option {
            case .text:
                OUDSChipPicker(title: "app_components_listItem_trailing_textType_tech".localized(),
                               selection: $configurationModel.textType,
                               chips: OUDSListItemTrailing.TextType.chips)
            case .image:
                ListItemImageConfiguration(configurationModel: configurationModel.imageModel)
            case .icon:
                ListItemIconConfiguration(configurationModel: configurationModel.iconModel)
            case .avatar:
                ListItemAvatarConfiguration(configurationModel: configurationModel.avatarModel)
            case .flag:
                ListItemFlagConfiguration(configurationModel: configurationModel.flagModel)
            case .video:
#if os(iOS) && canImport(UIKit)
                ListItemVideoConfiguration(configurationModel: configurationModel.videoModel)
#endif
            default:
                EmptyView()
            }
        }
    }
}

enum Trailing: DesignToolboxEnumRepresentable {
#if os(iOS) && canImport(UIKit)
    case none, text, badge, tag, icon, image, video, flag, avatar
#else
    case none, text, badge, tag, icon, image, flag, avatar
#endif
}

// MARK: - Extensions of OUDSListItemTrailing.TextType

extension OUDSListItemTrailing.TextType: @retroactive Equatable {}
extension OUDSListItemTrailing.TextType: @retroactive Hashable {}
extension OUDSListItemTrailing.TextType: @retroactive CaseIterable {}
extension OUDSListItemTrailing.TextType: DesignToolboxEnumRepresentable {

    // Tricks to avoid to have Xcode ffiding these Strings and definied localizables with Text()
    static let labelValue = "Label"
    static let extraLabelValue = "Extra Label"

    public static let allCases: [OUDSListItemTrailing.TextType] =
    [
        .label(Self.labelValue),
        .labelStrong(Self.labelValue),
        .labelMuted(Self.labelValue),
        .labelAndExtraLabel(Self.labelValue, Self.extraLabelValue),
    ]

    var formattedName: String {
        switch self {
        case .label:
            "Label"
        case .labelMuted:
            "Label Muted"
        case .labelStrong:
            "Label Strong"
        case .labelAndExtraLabel:
            "Label and extra label"
        }
    }

    var technicalDescription: String {
        switch self {
        case let .label(text):
            ".label(Text(\"\(text)\"))"
        case let .labelMuted(text):
            ".labelMuted(Text(\"\(text)\"))"
        case let .labelStrong(text):
            ".labelStrong(Text(\"\(text)\"))"
        case let .labelAndExtraLabel(text, text2):
            ".labelAndExtraLabel(Text(\"\(text)\"), Text(\"\(text2)\"))"
        }
    }

    public static func == (
        lhs: OUDSListItemTrailing.TextType,
        rhs: OUDSListItemTrailing.TextType) -> Bool
    {
        lhs.formattedName == rhs.formattedName
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(formattedName)
    }
}
