//
//  CollectionHeaderView.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/26.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    
   
        //模型属性
    var group : XinXiGroup?{
        didSet{
            titleLabel.text = group?.tag_name
        }
    }
    
        
    
}
