//
//  ViewController.swift
//  Rocket
//
//  Created by kashee kushwaha on 03/06/20.
//  Copyright © 2020 kashee kushwaha. All rights reserved.
//


import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.262745098, green: 0.9098039216, blue: 0.5843137255, alpha: 1)
        let myURL = URL(string:"https://www.bottlerocketstudios.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}
