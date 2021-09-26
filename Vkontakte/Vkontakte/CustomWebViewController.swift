//
//  WKWebViewController.swift
//  Vkontakte
//
//  Created by Lera on 21.09.21.
//

import UIKit
import WebKit

class CustomWebViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var webview: WKWebView! {
        didSet {
            webview.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorize()
    }
    
    // создаем конструктор
    func authorize() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7938051"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.81")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
    }
}

// MARK: Extensions

extension CustomWebViewController: WKNavigationDelegate {
    // метод перехвата ответов сервера при переходе
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // проверяем URL на который было совершено перенаправление
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        // получаем словарь с параметрами
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce ( [String: String] () ) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"],
              let userId = params["user_id"]
        else { return }
        
        MySession.shared.token = token
        MySession.shared.userId = userId
        
        print("My token is \(token)")
        print("Mu userID is \(userId)")
        
        performSegue(withIdentifier: "toTabBar", sender: self)
        decisionHandler(.cancel)
    }

}

