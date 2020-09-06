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
    let messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
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
        activityIndicator("Please Wait...")

        let myURL = URL(string:"https://www.bottlerocketstudios.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    
    func activityIndicator(_ title: String) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = title
        strLabel.font = .systemFont(ofSize: 14, weight: .medium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2-10 , width: 160, height: 50)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }
}
