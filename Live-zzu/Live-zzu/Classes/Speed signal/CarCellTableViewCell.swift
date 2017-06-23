//
//  CarCellTableViewCell.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/5/6.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class CarCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellImg: UIImageView!

    @IBOutlet weak var lbCell: UILabel!
    
    @IBOutlet weak var timelabel: UILabel!
    
    @IBOutlet weak var speaklabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellImg.layer.borderWidth = 1
        cellImg.layer.masksToBounds = true
        cellImg.layer.cornerRadius = 45
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
