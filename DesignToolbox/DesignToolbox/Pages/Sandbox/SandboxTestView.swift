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

#if DEBUG
import OUDSSwiftUI
import SwiftUI

/// Flags and constants used by the DEBUG-only sandbox mode.
///
/// The sandbox is a debug playground surfaced as a dedicated tab at the very
/// first position of the tab bar. It is only compiled and displayed in `DEBUG`
/// builds and is gated at runtime by a user preference toggled from the About
/// page (see ``SandboxUserDefaultsKeys/sandboxEnabled``).
///
/// When ``kSandboxContainsThings`` is `false`, the sandbox tab displays a
/// placeholder view. When set to `true`, the sandbox tab loads
/// `SandboxTestView`, which is the surface intended to be pimped with
/// experimentations and debug helpers.

/// Toggle indicating whether the sandbox tab has actual content to display.
///
/// - `false` (default): the sandbox displays a placeholder (icon + labels).
/// - `true`: the sandbox loads `SandboxTestView` for experimentations.
///
/// Flip this flag when you start populating the sandbox with real content.
let kSandboxContainsThings: Bool = true

/// Actual sandbox surface, loaded when ``kSandboxContainsThings`` is `true`.
///
/// This view is intentionally empty by default so it can be pimped later with
/// experimentations, debug helpers and prototypes without touching the
/// scaffolding around it.
///
/// Current experiment: a "call history" list built with `OUDSStaticListItem`,
/// used to try out the new list item API (overline styling, custom trailing views).
struct SandboxTestView: View {

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        List {
            ForEach(Self.callHistoryEntries) { entry in
                OUDSStaticListItem(data: entry.listItemData(theme: theme, colorScheme: colorScheme),
                                   leading: .custom {
                                       CallStatusIndicator(status: entry.status)
                                   })
            }
        }
        .listStyle(.plain)
    }
}

// MARK: - Call history sample data

private struct CallHistoryEntry: Identifiable {
    enum Status {
        case answered
        case missed
        case blocked
        case reported
    }

    let id = UUID()
    let name: String
    let subtitle: String
    let overline: String?
    let status: Status

    func listItemData(theme: OUDSTheme, colorScheme: ColorScheme) -> OUDSListItemData {
        switch status {
        case .blocked:
            OUDSListItemData(label: name,
                             overline: AttributedString.from(text: "Blocked",
                                                             foregroundColor: theme.colors.contentStatusNegative.color(for: colorScheme),
                                                             font: Font.system(size: 12, weight: .bold)),
                             description: subtitle)
        case .reported:
            OUDSListItemData(label: name,
                             overline: AttributedString.from(text: "Reported",
                                                             foregroundColor: theme.colors.contentStatusInfo.color(for: colorScheme),
                                                             font: Font.system(size: 12, weight: .bold)),
                             description: subtitle)
        case .answered, .missed:
            OUDSListItemData(label: name, description: subtitle, overline: overline)
        }
    }
}

extension SandboxTestView {
    fileprivate static let callHistoryEntries: [CallHistoryEntry] = [
        CallHistoryEntry(name: "Léa Martin", subtitle: "06 12 34 56 78 · 2 min", overline: "Incoming call", status: .answered),
        CallHistoryEntry(name: "Numéro masqué", subtitle: "Unknown · Today, 09:14", overline: nil, status: .blocked),
        CallHistoryEntry(name: "Karim Haddad", subtitle: "07 98 76 54 32 · Yesterday", overline: "Missed call", status: .missed),
        CallHistoryEntry(name: "Service Client Orange", subtitle: "3900 · Today, 11:02", overline: nil, status: .reported),
        CallHistoryEntry(name: "Sophie Nguyen", subtitle: "06 45 12 78 90 · 5 min", overline: "Outgoing call", status: .answered),
        CallHistoryEntry(name: "Thomas Dubois", subtitle: "06 22 11 33 44 · 12 min", overline: "Incoming call", status: .answered),
        CallHistoryEntry(name: "+33 6 55 44 33 22", subtitle: "Unknown · Yesterday", overline: "Missed call", status: .missed),
        CallHistoryEntry(name: "Amandine Roche", subtitle: "06 09 08 07 06 · 1 min", overline: "Outgoing call", status: .answered),
    ]
}

/// A small custom leading indicator for a call history item: a colored circle
/// (blue, red, grey, yellow or green) used to illustrate the `.custom` leading
/// slot of `OUDSStaticListItem`.
///
/// - `.green`: displays a checkmark (call successfully handled).
/// - `.yellow`: displays an `OUDSCircularProgressIndicator` inside the circle (ongoing/pending state).
private struct CallStatusIndicator: View {

    enum Kind {
        case blue
        case red
        case grey
        case yellow
        case green
    }

    let status: CallHistoryEntry.Status

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    private var kind: Kind {
        switch status {
        case .answered: .green
        case .missed: .yellow
        case .blocked: .red
        case .reported: .blue
        }
    }

    private var color: Color {
        switch kind {
        case .blue: theme.colors.contentStatusInfo.color(for: colorScheme)
        case .red: theme.colors.contentStatusNegative.color(for: colorScheme)
        case .grey: Color(hexadecimalCode: theme.colors.repositoryNeutralMutedMedium) ?? .gray
        case .yellow: theme.colors.contentStatusWarning.color(for: colorScheme)
        case .green: theme.colors.contentStatusPositive.color(for: colorScheme)
        }
    }

    private static let diameter: CGFloat = 40

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: Self.diameter, height: Self.diameter)

            switch kind {
            case .green:
                Image(systemName: "checkmark")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
            case .yellow:
                OUDSCircularProgressIndicator(status: .neutral, track: false, size: 26)
            case .blue, .red, .grey:
                EmptyView()
            }
        }
        .accessibilityHidden(true)
    }
}
#endif
