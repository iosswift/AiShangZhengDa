//
//  NSDate-Extension.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/27.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import Foundation
extension NSDate {
    class func getCurrentTime() -> String {
        let nowDate = NSDate()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
