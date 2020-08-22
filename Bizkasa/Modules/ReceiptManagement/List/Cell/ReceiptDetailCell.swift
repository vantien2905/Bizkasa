//
//  ReceiptDetailCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 8/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ReceiptDetailCell: UITableViewCell {
    
    @IBOutlet weak var lbContent: UILabel!
    @IBOutlet weak var lbPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    func setData(detail: InvoiceServiceEntity) {
        lbContent.text = detail.Descriptions ?? "Chưa xác định"
        lbPrice.text = "\(detail.Price*.formattedWithSeparator)"
    }
    
}
