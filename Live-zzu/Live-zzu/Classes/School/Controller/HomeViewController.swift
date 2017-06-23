//
//  HomeViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/25.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

public let kTitleViewH : CGFloat = 40


class HomeViewController: UIViewController {
    
    
    //MARK:-懒加载属性
    public lazy var pageTitleView : PageTitleView = { [weak self] in
        
        let titleFrame = CGRect(x: 0, y: 10, width: kScreenW, height: kTitleViewH)
        
        let titles = ["学校","社会"]
        
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        //titleView.backgroundColor = UIColor.purple
        titleView.delegate = self
        
        return titleView
        
    }()
    
    
    public lazy var pageContentView : PageContentView = { [weak self] in
        
        // 1.确定内容的frame
        let contentH = kScreenH - kNavigationBarH - kTabbarH 
        let contentFrame = CGRect(x: 0, y:  kNavigationBarH+20 , width: kScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        
        childVcs.append(RecommendViewController())
         childVcs.append(SocietyViewController())
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
        }()
    
    
    
    override func viewDidLoad() {
        
        //MARK:-系统回调函数
        super.viewDidLoad()

        // 设置ui界面
        setupUI()
    }


}


//MARK: 设置UI界面

extension HomeViewController{
    public func  setupUI(){
        
        // 0.不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        //添加titleview
        self.navigationController!.navigationBar.addSubview(pageTitleView)
        // 添加ContentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
    }
    
    
}




// MARK:- 遵守PageTitleViewDelegate协议
extension HomeViewController : PageTitleViewDelegate {
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(index)
       
    }
}



// MARK:- 遵守PageContentViewDelegate协议
extension HomeViewController : PageContentViewDelegate {
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}

