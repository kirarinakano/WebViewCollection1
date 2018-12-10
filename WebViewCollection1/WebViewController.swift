//
//  WebViewController.swift
//  WebViewCollection1
//
//  Created by kirari on 2018/12/04.
//  Copyright © 2018 kirari. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    
    var ActivityIndicator: UIActivityIndicatorView!
    
    var urlString: String! = ""

    @IBOutlet weak var webView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //URL型変換
        guard let url = URL(string: urlString) else {
            return
        }

        let req = URLRequest(url: url, cachePolicy: .returnCacheDataDontLoad, timeoutInterval: 100)
    
        
        self.webView.load(req)
        webView.navigationDelegate = self
    }
    
    //通信が開始されたときに勝手に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        ActivityIndicator.startAnimating()
    }
    
    //完了
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        ActivityIndicator.stopAnimating()
    }
    
    func setIndicator() {
        //初期化
        ActivityIndicator = UIActivityIndicatorView()
        
        //サイズ
        ActivityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        ActivityIndicator.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        ActivityIndicator.hidesWhenStopped = true
        ActivityIndicator.style = .gray
        self.webView.addSubview(ActivityIndicator)
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func next(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func modoru(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webView.reload()
    }
    
}
