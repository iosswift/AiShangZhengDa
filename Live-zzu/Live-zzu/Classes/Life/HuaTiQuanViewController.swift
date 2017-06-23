//
//  HuaTiQuanViewController.swift
//  Live-zzu
//
//  Created by saifei song on 2017/5/28.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
class HuaTiQuanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableData = [["title":"Swift - 让标签栏按钮UITabBarItem图片居中"],
                     ["title":"Swift - 使用SSZipArchive实现文件的压缩、解压缩"],
                     ["title":"Swift - 使用LINQ操作数组/集合"],
                     ["title":"Swift - 给表格UITableView添加索引功能"],
                     ["title":"Swift - 列表项尾部附件点击响应"],
                     ["title":"Swift - 自由调整图标按钮中的图标和文字位置"]]
    
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //创建表视图
        self.tableView = UITableView(frame: UIScreen.main.applicationFrame,
                                     style:.plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        
        //去除单元格分隔线
        self.tableView!.separatorStyle = .none
        
        //创建一个重用的单元格
        self.tableView!.register(UINib(nibName:"HuaTiQuanTableViewCell", bundle:nil),
                                 forCellReuseIdentifier:"Huacell")
        
        self.view.addSubview(tableView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    override func loadView() {
        super.loadView()
        
        addBackBtn()
        
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
            return 158
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Huacell")as! HuaTiQuanTableViewCell
        let item = tableData[indexPath.row]
        cell.customLabel.text = item["title"]
        return cell
    }
    
    //导航返回设置
    func addBackBtn(){
        
        let img=UIImage(named: "fragment_back")
        let leftBtn : UIBarButtonItem = UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: #selector(actionBack))
        
        leftBtn.tintColor=UIColor.gray
        
        self.navigationItem.leftBarButtonItem = leftBtn
        
    }
    
    //返回按钮事件
    
    func actionBack(){
        
        self.navigationController?.popViewController(animated: true)
        //self.presentingViewController!.dismiss(animated: true, completion: nil)
        
    }
    
}
