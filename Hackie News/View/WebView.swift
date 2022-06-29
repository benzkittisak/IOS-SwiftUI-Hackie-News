//
//  WebView.swift
//  Hackie News
//
//  Created by Kittisak Panluea on 29/6/2565 BE.
//

import SwiftUI
// เราจะใช้ webview กันแหละ import Library มาก่อน
import WebKit

// หน้าเว็บวิวของเรา
struct WebView:UIViewRepresentable {
    
    let urlString:String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = urlString else { return }
        if let safeUrl = URL(string: url) {
            let request = URLRequest(url: safeUrl)
            uiView.load(request)
        }
    }
}
