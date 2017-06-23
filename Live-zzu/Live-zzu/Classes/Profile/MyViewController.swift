//
//  MyViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/4/8.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import Alamofire

class MyViewController: UIViewController , UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    var tableView:UITableView?
    
    var allnames:Dictionary<Int, [String]>?
    
    var adHeaders:[String]?
    //拉刷新控制器
    var refreshControl = UIRefreshControl()

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
        imageView.frame = CGRect(x: 10, y: 10, width: 70, height: 70)
        imageView.layer.cornerRadius = 35
        /////设置允许交互属性
     
        return imageView
        
        
    }()
    //为了提供表格显示性能，已创建完成的单元需重复使用
    let identify:String = "SwiftCell"
     let label:UILabel=UILabel()
    
    override func loadView() {
        super.loadView()
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //添加刷新
        refreshControl.addTarget(self, action: #selector(MyViewController.refreshData),
                                 for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        tableView?.addSubview(refreshControl)
        refreshData()
 
        //初始化数据，这一次数据，我们放在属性列表文件里
        self.allnames =  [
            0:[String]([
                "good"
                ]),
            
            1:[String]([
                "我的状态",
                "表白墙"]),
            2:[String]([
                "做任务",
                "校园币",
                "我的积分",
                "买卖记录",
                "我的收藏"]),
            3:[String]([
                "系统设置"
                ])
        ];
        
        
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
    // 刷新数据
    func refreshData() {
      
        self.tableView?.reloadData()
        self.refreshControl.endRefreshing()
    }
    //在本例中，有4个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4;
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
            return 80;
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
                let cell1 = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                    as UITableViewCell
                cell1.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                
                
                //圆形的图片视图
                imageView.isUserInteractionEnabled = true
                /////添加tapGuestureRecognizer手势
                //let tapGR = UITapGestureRecognizer(target: self, action: Selector(("tapHandler:")))
                let tapGR = UITapGestureRecognizer(target: self, action:#selector(self.tapHandler) )
                
                imageView.addGestureRecognizer(tapGR)
                
                self.tableView?.addSubview(imageView)
                //self.tableView?.addSubview(button)
                
                //性别框
                let imageRect1: CGRect = CGRect(x: 90, y: 15, width: 18, height: 20)
                let imageView1 = UIImageView(image:UIImage(named:"male.png"))
                imageView1.frame = imageRect1
                
                imageView1.backgroundColor = UIColor.clear
                self.tableView?.addSubview(imageView1)
                //签到按钮
                
                let button1:UIButton = UIButton(type:.system)
                //设置按钮位置和大小
                button1.frame=CGRect(x: 110, y: 10, width: 40, height: 40)
                //设置按钮文字
                button1.setTitle("签到", for:UIControlState.normal)
                self.tableView?.addSubview(button1)
                
                
                
                //设置label
                let rect:CGRect=CGRect(x: 70, y: 30, width: 80, height: 70)
                label.frame = rect
               
                
                // 2、设置和读取文本内容，默认为nil
                
                let SessionID = userDefault.string(forKey: "String")
                
                if SessionID != nil{
                    
                    label.text = "郑州大学"
                    
                }else{
                    label.text="未登录"
                }

                
                // 3、设置文字颜色，默认为黑色
                
                label.textColor=UIColor.black
                
                // 4、font设置文字大小，默认为17
                
                label.font=UIFont.systemFont(ofSize: 12)//一般方法
                
                
                // 5、textAlignment设置标签文本对齐方式
                
                label.textAlignment=NSTextAlignment.center
                
                self.tableView?.addSubview(label)
                
                
                
                
                
                
                return cell1
                
            }else if(secno == 1)
            {
                let cell2 = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                    as UITableViewCell
                cell2.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                
                switch indexPath.row {
                case 0:
                    let image = UIImage(named:"mine_dynamic.png")
                    cell2.imageView?.image = image
                    cell2.textLabel?.text = data![indexPath.row]
                default:
                    let image = UIImage(named:"mine_confession.png")
                    cell2.imageView?.image = image
                    cell2.textLabel?.text = data![indexPath.row]
                }
                
                return cell2
                
                
            }else if(secno == 2){
                let cell3 = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                    as UITableViewCell
                cell3.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                
                switch indexPath.row {
                case 0:
                    let image = UIImage(named:"mine_task.png")
                    cell3.imageView?.image = image
                    cell3.textLabel?.text = data![indexPath.row]
                case 1:
                    let image = UIImage(named:"mine_schoole_coin.png")
                    cell3.imageView?.image = image
                    cell3.textLabel?.text = data![indexPath.row]
                case 2:
                    let image = UIImage(named:"mine_score.png")
                    cell3.imageView?.image = image
                    cell3.textLabel?.text = data![indexPath.row]
                case 3:
                    let image = UIImage(named:"mine_trade_record.png")
                    cell3.imageView?.image = image
                    cell3.textLabel?.text = data![indexPath.row]
                    
                default:
                    let image = UIImage(named:"mine_collect.png")
                    cell3.imageView?.image = image
                    cell3.textLabel?.text = data![indexPath.row]
                }
                
                return cell3
            }
            else
            {
                
                
                let adcell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                    as UITableViewCell
                adcell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                
                let image = UIImage(named:"mine_setting.png")
                adcell.imageView?.image = image
                adcell.textLabel?.text = data![indexPath.row]
                
                return adcell
            }
            
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

    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //删除本地的数据
        //userDefault.removeObject(forKey: "String")
        //取出本地数据
        let SessionID = userDefault.string(forKey: "String")
        

        
        
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let itemString = self.allnames?[indexPath.row]
      
        
        
        //同一形式的单元格重复使用，在声明时已注册
        let secno = indexPath.section
        
        
        if  secno == 0{
            
            if SessionID != nil{
                
                self.performSegue(withIdentifier: "ShowDetailView", sender: itemString)
                
            }else{
                
                self.performSegue(withIdentifier: "dengluzhuce", sender: itemString)
            }
            
        }else if secno == 1{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                as UITableViewCell
            cell2.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
            switch indexPath.row {
            case 0:
                print("")
            default:
                self.performSegue(withIdentifier: "biaobai", sender: itemString);
            }
            
            
            
        }else if secno == 2{
            
        }else{
            self.performSegue(withIdentifier: "shezhi", sender: itemString);
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
        let reSize = CGSize(width: 70, height: 70)
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

    
  
    
    
}






extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    
    /**
     *  等比率缩放
     */
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        
        return reSizeImage(reSize: reSize)
    }
}

