//
//  PopViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/5/5.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class PopViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    
    var tableView:UITableView?
    
    var ctrlnames:[String] = ["添加好友","摇一摇","创建圈子"]
    var image : [String] = ["friend_memu_add","friend_memu_shake","friend_memu_quanzi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建表视图
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 150, height: 150),
                                     style:UITableViewStyle.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        //给TableView添加表头页眉
        //            let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView!.frame.size.width, height: 60))
        //            let headerlabel:UILabel = UILabel(frame: headerView.bounds)
        //            headerlabel.textColor = UIColor.white
        //            headerlabel.backgroundColor = UIColor.clear
        //            headerlabel.font = UIFont.systemFont(ofSize: 16)
        //            headerlabel.text = "TableView 页眉"
        //            headerView.addSubview(headerlabel)
        //            headerView.backgroundColor = UIColor.black
        //            tableView?.tableHeaderView = headerView
        
        //给TableView添加表头页尾
        //            let footerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView!.frame.size.width, height: 60))
        //            let footerlabel:UILabel = UILabel(frame: footerView.bounds)
        //            footerlabel.textColor = UIColor.white
        //            footerlabel.backgroundColor = UIColor.clear
        //            footerlabel.font = UIFont.systemFont(ofSize: 16)
        //            footerlabel.text = "TableView 页眉"
        //            footerView.addSubview(footerlabel)
        //            footerView.backgroundColor = UIColor.black
        //            tableView?.tableFooterView = footerView
    }
    
    //在本例中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1;
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        
        
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
            as UITableViewCell
        cell1.accessoryType = UITableViewCellAccessoryType.none
        cell1.textLabel?.text = self.ctrlnames[indexPath.row]
        cell1.imageView?.image = UIImage(named: self.image[indexPath.row])
        return cell1
        
    }
}

