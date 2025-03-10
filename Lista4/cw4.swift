//
//  cw4.swift
//  Lista4
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI
import WebKit

struct Cw4View: View {
    var body: some View {
        WebView(url: URL(string: "https://www.apple.com")!)
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

#Preview {
    Cw4View()
}
