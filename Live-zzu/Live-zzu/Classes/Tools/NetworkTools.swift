//
//  NetworkTools.swift
//  Alamofire的测试
//
//  Created by 如是我闻 on 2017/3/27.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType{
     case get
     case post
}





class NetworkTools {

    
    class func requestData(URLString :String,type : MethodType, parameters : [String : NSString]? = nil,finishedCallback : @escaping (_ result :AnyObject) ->()){
        


        
            //获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            //获取结果
        guard let result = response.result.value else{
            print(response.result.error as Any )
            return
            }
            // 将结果回调
            finishedCallback(result as AnyObject)
        }
    }
    
}
