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

// MARK: - Heading Configuration Model

/// The model shared between `HeadingPage` and `HeadingConfigurationView` views.
///
/// `OUDSHeading` exposes two exclusive ways of rendering a heading:
/// - a plain text, optionally decorated with a *marker* (only honored for `size == .large`
///   and if the current theme supports it)
/// - a text with a colored sub-string (only meaningful for `size == .large`)
///
/// Because these two modes cannot be combined, the demo exposes a single switch
/// (`hasColoredSubstring`) to let the user pick one mode or the other.
final class HeadingConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var coloredText: String {
        didSet { updateCode() }
    }

    @Published var size: OUDSHeading.Size {
        didSet { updateCode() }
    }

    @Published var hasMarker: Bool {
        didSet { updateCode() }
    }

    @Published var hasColoredSubstring: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        coloredText = String(localized: "app_components_common_label_label")
        size = .large
        hasMarker = false
        hasColoredSubstring = false
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        if hasColoredSubstring {
            code = """
            OUDSHeading(text: "\(text)", coloredText: "\(coloredText)")
            """
        } else {
            code = """
            OUDSHeading(text: "\(text)", size: \(size.technicalDescription), hasMarker: \(hasMarker))
            """
        }
    }

    func hasColoredSringSupported(by theme: OUDSTheme) -> Bool {
        let isSupported = !theme.hasTypographyHeadingLargeMarker
        if !isSupported, hasColoredSubstring {
            hasColoredSubstring = false
        }

        return isSupported
    }
}

// MARK: - Heading Configuration View

struct HeadingConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: HeadingConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                if !theme.hasTypographyHeadingLargeMarker {
                    OUDSSwitchItem("app_components_typography_coloredSubstring_tech", isOn: $configurationModel.hasColoredSubstring)
                } else {
                    OUDSSwitchItem("app_components_typography_marker_tech", isOn: $configurationModel.hasMarker)
                        .disabled(configurationModel.size != .large)
                }

                // Size is forced to `.large` when a colored sub-string is used.
                if !(configurationModel.hasColoredSringSupported(by: theme) && configurationModel.hasColoredSubstring) {
                    OUDSChipPicker(title: "app_components_common_size_tech",
                                   selection: $configurationModel.size,
                                   chips: OUDSHeading.Size.chips)
                }
            }

            if configurationModel.hasColoredSubstring {
                DesignToolboxEditContentDisclosure {
                    VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                        DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                        DesignToolboxTextField(text: $configurationModel.coloredText, label: "app_components_typography_coloredText_tech")
                    }
                }
            } else {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                }
            }
        }
    }
}

// MARK: - Heading Size extension

extension OUDSHeading.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSHeading.Size] = [.xLarge, .large, .medium, .small]
}
