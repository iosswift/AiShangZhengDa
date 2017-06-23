//
//  RecommendViewModel.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/27.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class RecommendViewModel {
    // MARK:- 懒加载属性
    public lazy var xinxiGroups : [XinXiGroup] = [XinXiGroup]()
     lazy var cycleModels : [CycleModel] = [CycleModel]()
}



//MARK:-发送网络请求
extension RecommendViewModel{
    
    
    //请求推荐数据
    func requestData(_ finishCallback : @escaping () -> ()){
        
        //请求第一部分的数据
        
        //请求第二部分的数据
        
        //请求第三部分的数据
        
        // 2.创建Group
        let dGroup = DispatchGroup()
        
         // http://capi.douyucdn.cn/api/v1/getHotCate?limit=3&offset=1&time=1490597997
        
        // 请求推荐数据
        dGroup.enter()
        NetworkTools.requestData(URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", type: .get, parameters: ["limit":"4","offset":"0","time": NSDate.getCurrentTime() as NSString]) {
            (result) in
           
            
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data该key,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            //3遍历数组，获取字典，并且将字典转成模型对象
            for dict in dataArray{
                let group = XinXiGroup(dict: dict)
                
                self.xinxiGroups.append(group)
                
            }
            // 3.3.离开组
            dGroup.leave()
            
            
            
//            for group in self.xinxiGroups {
//                for xinxi in group.xinxis {
//                    
//                    print(xinxi.nickname)
//                }
//               
//            }
            
            // 所有的数据都请求到,之后进行排序
            dGroup.notify(queue: DispatchQueue.main) {
                
                finishCallback()
                
//                print("tyuio")
            }
            
            
            
        }

        
    }
    //请求无限轮播的数据
    func requestCycleData(_ finishCallback : @escaping () -> ()) {
        NetworkTools.requestData(URLString: "http://www.douyutv.com/api/v1/slide/",type: .get,  parameters: ["version" : "2.300"]) { (result) in
            // 1.获取整体字典数据
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data的key获取数据
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3.字典转模型对象
            for dict in dataArray {
                self.cycleModels.append(CycleModel(dict: dict))
            }
            
            finishCallback()
        }
    }

    
}
