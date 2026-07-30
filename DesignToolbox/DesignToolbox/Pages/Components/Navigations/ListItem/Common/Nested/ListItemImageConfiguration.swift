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

    // MARK: Initializer

    init(itemSize: OUDSListItemSize) {
        self.itemSize = itemSize

        size = .medium

        super.init()
    }

    // MARK: Builder

    @MainActor
    var image: OUDSListItemImage {
        OUDSListItemImage(asset: Image.placeholderImage(),
                          size: size,
                          description: "Image description")
    }

    // MARK: Code helper

    override func updateCode() {
        code = ".init(asset; \"\(Image.placeholderImageSample())\", description: \"Image description\", size: \(size.technicalDescription))"
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
