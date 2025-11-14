//
//  Image+extensions.swift.tmp.swift
//  DesignToolbox
//
//  Created by Pierre-Yves Lapersonne on 14/11/2025.
//

import OUDSSwiftUI
import SwiftUI

extension Image {

    /// Returns a default `Image` view with Orange asset
    static func defaultImage() -> Image {
        Image(decorative: "Orange/tips-and-tricks")
    }

    /// Returns a default `Image` view with a prefix in the name, upposed to be theme assets folder.
    /// Supposed ot have in the Design System Toolbox, in assets folder, folders with assets "providing namespaces".
    static func defaultImage(prefixedBy themeName: String) -> Image {
        Image(decorative: "\(themeName)/tips-and-tricks")
    }

    /// Returns a Swift sample code for design toolbox app faking the use of an image
    static func defaultImageSample() -> String {
        "Image(decorative: \"tips-and-tricks\")"
    }
}
