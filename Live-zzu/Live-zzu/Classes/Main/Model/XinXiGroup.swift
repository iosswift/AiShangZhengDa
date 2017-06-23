//
//  XinXiGroup.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/27.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class XinXiGroup: NSObject {
    //该组对应的房间信息
    var room_list : [[String : NSObject]]? {
        didSet{
            guard let room_list = room_list else { return}
            for dict in room_list {
                xinxis.append(XinXiModel(dict: dict))
            }
        }
    }
    
  //游戏对应图标
    var icon_url : String = ""
    
    //组显示的标题
    var tag_name :String = ""
    // 定义主播的模型对象数组
    
    public lazy var xinxis : [XinXiModel] = [XinXiModel]()
    
    
    //MARK：-构造函数
   override init() {
       
    }
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {    }
    
//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "room_list"{
//            if let dataArray = value as? [[String : NSObject]]{
//                for dict in dataArray {
//                    xinxis.append(XinXiModel(dict: dict))
//                }
//            }
//        }
//    }
    
}
