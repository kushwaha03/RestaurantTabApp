//
//  InternetsViewController.swift
//  Rocket
//
//  Created by kashee kushwaha on 03/06/20.
//  Copyright © 2020 kashee kushwaha. All rights reserved.
//

import UIKit
import WebKit
class InternetsViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self


        let viewDemo = UIView()
        viewDemo.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 91)
        viewDemo.backgroundColor = UIColor.green
        self.webView.addSubview(viewDemo)


        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.bottlerocketstudios.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}
