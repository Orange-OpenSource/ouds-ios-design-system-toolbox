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

#if os(iOS) && canImport(UIKit)

open class ListItemVideoConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: OUDSListItemSize

    @Published var size: OUDSListItemVideo.Size {
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
    var video: OUDSListItemVideo {
        .init(url: URL(string: String.defaultVideoUrl())!, autoplay: true, muted: true, size: size)
    }

    // MARK: Code helper

    override func updateCode() {
        code = ".init(asset: Image(\"ic_flag_FR_fr\"), size: \(size.technicalDescription))"
    }
}

struct ListItemVideoConfiguration: View {

    @ObservedObject var configurationModel: ListItemVideoConfigurationModel

    var body: some View {
        if configurationModel.itemSize == .standard {
            OUDSChipPicker(title: "app_components_listItem_videoSize_tech".localized(),
                           selection: $configurationModel.size,
                           chips: OUDSListItemVideo.Size.chips)
        }
    }
}


// MARK: - Extensions of OUDSListItemVideo.Size

extension OUDSListItemVideo.Size: @retroactive CaseIterable {}
extension OUDSListItemVideo.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSListItemVideo.Size] = [
        .medium, .large, .extraLarge,
    ]
}

#endif
