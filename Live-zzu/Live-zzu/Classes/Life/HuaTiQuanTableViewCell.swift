//
//  HuaTiQuanTableViewCell.swift
//  Live-zzu
//
//  Created by saifei song on 2017/5/28.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class HuaTiQuanTableViewCell: UITableViewCell {

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var customLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        customView.layer.cornerRadius=8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
