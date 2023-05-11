//
//  DetailView.swift
//  OakProject
//
//  Created by Akın Aksoy on 11.05.2023.
//

import SwiftUI
import WebKit
struct DetailView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
}
