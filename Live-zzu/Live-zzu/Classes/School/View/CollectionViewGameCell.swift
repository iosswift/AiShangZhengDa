//
//  CollectionViewGameCell.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/29.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionViewGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
//    
//    //定义模型属性
    var group : XinXiGroup?{
        didSet{
            let iconURL = URL(string: group?.icon_url ?? "")!
            iconImageView.kf.setImage(with: iconURL)
            
        }
    }

    
  
}
