//
//  GoodsTableViewCell.swift
//  tableview
//
//  Created by 如是我闻 on 2017/4/12.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class GoodsTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super . init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView .addSubview(self.titleLable)
        self.contentView .addSubview(self.titleLable1)
        self.contentView .addSubview(self.titleLable2)
    }
    
    //懒加载label
    lazy var  titleLable:UILabel = {
        let  titleLable =  UILabel(frame:CGRect.init(x: 110, y: 0, width: 100, height: 30))
     
        //titleLable.backgroundColor = .green
        titleLable.textAlignment = .natural
        titleLable.adjustsFontSizeToFitWidth=true
        titleLable.numberOfLines = 2
        return titleLable
        
    }( )
    //懒加载label
    lazy var  titleLable1:UILabel = {
        let  titleLable1 =  UILabel(frame:CGRect.init(x: 110, y: 50, width: 100, height: 30))
      
        //titleLable1.backgroundColor = .green
        titleLable1.textAlignment = .natural
        titleLable1.adjustsFontSizeToFitWidth=true
    
        return titleLable1
        
    }( )
    
    //懒加载label
    lazy var  titleLable2:UILabel = {
        let  titleLable2 =  UILabel(frame:CGRect.init(x: 300, y: 50, width: 60, height: 30))
    
        //titleLable2.backgroundColor = .green
        titleLable2.textAlignment = .natural
        titleLable2.adjustsFontSizeToFitWidth=true
        
        return titleLable2
        
    }( )
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
