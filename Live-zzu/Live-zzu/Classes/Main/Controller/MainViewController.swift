//
//  MainViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/25.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

          addChildVc(storyName: "School")
          addChildVc(storyName: "Life")
          addChildVc(storyName: "Friend")
          addChildVc(storyName: "Speed signal")
          addChildVc(storyName: "Profile")
        
    }
    
    public func addChildVc(storyName: String){
        
        // Do any additional setup after loading the view.
        // 1. 通过storyboard获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        // 2.将childVc作为控制器
        addChildViewController(childVc)
    }
    
    
}
