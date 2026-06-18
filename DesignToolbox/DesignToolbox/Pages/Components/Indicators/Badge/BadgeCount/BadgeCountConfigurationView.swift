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

// MARK: - Badge Count Configuration Model

/// The model shared between `BadgeCountPageConfiguration` view and `BadgeCountPageComponent` view.
final class BadgeCountConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var countSize: OUDSBadgeCount.Size {
        didSet { updateCode() }
    }

    @Published var status: OUDSBadgeStandard.Status {
        didSet { updateCode() }
    }

    @Published var countText: String {
        didSet { updateCode() }
    }

    // MARK: - Properties

    var count: UInt8 {
        UInt8(countText) ?? 1
    }

    // MARK: Initializer

    override init() {
        enabled = true
        countSize = .medium
        status = .neutral
        countText = "1"
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSBadgeCount(\(count), accessibilityLabel: someLabel, \(statusPattern), \(sizePattern))
        \(disablePattern)
        """
    }

    private var disablePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var sizePattern: String {
        "size: \(countSize.technicalDescription)"
    }
}

// MARK: - Badge Count Configuration View

struct BadgeCountConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: BadgeCountConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            OUDSChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.countSize,
                           chips: OUDSBadgeCount.Size.chips)

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.status,
                           chips: OUDSBadgeStandard.Status.chips)

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.countText, label: "app_components_badge_count_tech")
                    .numberPadKeyboard()
            }
        }
    }
}

extension OUDSBadgeCount.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSBadgeCount.Size] = [.medium, .large]
}
