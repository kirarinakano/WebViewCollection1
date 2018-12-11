# Tips

## **Could not signal service com.apple.WebKit.WebContent: 113: Could not find specified service** が表示されてWebPageが表示されない

　このメッセージが出たときに想定される問題はいろいろあるようだが、今回発見された問題は、URLRequest(url:cachePolicy: timeoutInterval:)に `.returnCacheDataDontLoad` を指定していたことが原因だった。
　
　キャッシュがないとエラーになるというcachePolicyなので当然そうなるよなあという感想😇
　サンプルコードにあったのだろうか・・・教訓としては引数の意味を把握してから使用しようというところ。
　ATSやWKWebViewの認証周りを疑ったので問題解決にめちゃくちゃ遠回りしてしまったorz
