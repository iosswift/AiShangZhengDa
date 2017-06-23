 //
//  GeRenZiLiaoViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/4/8.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class GeRenZiLiaoViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    var tableView:UITableView?
    
    var allnames:Dictionary<Int, [String]>?
    
    var adHeaders:[String]?
       
    var nickname = "123"
    var phone = "456"
    
    lazy var imageView : UIImageView = {
        
        
        var imageView = UIImageView()
        let objData = userDefault.data(forKey: "imageData")
        if objData != nil{
            imageView.image = getimageuserdefualt()
        }else{
            let image = UIImage(named: "def_avatar")
            //image:UIImage(named:"tab_icon_friend.png")
            imageView = UIImageView(image:UIImage(named:"def_avatar"))
            
        }
        imageView.clipsToBounds=true
        
        //imageView.bounds = CGRectMake(0, 0, 20.0 * (image!.size.width / image!.size.height), 20.0)
        imageView.frame = CGRect(x: 300, y: 2, width: 50, height: 50)
        imageView.layer.cornerRadius = 25
        /////设置允许交互属性
        
        return imageView
        
        
    }()
    
    
    override func loadView() {
        super.loadView()
        
        addBackBtn()
        
        
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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //获取信息
        postxinxi()
     
        
        //初始化数据，这一次数据，我们放在属性列表文件里
        self.allnames =  [0:[String](["头像","昵称","账号/手机号","二维码名片"]),1:[String](["性别","家乡"]),
                          2:[String](["院校","院系","专业","学号"])];
        
        
        //创建表视图
         let cgreact = CGRect(x: 0, y: 64, width:375, height: 600)
        self.tableView = UITableView(frame:cgreact, style:.grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        
    }
    
    //在本例中，有4个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.allnames?[section]
        return data!.count
    }
    
    //设置分区头高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    
    
    
    //1.3 返回行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        if(indexPath.section == 0){
            return 50;
        }else{
            return 50;
            
        }
    }
    
    
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
          
         
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "SwiftCell"
         
            //同一形式的单元格重复使用，在声明时已注册
            let secno = indexPath.section
            let data = self.allnames?[secno]
            if secno == 0 {
                //let cell1 = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                let cell1 = UITableViewCell.init(style: .value1, reuseIdentifier: identify)
                
                cell1.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                switch indexPath.row {
                case 0:
                    
                    //圆形的图片视图
                    imageView.isUserInteractionEnabled = true
                    /////添加tapGuestureRecognizer手势
                    //let tapGR = UITapGestureRecognizer(target: self, action: Selector(("tapHandler:")))
                    let tapGR = UITapGestureRecognizer(target: self, action:#selector(self.tapHandler) )
                    
                    imageView.addGestureRecognizer(tapGR)
                    
                    self.tableView?.addSubview(imageView)
                    cell1.textLabel?.text = data![indexPath.row]
                  
                    
                case 1:
                   
                    cell1.textLabel?.text = data![indexPath.row]
                    cell1.detailTextLabel?.text =  userDefault.string(forKey: "nickString")
                case 2:
                    
                    cell1.textLabel?.text = data![indexPath.row]
                    cell1.detailTextLabel?.text = userDefault.string(forKey: "phoneString")
                default:
                    let imageRect: CGRect = CGRect(x: 300, y: 160, width: 30, height: 30)
                    let imageView = UIImageView(image:UIImage(named:"two_dimension_code.png"))
                    imageView.frame = imageRect
                    self.tableView?.addSubview(imageView)
                    cell1.textLabel?.text = data![indexPath.row]
                    
                }
                
                
                return cell1
                
            }else if(secno == 1)
            {
                //let cell2 = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                let cell2 = UITableViewCell.init(style: .value1, reuseIdentifier: identify)
                cell2.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                
                switch indexPath.row {
                case 0:
                    
                    cell2.textLabel?.text = data![indexPath.row]
                    cell2.detailTextLabel?.text = data![indexPath.row]
                default:
                    //                    let image = UIImage(named:"mine_confession.png")
                    //                    cell2.imageView?.image = image
                    cell2.textLabel?.text = data![indexPath.row]
                    cell2.detailTextLabel?.text = data![indexPath.row]
                }
                
                return cell2
                
                
            }else {
                //let cell3 = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                let cell3 = UITableViewCell.init(style: .value1, reuseIdentifier: identify)
                cell3.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                
                switch indexPath.row {
                case 0:
                    
                    cell3.textLabel?.text = data![indexPath.row]
                    cell3.detailTextLabel?.text = data![indexPath.row]
                case 1:
                    
                    cell3.textLabel?.text = data![indexPath.row]
                    cell3.detailTextLabel?.text = data![indexPath.row]
                case 2:
                    
                    cell3.textLabel?.text = data![indexPath.row]
                    cell3.detailTextLabel?.text = data![indexPath.row]
                    
                default:
                    
                    cell3.textLabel?.text = data![indexPath.row]
                    cell3.detailTextLabel?.text = data![indexPath.row]
                }
                
                return cell3
            }
            
            
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)!
        //let a = cell.detailTextLabel?.text!
        
        //print(a! as Any)
        
        
        let itemString = self.allnames![indexPath.section]![indexPath.row]
        let alertController = UIAlertController(title: "提示!",message: "是否修改\(itemString)",preferredStyle: .alert)
        alertController.addTextField {
            
            (textField: UITextField!) -> Void in
            textField.text = cell.detailTextLabel?.text!
            textField.clearButtonMode=UITextFieldViewMode.always
            
        }


        let sureAction = UIAlertAction(title: "确定", style: .default)
        {
            (action: UIAlertAction!) -> Void in
            let login = alertController.textFields?.first
            cell.detailTextLabel?.text = login?.text
            
             userDefault.set(login?.text, forKey: "nickString")
            
            //(1）设置请求路径
            let url:NSURL = NSURL(string:"http://192.168.1.123:8080/LoveZZU/userinfoAction")!//不需要传递参数
            
            //(2) 创建请求对象
            let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
            request.timeoutInterval = 5.0 //设置请求超时为5秒
            request.httpMethod = "POST"  //设置请求方法
            let phoneValue  = userDefault.string(forKey: "phoneString")!
            //设置请求体
            let param:NSString = NSString(format:"phone=%@&nickname=%@",phoneValue,(login?.text)!)
            //把拼接后的字符串转换为data，设置请求体
            request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
            
            //客户端类型，只能写英文
            request.setValue("iOS+Android", forHTTPHeaderField:"User-Agent")
            
            
            //(3) 发送请求
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue:OperationQueue()) { (res, data, error)in
                //服务器返回：请求方式 = POST，返回数据格式 = JSON，用户名 = 123，密码 = 123
                            let  str = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)
                            print(str as Any)
                
            }

        }
        //alertController.addAction(resetAction)
        alertController.addAction(sureAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }

    
    func postxinxi(){
        
     
        
        //(1）设置请求路径
        let url:NSURL = NSURL(string:"http://192.168.1.123:8080/LoveZZU/queryuserinfoAction")!//不需要传递参数
        
       //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
            request.timeoutInterval = 5.0 //设置请求超时为5秒
            request.httpMethod = "POST"  //设置请求方法
        
            //设置请求体
            let phoneValue  = userDefault.string(forKey: "phoneString")!
            //print(phoneValue)
            let param:NSString = NSString(format:"phone=%@",phoneValue)
            //把拼接后的字符串转换为data，设置请求体
            request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
        
            //客户端类型，只能写英文
            request.setValue("iOS+Android", forHTTPHeaderField:"User-Agent")
        
        
           //(3) 发送请求
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue:OperationQueue()) { (res, data, error)in
           //服务器返回：请求方式 = POST，返回数据格式 = JSON，用户名 = 123，密码 = 123
//                                    let  str = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)!
//                                    print(str)
            let json = JSON(data: data!)//得到json数据，并转换
                       
           self.nickname = json["nickname"].stringValue
            self.phone = json["phone"].stringValue
              
                
                userDefault.set(self.phone, forKey: "phoneString")
                userDefault.set(self.nickname, forKey: "nickString")
            
                //userDefault.set(self.phone, forKey: "phoneString")
                            
                
                        //String类型
                        //userDefault.set("\(jsonResult)", forKey: "String")
                        //let stringValue  = userDefault.string(forKey: "String")!
                        //print(stringValue as Any)
                        
        }
        
      
        
    }

    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //获取选择的原图
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //本地存储图片
        setimageuserdefault(image: pickedImage)
        imageView.image = getimageuserdefualt()
        let reSize = CGSize(width: 50, height: 50)
        imageView.image = pickedImage.reSizeImage(reSize: reSize)
        
        
        
        //将选择的图片保存到Document目录下
        let fileManager = FileManager.default
        let rootPath = NSHomeDirectory() + "/Documents"
        let filePath = "\(rootPath)/pickedimage.png"
        //print(filePath)
        let imageData = UIImageJPEGRepresentation(pickedImage, 1.0)
        fileManager.createFile(atPath: filePath, contents: imageData, attributes: nil)
        
        //上传图片
        if (fileManager.fileExists(atPath: filePath)){
            //取得NSURL
            let imageNSURL:URL = URL.init(fileURLWithPath: filePath)
            
            //使用Alamofire上传
            Alamofire.upload(imageNSURL, to: "http://httpbin.org/post", method: .post, headers: nil)
                .responseJSON{ response in
                    //let res = response.result.value
                    print("Success: \(response.result.isSuccess)")
                    //print("Response String: \(String(describing: res))")
            }
        }
        
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }

    func tapHandler(){
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //设置是否允许编辑
            picker.allowsEditing = true
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
    }

    
        
}
    




