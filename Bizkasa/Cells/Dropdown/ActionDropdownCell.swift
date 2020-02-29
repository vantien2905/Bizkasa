//
//  ActionDropdownCell.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 12/11/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import DropDown

class ActionDropdownCell: DropDownCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
