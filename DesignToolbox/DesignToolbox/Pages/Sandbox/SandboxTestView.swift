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
let kSandboxContainsThings: Bool = false

/// Actual sandbox surface, loaded when ``kSandboxContainsThings`` is `true`.
///
/// This view is intentionally empty by default so it can be pimped later with
/// experimentations, debug helpers and prototypes without touching the
/// scaffolding around it.
///
/// Current experiment: a "call history" list built with `OUDSStaticListItem`,
/// used to try out the new list item API (overline styling, custom trailing views).
struct SandboxTestView: View {

    var body: some View {
        EmptyView()
    }
}
#endif
