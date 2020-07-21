//
//  FloorCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/19/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit
import SwipeCellKit

class FloorCell: SwipeTableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
