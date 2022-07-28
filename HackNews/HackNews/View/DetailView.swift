//
//  DetailView.swift
//  HackNews
//
//  Created by AndyBrila on 25.07.2022.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url : String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.googel.com")
    }
}
struct WebView : UIViewRepresentable {
    let urlString : String?
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WebView.UIViewType {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
