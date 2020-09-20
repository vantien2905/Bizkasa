//
//  HeaderRateSettingCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HeaderRateSettingCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var lbTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .lightGray
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    
    func setData(detail: RateSettingEntity) {
        lbTitle.text = detail.RoomClass?.Name
    }
    
}
