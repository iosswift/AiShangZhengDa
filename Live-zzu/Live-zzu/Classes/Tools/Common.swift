//
//  Common.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/25.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit


let kStatusBarH : CGFloat = 20
let kNavigationBarH : CGFloat = 44
let kTabbarH : CGFloat = 44

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height



//创建userDefault
let userDefault = UserDefaults.standard



//图片存储本地的方法
func setimageuserdefault (image: UIImage){
    
    //将对象转换成Data流
    let image2 = UIImage(cgImage: image.cgImage!, scale: image.scale,
                         orientation: image.imageOrientation)
    let imageData = NSKeyedArchiver.archivedData(withRootObject: image2)
    //存储Data对象
    userDefault.set(imageData, forKey: "imageData")
    
    
    
    
}
//取出图片存储本地的方法
func getimageuserdefualt() -> UIImage{
    //UIImage对象读取
    //获取Data
    let objData = userDefault.data(forKey: "imageData")
    //还原对象
    let myImage = NSKeyedUnarchiver.unarchiveObject(with: objData!) as? UIImage
    
    return myImage!
}







