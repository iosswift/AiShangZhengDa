//
//  BiaoBaiViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/4/8.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class BiaoBaiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        addBackBtn()
        
        let button1 = UIButton(frame:CGRect(x:10, y:100, width:60, height:60))
        button1.setBackgroundImage(UIImage(named:"love_card.png"), for:.normal)
        button1.center.x = self.view.bounds.width / 2
        
        let label1 = UILabel(frame:CGRect(x:10, y:170, width:60, height:30))
        label1.text = "表白卡"
        label1.textColor = UIColor.white
        label1.textAlignment = .center
        label1.center.x = self.view.bounds.width / 2
        self.view.addSubview(label1)
        self.view.addSubview(button1)
        
        let button2 = UIButton(frame:CGRect(x:10, y:250, width:60, height:60))
        button2.setBackgroundImage(UIImage(named:"love_card.png"), for:.normal)
        button2.center.x = self.view.bounds.width / 2
        let label2 = UILabel(frame:CGRect(x:10, y:320, width:60, height:30))
        label2.text = "亲口说"
        label2.textColor = UIColor.white
        label2.textAlignment = .center
        label2.center.x = self.view.bounds.width / 2
        self.view.addSubview(label2)
        
        self.view.addSubview(button2)
        
        let button3 = UIButton(frame:CGRect(x:10, y:400, width:60, height:60))
        button3.setBackgroundImage(UIImage(named:"love_pro.png"), for:.normal)
        button3.center.x = self.view.bounds.width / 2
        
        let label3 = UILabel(frame:CGRect(x:10, y:470, width:70, height:30))
        label3.text = "爱的专题"
        label3.textColor = UIColor.white
        label3.textAlignment = .center
        label3.center.x = self.view.bounds.width / 2
        self.view.addSubview(label3)
        
        self.view.addSubview(button3)
        
        
        let imageView = UIImageView(image:UIImage(named:"love_text.png"))
        imageView.frame = CGRect(x:10, y:550, width:200, height:40)
        imageView.center.x = self.view.bounds.width / 2
        self.view.addSubview(imageView)
        
        
    }
    
    //导航返回设置
    func addBackBtn(){
        let img=UIImage(named: "fragment_back.png")
        let leftBtn:UIBarButtonItem=UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: #selector(BiaoBaiViewController.actionBack))
        
        
        
        leftBtn.tintColor=UIColor.gray
        
        self.navigationItem.leftBarButtonItem=leftBtn;
        
    }
    
    //返回按钮事件
    
    func actionBack(){
        
        self.presentingViewController!.dismiss(animated: true, completion: nil)
        
    }



}
