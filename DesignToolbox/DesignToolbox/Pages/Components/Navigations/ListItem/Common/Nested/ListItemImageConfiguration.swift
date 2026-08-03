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

open class ListItemImageConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: OUDSListItemSize

    @Published var size: OUDSListItemImage.Size {
        didSet { updateCode() }
    }

    @Published var ratio: OUDSListItemImage.Ratio {
        didSet { updateCode() }
    }

    @Published var contentMode: ContentMode {
        didSet { updateCode() }
    }

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        size = .medium
        ratio = .square
        contentMode = .fit

        super.init()
    }

    deinit {}

    // MARK: Builder

    @MainActor
    func image(for theme: OUDSTheme) -> OUDSListItemImage {
        OUDSListItemImage(asset: Image.brandedPlaceholderImage(for: theme.name),
                          description: "app_components_listItem_image_a11y".localized(),
                          size: size,
                          ratio: ratio,
                          contentMode: contentMode)
    }

    // MARK: Code helper

    override func updateCode() {
        code =
            """
            .init(asset: \"\(Image.placeholderImageSample())\"
                \(sizePattern)
                \(ratioPattern)
                \(contentModePattern)
                \(descriptionPattern))
            """
    }

    private var sizePattern: String {
        ", size: \(size.technicalDescription)"
    }

    private var ratioPattern: String {
        ", ratio: \(ratio.technicalDescription)"
    }

    private var contentModePattern: String {
        ", contentMode: \(contentMode.technicalDescription)"
    }

    private var descriptionPattern: String {
        ", description: \"\("app_components_listItem_image_a11y".localized())\""
    }
}

struct ListItemImageConfiguration: View {

    @ObservedObject var configurationModel: ListItemImageConfigurationModel

    var body: some View {
        if configurationModel.itemSize == .standard {
            OUDSChipPicker(title: "app_components_listItem_imageSize_tech".localized(),
                           selection: $configurationModel.size,
                           chips: OUDSListItemImage.Size.chips)
        }

        OUDSChipPicker(title: "app_components_listItem_imageRatio_tech".localized(),
                       selection: $configurationModel.ratio,
                       chips: OUDSListItemImage.Ratio.chips)

        OUDSChipPicker(title: "app_components_listItem_imageContentMode_tech".localized(),
                       selection: $configurationModel.contentMode,
                       chips: ContentMode.chips)
    }
}

// MARK: - Extensions of OUDSListItemSize

extension OUDSListItemSize: @retroactive CaseIterable {}
extension OUDSListItemSize: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemSize] = [.standard, .small]
}

// MARK: - Extensions of OUDSListItemImage.Size

extension OUDSListItemImage.Size: @retroactive CaseIterable {}
extension OUDSListItemImage.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemImage.Size] = [
        .medium, .large, .extraLarge,
    ]
}

// MARK: - Extensions of OUDSListItemImage.Ratio

extension OUDSListItemImage.Ratio: @retroactive CaseIterable {}
extension OUDSListItemImage.Ratio: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemImage.Ratio] = [.square, .widescreen]
}

// MARK: - Extensions of ContentMode

extension ContentMode: DesignToolboxEnumRepresentable {}
