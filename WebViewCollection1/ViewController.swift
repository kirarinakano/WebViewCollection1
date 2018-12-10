//
//  ViewController.swift
//  WebViewCollection1
//
//  Created by kirari on 2018/12/04.
//  Copyright © 2018 kirari. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var selectednumber = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    var urlArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
        urlArray = ["https://www.sejuku.net/blog/33867",
                    "https://qiita.com/search?utf8=%E2%9C%93&sort=&q=swift+strong+weak",
                    "https://qiita.com/masa08/items/71c677265ac9fd2d73db",
                    "http://jazzsasori.hatenablog.com/entry/2014/02/10/231307",
                    "https://qiita.com/narukun/items/326bd50a78cf34371169"]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "web"{
            
            let webVC: WebViewController = segue.destination as! WebViewController
            
            webVC.urlString = urlArray[selectednumber]
        }
        
    }
}


extension ViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        let urlLabel = cell.viewWithTag(1) as! UILabel

        urlLabel.text = urlArray[indexPath.row]

        return cell

    }
}


extension ViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        selectednumber = indexPath.row

        //画面遷移
        performSegue(withIdentifier: "web", sender: nil)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 149
    }

}
