//
//  ListCustomerCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 2/29/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ListCustomerCell: UITableViewCell {

    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var lbStatus: AppLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        vBackground.setShadow()
        lbStatus.setShadow(color: .orange)
    }
    
}
