//
//  SpeedsignalViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/5/6.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class SpeedsignalViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UISearchControllerDelegate{

    var tableView:UITableView?
    //搜索控制器
    var countrySearchController = UISearchController()
    
    var tableData: [String] = ["B1", "F2", "L3","B4", "F5", "L6","B7", "F8", "L9","12345"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //创建表视图UIScreen.main.bounds
        self.tableView = UITableView(frame:CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60),style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //        self.tableView!.backgroundColor = UIColor(red: 0xf0/255, green: 0xf0/255,
        //                                                  blue: 0xf0/255, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
        let cellNib = UINib(nibName: "CarCellTableViewCell", bundle: nil)
        tableView?.register(cellNib, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        
        
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
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 获取当前系统时间
        
        let date = NSDate()
        
        let timeFormatter = DateFormatter()
        
        timeFormatter.dateFormat = "HH:mm"
        
        let strNowTime = timeFormatter.string(from: date as Date) as String
        
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: "cell") as! CarCellTableViewCell
        cell.lbCell.text = tableData[indexPath.row]
        cell.timelabel.text = strNowTime
        cell.speaklabel.text = "你好英俊呦，今晚一起出来嗨吧，66666"
        cell.cellImg.image = UIImage(named: "test_person_06")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        //        let itemString = self.tableData[indexPath.row]
        //        let alertController = UIAlertController(title: "提示!",message: "你选中了【\(itemString)】",preferredStyle: .alert)
        //        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        //        alertController.addAction(cancelAction)
        //        self.present(alertController, animated: true, completion: nil)
        
       showxinxi()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    
    public func showxinxi(){
        
        
        //        // 1.创建ShowRoomVc
        //        let showRoomVc = RoomShowViewController()
        //
        //        // 2.以Modal方式弹出
        //        present(showRoomVc, animated: true, completion: nil)
        // 1.创建NormalRoomVc
        let normalRoomVc = xinxiViewController()
        
        // 2.以Push方式弹出
        navigationController?.pushViewController(normalRoomVc, animated: true)
        //present(normalRoomVc, animated: true, completion: nil)
    }

}
