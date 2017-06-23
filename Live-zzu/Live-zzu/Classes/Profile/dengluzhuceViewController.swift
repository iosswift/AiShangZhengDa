//
//  dengluzhuceViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/4/9.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON

class dengluzhuceViewController: UIViewController ,UITextFieldDelegate {

  
    
    
    //输入框设置
    let textField1 = UITextField(frame: CGRect(x: 30, y: 250, width: 300, height: 35))
    let textField2 = UITextField(frame: CGRect(x: 30, y: 320, width: 300, height: 35))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackBtn()
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"login_bg.png")!)
        
        //设置边框样式为圆角矩形
        
        textField1.borderStyle = UITextBorderStyle.none
        textField1.placeholder="请输入手机号"
        
        
        textField2.borderStyle = UITextBorderStyle.none
        textField2.placeholder="请输入6-20位密码"
        textField2.isSecureTextEntry = true
        
        
        //当文字超出文本框宽度时，自动调整文字大小
        textField1.adjustsFontSizeToFitWidth=true
        textField1.minimumFontSize=14
        
        textField2.adjustsFontSizeToFitWidth=true
        textField2.minimumFontSize=14
        
        //是否显示清除按钮
        
        textField1.clearButtonMode=UITextFieldViewMode.always  //一直显示清除按钮
        textField2.clearButtonMode=UITextFieldViewMode.always  //一直显示清除按钮
        
        
        
        
        
        //设置键盘样式
        
        textField1.keyboardType = UIKeyboardType.default
        textField2.keyboardType = UIKeyboardType.default
        
        
        
        //设置键盘return键的样式
        textField1.returnKeyType = UIReturnKeyType.done //表示完成输入
        textField2.returnKeyType = UIReturnKeyType.done //表示完成输入
        
        
        //设置键盘风格
        textField1.keyboardAppearance = UIKeyboardAppearance.default//系统默认
        textField2.keyboardAppearance = UIKeyboardAppearance.default//系统默认
        //再次编辑时是否清空
        textField1.clearsOnBeginEditing = true
        textField2.clearsOnBeginEditing = true
        
        //设置输入框左侧头像
        let hadeimage1 = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        hadeimage1.image = UIImage.init(named: "login_phone.png")
        textField1.leftView = hadeimage1
        textField1.leftViewMode = .always
        
        let hadeimage2 = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        hadeimage2.image = UIImage.init(named: "login_pass.png")
        textField2.leftView = hadeimage2
        textField2.leftViewMode = .always
        
        //输入框下横线设置
        let line1 = UIView(frame: CGRect(x: 0, y: 33, width: textField1.frame.width, height: textField1.frame.height * 1 / 40))
        line1.backgroundColor = UIColor.lightGray
        
        
        let line2 = UIView(frame: CGRect(x: 0, y: 33, width: textField1.frame.width, height: textField1.frame.height * 1 / 40))
        line2.backgroundColor = UIColor.lightGray
        
        textField1.addSubview(line1)
        textField2.addSubview(line2)
        
        textField1.delegate = self
        textField2.delegate = self
        self.view.addSubview(textField1)
        self.view.addSubview(textField2)
        
        //按钮的创建
        let button1 = UIButton(frame:CGRect(x:30, y:380, width:300, height:30))
        let button2 = UIButton(frame:CGRect(x:30, y:430, width:100, height:30))
        let button3 = UIButton(frame:CGRect(x:250, y:430, width:100, height:30))
        //按键的圆角设置
        button1.layer.cornerRadius = 10
        //按钮的文字设置
        button1.setTitle("登陆", for:.normal) //普通状态下的文字
        button2.setTitle("新用户注册", for:.normal) //普通状态下的文字
        button3.setTitle("忘记密码？", for:.normal) //普通状态下的文字
        
        //按钮文字颜色的设置
        button1.setTitleColor(UIColor.blue, for: .highlighted) //触摸状态下文字的颜色
        
        button2.setTitleColor(UIColor.blue, for: .normal) //普通状态下文字的颜色
        button3.setTitleColor(UIColor.blue, for: .normal) //普通状态下文字的颜色
        //按钮背景颜色设置
        button1.backgroundColor = UIColor.blue
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
        
        button1.addTarget(self, action:#selector(tapped3), for:.touchUpInside)
        button2.addTarget(self, action:#selector(tapped1), for:.touchUpInside)
        button3.addTarget(self, action:#selector(tapped2), for:.touchUpInside)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
    }
    
    
    
    
    //导航返回设置
    func addBackBtn(){
        let img=UIImage(named: "fragment_back.png")
        let leftBtn:UIBarButtonItem=UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: #selector(GeRenZiLiaoViewController.actionBack))
        
        
        
        leftBtn.tintColor=UIColor.gray
        
        self.navigationItem.leftBarButtonItem=leftBtn;
        
    }
    //返回按钮事件
    
    func actionBack(){
        
        
        self.presentingViewController!.dismiss(animated: true, completion: nil)
        
    }
    
    
    func tapped1(){
        self.performSegue(withIdentifier: "zhuce", sender: nil)
        
    }
    func tapped2(){
        
        self.performSegue(withIdentifier: "mima", sender: nil)
    }
    
    func tapped3(){
        actionBack()
        let phone = textField1.text!
        userDefault.set("\(phone)", forKey: "phoneString")
        //(1）设置请求路径
        let url:NSURL = NSURL(string:"http://192.168.1.123:8080/LoveZZU/loginAction")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        //设置请求体
        let param:NSString = NSString(format:"phone=%@&password=%@",self.textField1.text!,self.textField2.text!)
        //把拼接后的字符串转换为data，设置请求体
        request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
        
        //客户端类型，只能写英文
        request.setValue("iOS+Android", forHTTPHeaderField:"User-Agent")
        
        
        //(3) 发送请求
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue:OperationQueue()) { (res, data, error)in
            //服务器返回：请求方式 = POST，返回数据格式 = JSON，用户名 = 123，密码 = 123
            //            let  str = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)!
            //            print(str)
            let json = JSON(data: data!)//得到json数据，并转换
            let jsonResult = json["SessionID"].stringValue
            print(jsonResult as Any)
            
            //String类型
            userDefault.set("\(jsonResult)", forKey: "String")
            //let stringValue  = userDefault.string(forKey: "String")!
            //print(stringValue as Any)
            
        }

    }
    
    
    
    
    //键盘return键的响应
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        //收起键盘
        textField.resignFirstResponder()
        //打印出文本框中的值
        
        return true;
    }

}
