//
//  RecommendViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/3/26.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

public let kItemMargin : CGFloat = 5
public let kItemW = (kScreenW - 4 * kItemMargin) / 3
public let kItemH = kItemW

public let kHeaderViewH : CGFloat = 50
public let kNormalCellID = "kNormalCellID"
public let kHeaderViewID = "kHeaderViewID"
public let kCycleViewH = kScreenW * 3 / 8
public let kGameViewH : CGFloat = 70


class RecommendViewController: UIViewController {

    
   
    
    
    
    // MARK:- 懒加载属性  
    
    
    public lazy var recommendVM :RecommendViewModel =  RecommendViewModel()
    
    public lazy var collectionView : UICollectionView = { [unowned self] in
        //1创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        
        //2创建UICollectionView
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        
        
          collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
         collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        
        return collectionView
        
    }()
    
    
    public lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH + 1), width: kScreenW, height: kCycleViewH)
        
        return cycleView
        
    }()
    
    public lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    
    
    
    
    // MARK:- 系统函数
    override func viewDidLoad() {
        super.viewDidLoad()

    //设置UI界面
        setupUI()
     //发送网络请求
      loadData()
        
        
    }



}

// MARK:- 设置UI界面内容
extension RecommendViewController {
    public func setupUI() {
        
        //将collectionView添加到View中
        
        view.addSubview(collectionView)
        // 2.将CycleView添加到UICollectionView中
        collectionView.addSubview(cycleView)
        
        // 3.将gameView添加collectionView中
        collectionView.addSubview(gameView)
        
        // 4.设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH , left: 0, bottom: 0, right: 0)
    }
}


// MARK:- 请求数据
extension RecommendViewController{
    
    public func loadData(){
    
        
        //请求推荐数据
        recommendVM.requestData{
            //展示推荐数据
            self.collectionView.reloadData()
            //将数据传递给GameView
            self.gameView.groups = self.recommendVM.xinxiGroups
        }
        //请求轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
           
        }
    }
    
    
}








// MARK:- 遵守UICollectionView的数据源

extension RecommendViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.xinxiGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = recommendVM.xinxiGroups[section]
        return group.xinxis.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //取出模型对象
        let group = recommendVM.xinxiGroups[indexPath.section]
        let xinxi = group.xinxis[indexPath.item]
        
        
        
        
        //获取Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
           cell.xinxi = xinxi
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
       
        
        // 2.取出模型
        headerView.group = recommendVM.xinxiGroups[indexPath.section]

        
        return headerView
    }
    
    
}

extension RecommendViewController: UICollectionViewDelegate {
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
//        // 1.取出对应的主播信息
//        let xinxi = recommendVM.xinxiGroups[indexPath.section].xinxis[indexPath.item]
//        
//        // 2.判断是秀场房间&普通房间
//       xinxi.isVertical == 0 ? pushNormalRoomVc() : presentShowRoomVc()
    
  pushNormalRoomVc()
        
    }
    
   public func presentShowRoomVc() {
        // 1.创建ShowRoomVc
        let showRoomVc = RoomShowViewController()
        
        // 2.以Modal方式弹出
        present(showRoomVc, animated: true, completion: nil)
    }
    
    public func pushNormalRoomVc() {
        // 1.创建NormalRoomVc
        let normalRoomVc = RoomNormalViewController()
        
        // 2.以Push方式弹出
        navigationController?.pushViewController(normalRoomVc, animated: true)
       
    }

    
    
    
    
    
}

