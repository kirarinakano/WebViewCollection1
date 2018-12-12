//
//  WebViewController.swift
//  WebViewCollection1
//
//  Created by kirari on 2018/12/04.
//  Copyright © 2018 kirari. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    // MARK:  変数名は　lower camel caseで書こう。
    //var ActivityIndicator: UIActivityIndicatorView!
    var activityIndicator: UIActivityIndicatorView!
    var urlString: String! = ""

    @IBOutlet weak var webView:WKWebView! // MARK:  WKWebViewはStoryboardで初期化できないという情報がWebで散見されたが今は問題ないようだ
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:  呼び忘れ。StoryBoardにもIndicatorがあり、コードで初期化するかStoryboardで初期化するか決めよう。
        setIndicator()
        
        //URL型変換
        guard let url = URL(string: urlString) else {
            return
        }

        // MARK: 常にキャッシュを使用し、ないならエラーになるオプション。表示に失敗する原因はこれを指定していたせい😇
        // .returnCacheDataDontLoad -> https://developer.apple.com/documentation/foundation/nsurlrequest/cachepolicy/returncachedatadontload
        let req = URLRequest(url: url/*, cachePolicy: .returnCacheDataDontLoad, timeoutInterval: 100*/)
    
        
        webView.navigationDelegate = self
        self.webView.load(req)
    }
    
    func setIndicator() {
        //初期化
        activityIndicator = UIActivityIndicatorView()
        
        //サイズ
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .gray
        self.webView.addSubview(activityIndicator)
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

// MARK:  protocolの実装はextensionにしてfunctionの分類がつきやすくしよう
extension WebViewController: WKNavigationDelegate{
    
    //通信が開始されたときに勝手に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    //完了
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
}
