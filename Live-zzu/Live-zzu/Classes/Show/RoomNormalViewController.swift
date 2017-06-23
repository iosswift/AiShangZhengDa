//
//  RoomNormalViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/28.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class RoomNormalViewController: UIViewController, UIGestureRecognizerDelegate {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let  webView = UIWebView(frame: UIScreen.main.bounds)
       let url = URL(string: "http://news.zzu.edu.cn")
        let request = NSURLRequest(url: url!)
        webView.loadRequest(request as URLRequest)
        webView.scalesPageToFit = true
        self.view.addSubview(webView)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//         //隐藏导航栏
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }

   
}
