//
//  XiTongSheZhiViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/4/8.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class XiTongSheZhiViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addBackBtn()
    }
    
    //导航返回设置
    func addBackBtn(){
        let img=UIImage(named: "fragment_back.png")
        let leftBtn:UIBarButtonItem=UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: #selector(XiTongSheZhiViewController.actionBack))
        
        
         
        leftBtn.tintColor=UIColor.gray
        
        self.navigationItem.leftBarButtonItem=leftBtn;
        
    }
    
    //返回按钮事件
    
    func actionBack(){
        
        self.presentingViewController!.dismiss(animated: true, completion: nil)
        
    }
    


}
