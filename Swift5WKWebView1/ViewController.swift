//
//  ViewController.swift
//  Swift5WKWebView1
//
//  Created by 山本ののか on 2020/04/23.
//  Copyright © 2020 Nonoka Yamamoto. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    //これで実体になる
    var webView = WKWebView()
    
    @IBOutlet weak var toolBar: UIToolbar!
    

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //大きさ
        webView.frame = CGRect(x:0 , y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height * 2)
        view.addSubview(webView)
        
        //何をロードするのか
        webView.navigationDelegate = self
        let url = URL(string: "https://www.yahoo.co.jp/")
        let request = URLRequest(url: url!,timeoutInterval: 500)
        //let request = URLRequest(url: https://www.yahoo.co.jp/)でもOK
        webView.load(request)
        
        //indicatorを追加
        webView.addSubview(indicator)
    }

    //ロードが開始された時
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        print("読み込み開始")
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        print("ロード終了")
        indicator.stopAnimating()
    }

    @IBAction func go(_ sender: Any) {
        
        webView.goForward()
    }
    
    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
    }
}

