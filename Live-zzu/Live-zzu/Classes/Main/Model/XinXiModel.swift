//
//  XinXiModel.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/27.
//  Copyright © 2017年 如是我闻. All rights reserved.
//


import UIKit

class XinXiModel: NSObject {
   //房间ID
    var room_id : Int = 0
    
    //房间图片对应的urlstring
    var vertical_src : String = ""
    
    /// 判断是手机直播还是电脑直播
    // 0 : 电脑直播(普通房间) 1 : 手机直播(秀场房间)
    //var isVertical : Int = 0
    
    //房间名称
    var room_name : String = ""
    //主播昵称
    var nickname : String = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
        
        
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
    
}
