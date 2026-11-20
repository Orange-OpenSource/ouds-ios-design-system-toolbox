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

// MARK: - Design Toolbox Component Status

/// The maturity status of a component presented in the Design System Toolbox.
///
/// To flag a component as draft or WIP, declare `let status: DesignToolboxComponentStatus = .draft`
/// in its `DesignToolboxElement` and give it to the `DesignToolboxElementPage`. Components without status are `.stable` (in production).
enum DesignToolboxComponentStatus {
    /// In production, nothing is displayed.
    case stable
    /// Available for use but design not finalized.
    case draft
    /// Work in progress, limited functionality.
    case wip

    // swiftlint: disable switch_case_on_newline
    /// The key of the label displayed in the tag, `nil` if stable.
    var tagKey: LocalizedStringKey? {
        switch self {
        case .stable: nil
        case .draft: "app_components_status_draft_tag"
        case .wip: "app_components_status_wip_tag"
        }
    }

    /// The key of the message displayed in the inline alert, `nil` if stable.
    var alertKey: LocalizedStringKey? {
        switch self {
        case .stable: nil
        case .draft: "app_components_status_draft_alert"
        case .wip: "app_components_status_wip_alert"
        }
    }

    /// The text vocalized for the accessibility of the status, `nil` if stable.
    var accessibilityKey: String? {
        switch self {
        case .stable: nil
        case .draft: "app_components_status_draft_tag"
        case .wip: "app_components_status_wip_tag"
        }
    }
    // swiftlint: enable switch_case_on_newline
}

// MARK: - Status tag

/// The tag displaying the status, nothing if stable.
struct DesignToolboxComponentStatusTag: View {

    let status: DesignToolboxComponentStatus

    var body: some View {
        if let key = status.tagKey {
            OUDSTag(key, status: .info(leading: .none), appearance: .emphasized, shape: .rounded, size: .small)
        }
    }
}

// MARK: - Status alert

/// The inline alert describing the status, nothing if stable.
struct DesignToolboxComponentStatusAlert: View {

    let status: DesignToolboxComponentStatus

    var body: some View {
        if let key = status.alertKey {
            OUDSInlineAlert(key, status: .info)
        }
    }
}
