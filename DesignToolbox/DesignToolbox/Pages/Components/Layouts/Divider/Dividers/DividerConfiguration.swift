//
// Software Name: OUDSThemesContract iOS
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

import OUDSComponents
import OUDSTokensSemantic
import SwiftUI

// MARK: - Divider Configuration Model

/// The model shared between `DividerPageConfiguration` view and `DividerPageComponent` view.
final class DividerConfigurationModel: ComponentConfiguration {

    // MARK: Stored properties

    let orientation: Orientation

    @Published var selectedColor: OUDSDividerColor {
        didSet { updateCode() }
    }

    enum Orientation {
        case horizontal
        case vertical
    }

    // MARK: Initializer

    init(orientation: Orientation, selectedColor: OUDSDividerColor = .default) {
        self.selectedColor = selectedColor
        self.orientation = orientation
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code =
            """
            \(dividerPattern)(color: .\(selectedColor)) {
            }
            """
    }

    private var dividerPattern: String {
        orientation == .horizontal ? "OUDSHorizontalDivider" : "OUDSVerticalDivider"
    }
}

// MARK: - Divider Configuration View

struct DividerConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: DividerConfigurationModel

    // MARK: Body

    var body: some View {
        DesignToolboxColorPicker {
            ForEach(OUDSDividerColor.allCases, id: \.id) { dividerColor in
                Button {
                    configurationModel.selectedColor = dividerColor
                } label: {
                    ColorEntry(dividerColor: dividerColor)
                }
            }
        } selectedColor: {
            ColorEntry(dividerColor: configurationModel.selectedColor)
        }
    }
}

private struct ColorEntry: View {

    let dividerColor: OUDSDividerColor
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        DesignToolboxColorEntry(colorName: dividerColor.formattedName) {
            Rectangle().fill(dividerColor.colorToken(in: theme).color(for: colorScheme))
        }
    }
}

extension OUDSDividerColor: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    nonisolated(unsafe) public static var allCases: [OUDSDividerColor] = [
        .default,
        .muted,
        .emphasized,
        .brandPrimary,
        .onBrandPrimary,
        .alwaysBlack,
        .alwaysWhite,
        .alwaysOnBlack,
        .alwaysOnWhite,
    ]

    // No l10n, tehchnical names
    var formattedName: String {
        switch self {
        case .default:
            "Default"
        case .muted:
            "Muted"
        case .emphasized:
            "Emphasized"
        case .brandPrimary:
            "Brand primary"
        case .onBrandPrimary:
            "On brand primary"
        case .alwaysBlack:
            "Always black"
        case .alwaysWhite:
            "Always white"
        case .alwaysOnBlack:
            "Always on black"
        case .alwaysOnWhite:
            "Always on white"
        }
    }

    public var description: String {
        switch self {
        case .default:
            "default"
        case .muted:
            "muted"
        case .emphasized:
            "emphasized"
        case .brandPrimary:
            "brandPrimary"
        case .onBrandPrimary:
            "onBrandPrimary"
        case .alwaysBlack:
            "alwaysBlack"
        case .alwaysWhite:
            "alwaysWhite"
        case .alwaysOnBlack:
            "alwaysOnBlack"
        case .alwaysOnWhite:
            "alwaysOnwhite"
        }
    }

    var id: String { description }
}
