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
import Foundation

/// User defaults keys shared between the sandbox surfaces (`AboutPage` toggle
/// and `MainView` tab bar).
enum SandboxUserDefaultsKeys {

    /// Key backing the "Bac à sable" switch item in the About page.
    /// Persisted with reverse-DNS notation like other global demo-app flags.
    static let sandboxEnabled = "com.orange.ouds.demoapp.sandboxEnabled"
}
#endif
