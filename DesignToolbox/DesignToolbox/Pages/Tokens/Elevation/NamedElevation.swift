//
//  NamedElevatio.swift
//  DesignToolbox
//
//  Created by Pierre-Yves Lapersonne on 11/11/2025.
//
import OUDSSwiftUI
import SwiftUI

enum NamedElevation: String, CaseIterable {
    case none
    case raised
    case drag
    case `default`
    case emphasized
    case sticky

    func token(from theme: OUDSTheme) -> ElevationCompositeSemanticToken {
        switch self {
        case .none:
            theme.elevations.none
        case .raised:
            theme.elevations.raised
        case .drag:
            theme.elevations.drag
        case .default:
            theme.elevations.default
        case .emphasized:
            theme.elevations.emphasized
        case .sticky:
            theme.elevations.sticky
        }
    }
}
