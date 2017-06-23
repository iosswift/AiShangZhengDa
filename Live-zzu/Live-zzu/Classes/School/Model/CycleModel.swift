//
//  CycleModel.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/28.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    // 标题
    var title : String = ""
    // 展示的图片地址
    var pic_url : String = ""
    // 主播信息对应的字典
    var room : [String : NSObject]? {
        didSet {
            guard let room = room else  { return }
            anchor = XinXiModel(dict: room)
            
        }
    }
    // 主播信息对应的模型对象
    var anchor : XinXiModel?
    
    
    // MARK:- 自定义构造函数
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
