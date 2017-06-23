//
//  CollectionCycleCell.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/28.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    // MARK: 定义模型属性
    var cycleModel : CycleModel? {
        didSet {
           
            let iconURL = URL(string: cycleModel?.pic_url ?? "")!
            iconImageView.kf.setImage(with: iconURL)
        }
    }

}
