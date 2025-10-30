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

#if os(iOS)
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    enum ContentSource {
        case url(URL)
        case html(String)
    }

    let source: ContentSource

    init(from url: URL) {
        source = .url(url)
    }

    // MARK: UIViewRepresentable

    @MainActor
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    @MainActor
    func updateUIView(_ webView: WKWebView, context: Context) {
        switch source {
        case let .url(url):
            let request = URLRequest(url: url)
            webView.load(request)
        case let .html(string):
            webView.loadHTMLString(string, baseURL: nil)
        }
    }
}

#elseif os(macOS)
import AppKit
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    enum ContentSource {
        case url(URL)
        case html(String)
    }

    let source: ContentSource

    init(from url: URL) {
        source = .url(url)
    }

    init(html: String) {
        source = .html(html)
    }

    // MARK: NSViewRepresentable

    @MainActor
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    @MainActor
    func updateNSView(_ webView: WKWebView, context: Context) {
        switch source {
        case let .url(url):
            let request = URLRequest(url: url)
            webView.load(request)
        case let .html(string):
            webView.loadHTMLString(string, baseURL: nil)
        }
    }
}
#endif
