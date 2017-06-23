//
//  CollectionNormalCell.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/26.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionNormalCell: UICollectionViewCell {

    @IBOutlet weak var iconimageView: UIImageView!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    var xinxi : XinXiModel?{
        didSet{
            //校验模型是否有值
            guard let xinxi = xinxi else { return }
            
            //显示昵称
            nickNameLabel.text = xinxi.nickname
            
            //设置封面图片
            guard let iconURL = URL(string : xinxi.vertical_src) else { return }
            iconimageView.kf.setImage(with: iconURL)
            
            
            
            
        }
    }
    
    
   
}
