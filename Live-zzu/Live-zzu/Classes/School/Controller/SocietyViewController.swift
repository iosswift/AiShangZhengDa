//
//  SocietyViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/4/12.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher



class Book: NSObject {
    var title = ""
    //var subtitle = ""
    var image = ""
    // var rating = ""
    
    var name = ""
    var numRaters = ""
    
    
}



class SocietyViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    var tableView : UITableView!
    let URLString = "https://api.douban.com/v2/book/search?tag=Swift"
    var books = [Book]()
    
    
    
    
    
    
    
    //    var baby = ["宝宝0","宝宝1","宝宝2","宝宝3","宝宝4","宝宝5","宝宝6","宝宝7","宝宝8","宝宝9","宝宝10","宝宝11"]
    //
    //    var babyImage = ["def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png","def_avatar.png"]
    //
    //标记图片是否已经被选中
    //var isFlag = [Bool](repeating: false, count : 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        network()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), style: UITableViewStyle.plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view .addSubview(tableView)
        
        tableView .register(GoodsTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //使用闭包，和嵌套函数或者JAVA中的匿名类类似
        let locationActionHandler = {(action: UIAlertAction!) -> Void in
            let locationAlertController = UIAlertController(title: nil, message: "我是宝宝\(indexPath.row)", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            locationAlertController.addAction(okAction)
            self.present(locationAlertController, animated: true, completion: nil)
            
        }
        let alertController = UIAlertController(title: "Baby\(indexPath.row)", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancleAction = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(cancleAction)
        
        let locationAction = UIAlertAction(title: "宝宝是几号", style: UIAlertActionStyle.default, handler: locationActionHandler)
        alertController.addAction(locationAction)
        
        let markAction = UIAlertAction(title: "标记宝宝我一下", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath as IndexPath)
            //此时可以将图片标记为勾，但是当往下拖动图片之前被标记的勾消失，是因为每次只加载出现在屏幕上的，其它都放在缓存池
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
            //self.isFlag[indexPath.row] = true//然后每次加载时候在cellForRowAtIndexPath方法进行判断
        })
        alertController.addAction(markAction)
        present(alertController, animated: true, completion: nil)
    }
    //和下一个方法中实现deleteAction效果是一样的
    //  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //        if editingStyle == UITableViewCellEditingStyle.Delete{
    //        self.baby.removeAtIndex(indexPath.row)
    //        self.babyImage.removeAtIndex(indexPath.row)
    //        self.isFlag.removeAtIndex(indexPath.row)
    //        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Middle)
    //       }
    //    }
    
    //分享和删除功能的实现
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "shareui") { (UITableViewRowAction, IndexPath) in
            let menu = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.cancel, handler: nil)
            let facebookAction = UIAlertAction(title: "facebook", style: UIAlertActionStyle.default, handler: nil)
            
            let twitterAction = UIAlertAction(title: "twitter", style: UIAlertActionStyle.default, handler: nil)
            menu.addAction(facebookAction)
            menu.addAction(twitterAction)
            menu.addAction(cancelAction)
            self.present(menu, animated: true, completion: nil)
        }
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete") { (UITableViewRowAction, IndexPath) in
            self.books.remove(at: indexPath.row)
            // self.books.remove(at: indexPath.row)
            //self.isFlag.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
        }
        
        
        return [shareAction,deleteAction]
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1:GoodsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GoodsTableViewCell
        cell1.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        let book = books[indexPath.row]
        
        //下面两个属性对应subtitle
        cell1.titleLable.text = book.title
        cell1.titleLable1.text = book.name
        cell1.titleLable2.text = book.numRaters
        //cell1.textLabel?.text = baby[indexPath.row]
        //cell1.detailTextLabel?.text = "baby\(indexPath.row)"
        
        //添加照片
        //cell1.imageView?.image = UIImage(named: babyImage[indexPath.row])
        let urimage = URL(string: book.image)
        cell1.imageView?.kf.setImage(with: urimage, placeholder: UIImage(named: "def_avatar.png"))
        cell1.imageView?.layer.frame = CGRect(x: 5, y: 0, width: 30, height: 30)
        cell1.imageView?.layer.cornerRadius = 15
        cell1.imageView?.layer.masksToBounds = true
        
        
        
        //添加附件
        //        cell1.accessoryType = UITableViewCellAccessoryType.detailButton
        //        if isFlag[indexPath.row] {
        //            cell1.accessoryType = UITableViewCellAccessoryType.checkmark
        //        }else{
        //            cell1.accessoryType = UITableViewCellAccessoryType.none
        //        }
        
        return cell1
        
    }
    func network(){
        Alamofire.request(URLString, method: .get, parameters: ["tag" : "Swift"] ).validate().responseJSON { (resp) -> Void in
            if let error = resp.result.error{
                print(error)
            }else if let value = resp.result.value,let jsonArray = JSON(value)["books"].array {
                
                for json in jsonArray{
                    //print(json)
                    let book = Book()
                    book.title = json["title"].string ?? ""
                    //  book.subtitle = json["subtitle"].string ?? ""
                    book.image = json["image"].string ?? ""
                    let dataArray = json["tags"]
                    //print(dataArray)
                    book.name = dataArray[0]["name"].stringValue
                    book.numRaters = json["rating"]["numRaters"].stringValue
                    //print(dataArray)
                    
                    
                    
                    
                    self.books.append(book)
                }
                
                self.tableView.reloadData()
            }
        }
        
    }

}
