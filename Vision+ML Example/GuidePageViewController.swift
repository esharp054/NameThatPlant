//
//  GuidePageViewController.swift
//  Vision+ML Example
//
//  Created by Vianka Barboza on 12/8/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class GuidePageScene: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad(){
        super.viewDidLoad();
        
        let url = URL(string: "https://garden.org")!
        if MyVariables.plantToSearch == "" {
            webView.load(URLRequest(url: url))
        }
        else {
            let tempURL = "https://garden.org/plants/group/"
            let fullURL = tempURL+MyVariables.plantToSearch+"/"
            let searchURL = URL(string: fullURL)!
            webView.load(URLRequest(url: searchURL))
            MyVariables.plantToSearch = ""
        }
        webView.allowsBackForwardNavigationGestures = true
    }
 
}
