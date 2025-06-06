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

    init(orientation: Orientation, selectedColor: OUDSDividerColor = .borderDefault) {
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

    @StateObject var model: DividerConfigurationModel

    // MARK: Body

    var body: some View {
        DesignToolboxColorPicker {
            ForEach(OUDSDividerColor.allCases, id: \.id) { dividerColor in
                Button {
                    model.selectedColor = dividerColor
                } label: {
                    ColorEntry(dividerColor: dividerColor)
                }
            }
        } selectedColor: {
            ColorEntry(dividerColor: model.selectedColor)
        }
    }
}

private struct ColorEntry: View {

    let dividerColor: OUDSDividerColor
    @Environment(\.theme) private var theme

    var body: some View {
        DesignToolboxColorEntry(colorName: dividerColor.formattedName) {
            Rectangle().oudsBackground(dividerColor.colorToken(in: theme))
        }
    }
}

extension OUDSDividerColor: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static var allCases: [OUDSDividerColor] = [
        .borderDefault,
        .borderMuted,
        .borderEmphasized,
        .borderBrandPrimary,
        .borderOnBrandPrimary,
        .alwaysBlack,
        .alwaysOnBlack,
        .alwaysWhite,
        .alwaysOnWhite,
    ]

    // No l10n, tehchnical names
    var formattedName: String {
        switch self {
        case .borderDefault:
            "Border Default"
        case .borderMuted:
            "Border Muted"
        case .borderEmphasized:
            "Border Emphasized"
        case .borderBrandPrimary:
            "Border Brand Primary"
        case .borderOnBrandPrimary:
            "Border Brand On Primary"
        case .alwaysBlack:
            "Always Black"
        case .alwaysWhite:
            "Always White"
        case .alwaysOnBlack:
            "Always On Black"
        case .alwaysOnWhite:
            "Always On White"
        }
    }

    public var description: String {
        switch self {
        case .borderDefault:
            "borderDefault"
        case .borderMuted:
            "borderMuted"
        case .borderEmphasized:
            "borderEmphasized"
        case .borderBrandPrimary:
            "borderBrandPrimary"
        case .borderOnBrandPrimary:
            "borderOnBrandPrimary"
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
