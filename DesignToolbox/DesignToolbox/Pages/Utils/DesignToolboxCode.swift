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

import OUDS
import OUDSComponents
import OUDSTokensSemantic
import SwiftUI

struct DesignToolboxCode: View {

    // MARK: Stored properties

    let code: String
    let titleText: LocalizedStringKey

    @State private var isCodeVisible = false

    @Environment(\.theme) private var theme
    @Environment(\.layoutDirection) private var layoutDirection

    // MARK: Body

    var body: some View {
        DesignToolboxDisclosureGroup(isExpanded: $isCodeVisible, accessibilityLabel: "app_common_showCode_text_a11y".localized()) {
            codeTokenSection()
        } label: {
            Text(titleText)
                .bodyStrongLarge(theme)
                .oudsForegroundStyle(theme.colors.contentDefault)
                .padding(.vertical, theme.spaces.spacePaddingInlineSmall)
        }
    }

    private func codeTokenSection() -> some View {
        HStack(alignment: .firstTextBaseline, spacing: theme.spaces.spacePaddingBlockNone) {
            Text(code)
                .font(.system(.body, design: .monospaced))
                .oudsForegroundStyle(theme.colors.contentDefault)
                .padding(.vertical, theme.spaces.spacePaddingInlineSmall)
                .multilineTextAlignment(layoutDirection == .rightToLeft ? .trailing : .leading)
            // As the source code sample is written in english, keep text aligned on the left

            Spacer(minLength: theme.spaces.spacePaddingBlockMedium)

            OUDSButton(icon: Image("ic_copy"), accessibilityLabel: "app_common_copyCode_a11y".localized(), appearance: .minimal) {
                UIPasteboard.general.string = code
            }
        }
        .frame(minWidth: 72, maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, theme.spaces.spacePaddingInlineSmall)
        .padding(.leading, theme.spaces.spacePaddingInlineMedium)
        .oudsBackground(theme.colors.bgSecondary)
        .accessibilityElement(children: .combine)
        .accessibilityHint("app_common_copyCode_a11y")
        .overlay(
            Rectangle()
                .opacity(theme.opacities.invisible)
                .frame(minWidth: 40, maxWidth: .infinity, alignment: .leading)
                .oudsBorder(style: theme.borders.styeDefault,
                            width: theme.borders.widthThin,
                            radius: theme.borders.radiusDefault,
                            color: theme.colors.borderDefault))
    }
}
