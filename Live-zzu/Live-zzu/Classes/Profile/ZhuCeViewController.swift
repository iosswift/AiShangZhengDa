//
//  ZhuCeViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/4/9.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import SwiftyJSON


class ZhuCeViewController: UIViewController,UITextFieldDelegate {
    //输入框设置
    let textField1 = UITextField(frame: CGRect(x: 30, y: 180, width: 300, height: 36))
    let textField2 = UITextField(frame: CGRect(x: 30, y: 250, width: 300, height: 35))
    let textField3 = UITextField(frame: CGRect(x: 30, y: 320, width: 300, height: 35))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"login_bg.png")!)
        //设置边框样式为圆角矩形
        
        textField1.borderStyle = UITextBorderStyle.none
        textField1.placeholder="请输入手机号"
        
        
        textField2.borderStyle = UITextBorderStyle.none
        textField2.placeholder="请输入验证码"
        
        textField3.borderStyle = UITextBorderStyle.none
        textField3.placeholder="请输入6-20位密码"
        textField3.isSecureTextEntry = true
        
        
        //当文字超出文本框宽度时，自动调整文字大小
        textField1.adjustsFontSizeToFitWidth=true
        textField1.minimumFontSize=14
        
        textField2.adjustsFontSizeToFitWidth=true
        textField2.minimumFontSize=14
        
        textField3.adjustsFontSizeToFitWidth=true
        textField3.minimumFontSize=14
        
        
        //是否显示清除按钮
        //textField.clearButtonMode=UITextFieldViewMode.whileEditing  //编辑时出现清除按钮
        //textField.clearButtonMode=UITextFieldViewMode.unlessEditing  //编辑时不出现，编辑后才出现清除按钮
        
        textField1.clearButtonMode=UITextFieldViewMode.always  //一直显示清除按钮
        textField2.clearButtonMode=UITextFieldViewMode.always  //一直显示清除按钮
        textField3.clearButtonMode=UITextFieldViewMode.always  //一直显示清除按钮
        
        
        //设置键盘样式
        
        
        textField1.keyboardType = UIKeyboardType.default
        textField2.keyboardType = UIKeyboardType.default
        textField3.keyboardType = UIKeyboardType.default
        
        
        
        //设置键盘return键的样式
        
        textField1.returnKeyType = UIReturnKeyType.done //表示完成输入
        textField2.returnKeyType = UIReturnKeyType.done //表示完成输入
        textField3.returnKeyType = UIReturnKeyType.done //表示完成输入
        
        
        //设置键盘风格
        
        textField1.keyboardAppearance = UIKeyboardAppearance.default//系统默认
        textField2.keyboardAppearance = UIKeyboardAppearance.default//系统默认
        textField3.keyboardAppearance = UIKeyboardAppearance.default//系统默认
        //再次编辑时是否清空
        textField1.clearsOnBeginEditing = true
        textField2.clearsOnBeginEditing = true
        textField3.clearsOnBeginEditing = true
        
        //设置输入框左侧头像
        let hadeimage1 = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        hadeimage1.image = UIImage.init(named: "login_phone.png")
        textField1.leftView = hadeimage1
        textField1.leftViewMode = .always
        
        let hadeimage2 = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        hadeimage2.image = UIImage.init(named: "login_code.png")
        textField2.leftView = hadeimage2
        textField2.leftViewMode = .always
        
        let hadeimage3 = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        hadeimage3.image = UIImage.init(named: "login_pass.png")
        textField3.leftView = hadeimage3
        textField3.leftViewMode = .always
        
        //输入框下横线设置
        
        let line = UIView(frame: CGRect(x: 180, y: 0, width: 1, height: textField1.frame.height ))
        line.backgroundColor = UIColor.lightGray
        
        
        let line1 = UIView(frame: CGRect(x: 0, y: 35, width: textField1.frame.width, height: textField1.frame.height * 1 / 40))
        line1.backgroundColor = UIColor.lightGray
        
        let line2 = UIView(frame: CGRect(x: 0, y: 33, width: textField1.frame.width, height: textField1.frame.height * 1 / 40))
        line2.backgroundColor = UIColor.lightGray
        
        
        let line3 = UIView(frame: CGRect(x: 0, y: 33, width: textField1.frame.width, height: textField1.frame.height * 1 / 40))
        line3.backgroundColor = UIColor.lightGray
        //texatfield中按钮设置
        let button = UIButton(frame:CGRect(x:185, y:0, width:100, height:textField1.frame.height))
        button.setTitle("获取验证码", for:.normal) //普通状态下的文字
        button.setTitleColor(UIColor.blue, for: .normal) //普通状态下文字的颜色
        button.backgroundColor = UIColor.clear
        textField1.addSubview(button)
        
        textField1.addSubview(line)
        textField1.addSubview(line1)
        textField2.addSubview(line2)
        textField3.addSubview(line3)
        
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        self.view.addSubview(textField1)
        self.view.addSubview(textField2)
        self.view.addSubview(textField3)
        
        //按钮的创建
        let button1 = UIButton(frame:CGRect(x:30, y:380, width:300, height:30))
        let button2 = UIButton(frame:CGRect(x:180, y:430, width:100, height:30))
        //let button3 = UIButton(frame:CGRect(x:250, y:430, width:100, height:30))
        //按键的圆角设置
        button1.layer.cornerRadius = 10
        //按钮的文字设置
        button1.setTitle("注册", for:.normal) //普通状态下的文字
        button2.setTitle("立即登陆", for:.normal) //普通状态下的文字
        
        //按钮文字颜色的设置
        
        button1.setTitleColor(UIColor.blue, for: .highlighted) //触摸状态下文字的颜色
        
        button2.setTitleColor(UIColor.blue, for: .normal) //普通状态下文字的颜色
        
        //按钮背景颜色设置
        button1.backgroundColor = UIColor.blue
        button2.backgroundColor = UIColor.clear
        
        button1.addTarget(self, action:#selector(tapped), for:.touchUpInside)
        button2.addTarget(self, action:#selector(actionBack), for:.touchUpInside)
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        
        
        //label标签设置
        let label = UILabel(frame:CGRect(x:90, y:430, width:100, height:30))
        label.text = "已有账号？"
        label.textColor = UIColor.white //白色文字
        label.backgroundColor = UIColor.gray//黑色背景
        label.textAlignment = .right//文字右对齐
        
        
        self.view.addSubview(label);
        
        
        
        
        
    }
    
    //返回按钮事件
    
    func actionBack(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    //注册按钮出发事件
    
    func tapped(){
        
        //(1）设置请求路径
        let url:NSURL = NSURL(string:"http://192.168.1.123:8080/LoveZZU/userAction")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        //设置请求体
        let param:NSString = NSString(format:"phone=%@&password=%@",self.textField1.text!,self.textField3.text!)
        //把拼接后的字符串转换为data，设置请求体
        request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
        
        //客户端类型，只能写英文
        request.setValue("iOS+Android", forHTTPHeaderField:"User-Agent")
        
        
        //(3) 发送请求
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue:OperationQueue()) { (res, data, error)in
            //服务器返回：请求方式 = POST，返回数据格式 = JSON，用户名 = 123，密码 = 123
//            let  str = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)!
//            
//            print(str)
                        let json = JSON(data: data!)//得到json数据，并转换
                        let jsonResult = json["isSuccessful"].stringValue
                        print(jsonResult as Any)
            if jsonResult == "true"{
              self.dismiss(animated: true, completion: nil)
            }else{
                print("注册失败！！！！！")
            }
            
            
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

