//
//  TaoYuTableViewCell.swift
//  Live-zzu
//
//  Created by saifei song on 2017/5/28.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class TaoYuTableViewCell: UITableViewCell {

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var TaoYuUser: UILabel!
    @IBOutlet weak var TaoYuTime: UILabel!
    @IBOutlet weak var TaoYuPrice: UILabel!
    @IBOutlet weak var TaoYuThings: UIImageView!
    @IBOutlet weak var TaoYuDes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
