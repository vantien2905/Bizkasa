//
//  RoomChargeCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/3/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class RoomChargeCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(timeUsed: TimeUsed) {
        lbTitle.text = timeUsed.Description
        lbContent.text = "\(timeUsed.SumAmount*.formattedWithSeparator)"
    }
    
}
