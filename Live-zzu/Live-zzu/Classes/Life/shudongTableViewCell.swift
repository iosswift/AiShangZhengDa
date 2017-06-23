//
//  shudongTableViewCell.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/5/13.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class shudongTableViewCell: UITableViewCell {

    @IBOutlet weak var customView: UIView!
    
    @IBOutlet weak var customLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //设置cell是有圆角边框显示
        customView.layer.cornerRadius = 8
    }
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
