//
//  WebViewController.swift
//  ShortIt
//
//  Created by Александр on 16/01/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    lazy var wkWebView = WKWebView(frame: view.frame)
    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wkWebView.navigationDelegate = self
        wkWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let request = URLRequest(url: url)
        wkWebView.load(request)
        
        view.addSubview(wkWebView)
    }
}
