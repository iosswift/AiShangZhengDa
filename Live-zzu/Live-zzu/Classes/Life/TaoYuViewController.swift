//
//  TaoYuViewController.swift
//  Live-zzu
//
//  Created by saifei song on 2017/5/28.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class TaoYuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var tableView:UITableView?
    
    
    var tableData = [["number":"184950343","time":"342天前","price":"¥ 100.00","title":"哎呦，干哈；给费迪南德是咖啡定律","image":"life_img2"],
                     ["number":"3275634","price":"¥ 38.50","time":"2天前","title":"哈喽？快点发来。","image":"life_play_img1"],
                     ["number":"2375643","price":"¥ 45.65","time":"562天前","title":"最近；爱护狗；诶好霸道和 i 爱哦呵","image":"life_play_img2"],
                     ["number":"79453455","price":"¥ 97.00","time":"0天前","title":"最近天气挺适合出游呀，一块走走去","image":"life_play_img3"],
                     ["number":"奋斗故事","price":"¥ 67.00","time":"3天前","title":"破人背后 i 和 v 吕克贝松 v 分","image":"life_play_img4"],
                     ["number":"一块肥肉","price":"¥ 98.00","time":"8天前","title":"胫骨互动国际港口风景可好","image":"life_play_img5"],
                     ["number":"铁塔","price":"¥ 10000.00","time":"9天前","title":"使用LINQ操作数组/集合","image":"life_img1"],
                     ["number":"ghfghdfky","price":"¥ 800.00","time":"4天前","title":"给表格UITableView添加索引功能","image":"life_play_img6"]
    ]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.tableView = UITableView(frame: UIScreen.main.applicationFrame,style:.plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        self.tableView!.separatorStyle = .none
        //创建一个重用的单元格
        self.tableView!.register(UINib(nibName:"TaoYuTableViewCell", bundle:nil),
                                 forCellReuseIdentifier:"TaoYuTableViewCell")
        
        self.view.addSubview(tableView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    override func loadView() {
        super.loadView()
        
    }
    
    
    //在本例中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    //单元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat {
            return 180
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaoYuTableViewCell")as! TaoYuTableViewCell
        let item = tableData[indexPath.row]
        cell.TaoYuUser.text = item["number"]
        cell.TaoYuTime.text = item["time"]
        cell.TaoYuPrice.text = item["price"]
        cell.TaoYuThings.image = UIImage(named: item["image"]!)
        cell.TaoYuDes.text = item["title"]
        return cell
    }
    
    
}
