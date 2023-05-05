//
//  GifImageContent.swift
//  Fi2
//
//  Created by Joseph William Santoso on 29/03/23.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}



