//
//  TongXunViewController.swift
//  fenduan
//
//  Created by 如是我闻 on 2017/5/4.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import ContactsUI
class TongXunViewController: UIViewController,CNContactPickerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        //联系人选择控制器
        if #available(iOS 9.0, *) {
            let contactPicker = CNContactPickerViewController()
            //设置代理
            contactPicker.delegate = self
            //添加可选项目的过滤条件
            contactPicker.predicateForEnablingContact
                = NSPredicate(format: "emailAddresses.@count > 0", argumentArray: nil)
            //弹出控制器
            self.present(contactPicker, animated: true, completion: nil)

        } else {
            // Fallback on earlier versions
            print("出错")
        }
       
    }
    
    
    
    override func loadView() {
        super.loadView()
    
        addBackBtn()
        
    }
    
    //导航返回设置
    func addBackBtn(){
   
        let img=UIImage(named: "fragment_back.png")
        let leftBtn:UIBarButtonItem=UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: #selector(actionBack))
        
        leftBtn.tintColor=UIColor.gray
        
        self.navigationItem.leftBarButtonItem=leftBtn
        
    }
    
    //返回按钮事件
    
    func actionBack(){
        
       self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    //单选联系人
    @available(iOS 9.0, *)
    func contactPicker(_ picker: CNContactPickerViewController,
                       didSelect contact: CNContact) {
        //获取联系人的姓名
        let lastName = contact.familyName
        let firstName = contact.givenName
        print("选中人的姓：\(lastName)")
        print("选中人的名：\(firstName)")
        
        //获取联系人电话号码
        print("选中人电话：")
        let phones = contact.phoneNumbers
        for phone in phones {
            //获得标签名（转为能看得懂的本地标签名，比如work、home）
            let phoneLabel = CNLabeledValue<NSString>.localizedString(forLabel: phone.label!)
            //获取号码
            let phoneValue = phone.value.stringValue
            print("\(phoneLabel):\(phoneValue)")
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
