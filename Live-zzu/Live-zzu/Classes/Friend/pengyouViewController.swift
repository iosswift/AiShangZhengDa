//
//  pengyouViewController.swift
//  fenduan
//
//  Created by 如是我闻 on 2017/5/2.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class pengyouViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate{

    var tableView:UITableView?
    
    var allnames:Dictionary<Int, [String]>?
    //搜索控制器
    var countrySearchController = UISearchController()
    //拉刷新控制器
    var refreshControl = UIRefreshControl()
    
    override func loadView() {
        super.loadView()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据，这一次数据，我们放在属性列表文件里
        self.allnames =  [
            0:[String](["动态"]),
            1:[String](["通讯录"])
        ];
        //创建表视图
        self.tableView = UITableView(frame:self.view.frame, style:.grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //配置搜索控制器
        self.countrySearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            
            controller.searchResultsUpdater = self as? UISearchResultsUpdating   //两个样例使用不同的代理
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
            //将searchBar设置为tableview的头视图
            self.tableView?.tableHeaderView = controller.searchBar
            if #available(iOS 9.0, *) {
                self.countrySearchController.loadViewIfNeeded()
            } else {
                // Fallback on earlier versions
            }
            return controller
        })()

        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        
        
        self.automaticallyAdjustsScrollViewInsets = false
        
       
        
        //添加刷新
        refreshControl.addTarget(self, action: #selector(refreshData),
                                 for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        tableView?.addSubview(refreshControl)
        refreshData()
        
        
    }
    // 刷新数据
    func refreshData() {
        //移除老数据
//        self.dataArray.removeAll()
//        //随机添加5条新数据（时间是当前时间）
//        for _ in 0..<5 {
//            let atricle = HanggeArticle(title: "新闻标题\(Int(arc4random()%1000))",
//                createDate: Date())
//            self.dataArray.append(atricle)
//        }
        self.tableView?.reloadData()
        self.refreshControl.endRefreshing()
    }
    //在本例中，有2个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.allnames?[section]
        return data!.count
    }
    
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "SwiftCell"
            
            //同一形式的单元格重复使用，在声明时已注册
            let secno = indexPath.section
            let data = self.allnames?[secno]
            if(secno == 0)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                    as UITableViewCell
                cell.accessoryType = UITableViewCellAccessoryType.none
                let image = UIImage(named:"dynamic")
                cell.imageView?.image = image
                cell.textLabel?.text = data![indexPath.row]
                
                return cell
            }
            else
            {
                //第二个分组表格使用详细标签
                let adcell = UITableViewCell(style: UITableViewCellStyle.subtitle,
                                             reuseIdentifier: "SwiftCell")
                adcell.textLabel?.text = data![indexPath.row]
                let images = UIImage(named: "contacts")
                 adcell.imageView?.image = images
              
                //adcell.detailTextLabel!.text = "这是\(data![indexPath.row])的说明"
                
                return adcell
            }
            
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
          self.tableView!.deselectRow(at: indexPath, animated: true)
       
        let index = indexPath.section
        if index == 0 {
             print(indexPath.section)
        }else{
            showtongxun()

        }
        
//        let itemString = self.allnames![indexPath.section]![indexPath.row]
//        let alertController = UIAlertController(title: "提示!",
//                                                message: "你选中了【\(itemString)】",
//            preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func showtongxun(){
        
        
//        // 1.创建ShowRoomVc
//        let showRoomVc = RoomShowViewController()
//        
//        // 2.以Modal方式弹出
//        present(showRoomVc, animated: true, completion: nil)
        // 1.创建NormalRoomVc
        let normalRoomVc = TongXunViewController()
        
        // 2.以Push方式弹出
       navigationController?.pushViewController(normalRoomVc, animated: true)
        //present(normalRoomVc, animated: true, completion: nil)
    }
    
    

 
}
