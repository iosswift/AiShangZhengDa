//
//  RecommendGameView.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/29.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
public let kGameCellID = "kGameCellID"
public let kEdgeInsetMargin : CGFloat = 10
class RecommendGameView: UIView {
    
    // MARK: 定义数据的属性
    var groups : [XinXiGroup]? {
        didSet {
           
      
            // 刷新表格
            collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        
        
        
        // 注册Cell
       // collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "CollectionViewGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        // 给collectionView添加内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
         
    }
}


// MARK:- 提供快速创建的类方法
extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}


// MARK:- 遵守UICollectionView的数据源协议
extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionViewGameCell
       cell.group = groups![(indexPath.item)]
        
       //cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.blue
        
        
        
        return cell
    }
}
