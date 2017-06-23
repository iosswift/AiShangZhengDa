//
//  LifeViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/4/27.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


let width:CGFloat = 375
//let height:CGFloat = 668

class Books : NSObject{
    //var title = ""
    //var subtitle = ""
    var image = ""
    // var rating = ""
    
    //var name = ""
    
    
}


class LifeViewController: UIViewController ,UIScrollViewDelegate{
    var pageControl:UIPageControl?//页面控制器
    var tmpSV:UIScrollView?//滚动视图
    var timer :Timer?   //定时器
    let URLString = "https://api.douban.com/v2/book/search?tag=Swift"//网络请求地址
    var books = [Books]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setScrollView()
        self.setPageControl()
        //添加view使用网格
        let view1 = UIView(frame: CGRect(x: 0, y: 260, width: self.view.frame.size.width, height: 200))
        view1.backgroundColor = UIColor.lightGray
        self.view.addSubview(view1)
        
        //添加第1个网格button1
        let button1 = UIButton(frame:CGRect(x:0, y:261, width:200, height:100))
        
        button1.backgroundColor = UIColor.white
        
        let label11 = UILabel(frame:CGRect(x:20, y:2, width:90, height:20))
        label11.text = "淘鱼"
        label11.font = UIFont(name:"Zapfino", size:15)
        button1.addSubview(label11)
        button1.addTarget(self, action:#selector(taoyu) , for: .touchUpInside)
        
        
        
        let label12 = UILabel(frame:CGRect(x:20, y:20 ,width:90, height:20))
        label12.text = "资源共享，二次利用"
        label12.font = UIFont(name:"Zapfino", size:10)
        label12.textColor = UIColor.gray //灰色
        button1.addSubview(label12)
        
        
        
        
        let imageView1 = UIImageView(image:UIImage(named:"life_taoyu"))
        imageView1.frame = CGRect(x:150, y:50, width:40, height:40)
        button1.addSubview(imageView1)
        
        self.view.addSubview(button1)
        
        
        
        
        
        
        //添加第2个网格button2
        let button2 = UIButton(frame:CGRect(x:0, y:362, width:200, height:97))
        button2.backgroundColor = UIColor.white
        
        let label21 = UILabel(frame:CGRect(x:20, y:2, width:90, height:20))
        label21.text = "一起玩"
        label21.font = UIFont(name:"Zapfino", size:15)
        button2.addSubview(label21)
        button2.addTarget(self, action:#selector(yiqiwan) , for: .touchUpInside)
        
        
        
        let label22 = UILabel(frame:CGRect(x:20, y:20 ,width:90, height:20))
        label22.text = "从此不再孤单"
        label22.font = UIFont(name:"Zapfino", size:10)
        label22.textColor = UIColor.gray //灰色
        button2.addSubview(label22)
        
        let imageView2 = UIImageView(image:UIImage(named:"life_play"))
        imageView2.frame = CGRect(x:150, y:50, width:40, height:40)
        button2.addSubview(imageView2)
        
        
        self.view.addSubview(button2)
        
        
        
        
        //添加第3个网格button3
        let button3 = UIButton(frame:CGRect(x:201, y:261, width:180, height:66))
        button3.backgroundColor = UIColor.white
        
        
        let label31 = UILabel(frame:CGRect(x:20, y:2, width:90, height:20))
        label31.text = "话题圈"
        label31.font = UIFont(name:"Zapfino", size:15)
        button3.addSubview(label31)
        button3.addTarget(self, action:#selector(huati) , for: .touchUpInside)
        
        
        
        let label32 = UILabel(frame:CGRect(x:20, y:20 ,width:90, height:20))
        label32.text = "大家一起说"
        label32.font = UIFont(name:"Zapfino", size:10)
        label32.textColor = UIColor.gray //灰色
        button3.addSubview(label32)
        
        
        
        let imageView3 = UIImageView(image:UIImage(named:"life_talk"))
        imageView3.frame = CGRect(x:150, y:30, width:20, height:20)
        button3.addSubview(imageView3)
        
        
        
        self.view.addSubview(button3)
        
        
        //添加第4个网格button4
        let button4 = UIButton(frame:CGRect(x:201, y:328, width:180, height:66))
        
        button4.backgroundColor = UIColor.white
        
        let label41 = UILabel(frame:CGRect(x:20, y:2, width:90, height:20))
        label41.text = "树洞"
        label41.font = UIFont(name:"Zapfino", size:15)
        button4.addSubview(label41)
        button4.addTarget(self, action:#selector(shudong) , for: .touchUpInside)
        
        
        
        let label42 = UILabel(frame:CGRect(x:20, y:20 ,width:90, height:20))
        label42.text = "有情绪就表达"
        label42.font = UIFont(name:"Zapfino", size:10)
        label42.textColor = UIColor.gray //灰色
        button4.addSubview(label42)
        
        
        
        let imageView4 = UIImageView(image:UIImage(named:"life_tree"))
        imageView4.frame = CGRect(x:150, y:30, width:20, height:20)
        button4.addSubview(imageView4)
        self.view.addSubview(button4)
        
        
        
        //添加第5个网格button5
        let button5 = UIButton(frame:CGRect(x:201, y:395, width:180, height:64))
        button5.backgroundColor = UIColor.white
        
        
        let label51 = UILabel(frame:CGRect(x:20, y:2, width:90, height:20))
        label51.text = "兼职"
        label51.font = UIFont(name:"Zapfino", size:15)
        button5.addSubview(label51)
        button5.addTarget(self, action:#selector(jianzhi) , for: .touchUpInside)
        
        
        
        let label52 = UILabel(frame:CGRect(x:20, y:20 ,width:90, height:20))
        label52.text = "课外时间不停赚"
        label52.font = UIFont(name:"Zapfino", size:10)
        label52.textColor = UIColor.gray //灰色
        button5.addSubview(label52)
        
        let imageView5 = UIImageView(image:UIImage(named:"life_offer"))
        imageView5.frame = CGRect(x:150, y:30, width:20, height:20)
        button5.addSubview(imageView5)
        self.view.addSubview(button4)
        self.view.addSubview(button5)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setScrollView() {
        
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 180)
        
        //设置内容大小
        scrollView.contentSize = CGSize(width: CGFloat(width * 7), height: 180)
        
        //scrollView.backgroundColor = UIColor.red
        //设置起始偏移量
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        //隐藏水平指示条
        scrollView.showsHorizontalScrollIndicator = false
        //隐藏竖直指示条
        scrollView.showsVerticalScrollIndicator = false
        //开启分页效果
        scrollView.isPagingEnabled = true
        //设置代理
        scrollView.delegate = self
        
        self.view.addSubview(scrollView)
        //网络请求
        Alamofire.request(URLString, method: .get, parameters: ["tag" : "Swift"]).validate().responseJSON { (resp) -> Void in
            if let error = resp.result.error{
                print(error)
            }else if let value = resp.result.value,let jsonArray = JSON(value)["books"].array {
                
                for json in jsonArray{
                    
                    let book = Books()
                    
                    book.image = json["image"].string ?? ""
                    //print(book.image)
                    
                    self.books.append(book)
                    //print(self.books)
                    
                    
                }
                //print(self.books.count)
                for i in 0..<6 {
                    let imageView : UIImageView = UIImageView(frame: CGRect(x: width * CGFloat(i), y: 0, width: width, height: 180))
                    
                    let book = self.books[i]
                    let urimage = URL(string: book.image)
                    let data = NSData(contentsOf: urimage!)
                    let image =  UIImage(data: data! as Data)
                    imageView.image = image
                    //imageView.backgroundColor = colors[i]
                    
                    scrollView.addSubview(imageView)
                    
                }
                
            }
            
        }
        
        
        tmpSV = scrollView
        
        //let colors:[UIColor] = [UIColor.red,UIColor.orange,UIColor.yellow,UIColor.green,UIColor.blue,UIColor.purple]
        
    }
    
    func setPageControl() {
        pageControl = UIPageControl(frame:  CGRect(x: self.view.center.x - 60, y: 220, width: 150, height: 20))
        
        //设置显示的页数
        pageControl?.numberOfPages = 5
        //设置显示的起始页的索引
        pageControl?.currentPage = 0
        //设置单页时隐藏
        pageControl?.hidesForSinglePage = true
        //设置显示颜色
        pageControl?.currentPageIndicatorTintColor = UIColor.green
        //设置页背景指示颜色
        pageControl?.pageIndicatorTintColor = UIColor.lightGray
        //添加事件
        pageControl?.addTarget(self, action: #selector(pageControlChanged), for: UIControlEvents.valueChanged)
        
        self.view.addSubview(pageControl!)
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.change), userInfo: nil, repeats: true)
        
    }
    //pageControl的触发事件
    func pageControlChanged() {
        let page = pageControl?.currentPage
        
        print("当前显示的是第\(page!+1)页")
        tmpSV!.contentOffset = CGPoint(x: width * CGFloat(page!), y: 0)
        
        var frame = tmpSV!.frame
        frame.origin.x = width * CGFloat(page!)
        tmpSV!.scrollRectToVisible(frame, animated: true)
    }
    
    
    //循环滚动方法
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        //如果图片在第一张的位置
        if scrollView.contentOffset.x == 0 {
            //就变到倒数第二张的位置上
            scrollView.scrollRectToVisible(CGRect(x: scrollView.contentSize.width - self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: 180), animated: false)
            //如果图片是倒数第一张的位置
        } else if scrollView.contentOffset.x == scrollView.contentSize.width - self.view.frame.size.width{
            //就变到第二张的位置
            scrollView .scrollRectToVisible(CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: 180), animated: false)
        }
        
        pageControl?.currentPage = Int(scrollView.contentOffset.x / self.view.frame.size.width) - 1
        
        
        
        
    }
    
    //定时器执行方法
    func change(timer :Timer) {
        
        if  pageControl?.currentPage == ( pageControl?.numberOfPages)! - 1 {
            pageControl?.currentPage = 0
        } else if ( pageControl?.currentPage)! < ( pageControl?.numberOfPages)! - 1 {
            pageControl?.currentPage = (pageControl?.currentPage)! + 1
        }
        //        tmpSV?.setContentOffset(CGPointMake((CGFloat( pageControl!.currentPage + 1)) * self.view.frame.size.width, 0), animated: false)
        tmpSV?.setContentOffset(CGPoint(x: (CGFloat( pageControl!.currentPage + 1)) * self.view.frame.size.width, y: 0), animated: false)
    }
    
    //开启定时器
    func addTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.change), userInfo: nil, repeats: true)
    }
    
    //关闭定时器
    func removeTimer() {
        timer?.invalidate()
    }
    
    //开始拖拽时调用
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //关闭定时器
        removeTimer()
    }
    
    //拖拽结束后调用
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //开启定时器
        addTimer()
    }
    
    func taoyu(){
        let normalRoomVa = TaoYuViewController()
        navigationController?.pushViewController(normalRoomVa, animated: true)
    }
    
    func yiqiwan(){
        print("yiqiwan")
    }
    func huati(){
        let normalRoomVd = HuaTiQuanViewController()
        
        // 2.以Push方式弹出
        navigationController?.pushViewController(normalRoomVd, animated: true)
    }
    
    func shudong(){
        let normalRoomVc = ShuDongViewController()
        
        // 2.以Push方式弹出
        navigationController?.pushViewController(normalRoomVc, animated: true)
    }
    func jianzhi(){
        print("jianzhi")
    }
    
   

  
}
