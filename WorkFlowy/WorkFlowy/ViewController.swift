//
//  ViewController.swift
//  WorkFlowy
//
//  Created by 이민호 on 2023/07/12.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var myWebView: WKWebView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage()
    }
    
    func loadWebPage() {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
}

