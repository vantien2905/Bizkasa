//
//  PaymentCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/7/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class PaymentCell: UITableViewCell {
    
    @IBOutlet weak var vBackground      : UIView!
    @IBOutlet weak var lbCreateDate     : UILabel!
    @IBOutlet weak var lbStaffName      : UILabel!
    @IBOutlet weak var lbPaymentType    : UILabel!
    @IBOutlet weak var lbNote           : UILabel!
    @IBOutlet weak var lbPrice          : UILabel!
    
    var invoice: PaymentEntity? {
        didSet {
            self.setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        vBackground.setShadow()
//        lbCreateDate.setShadow(color: AppColor.secondMain)
    }
    
    private func setData() {
        guard let invoice = invoice else { return }
        lbStaffName.text = "\(invoice.UserUpdate&)"
        lbCreateDate.text = "\(invoice.CreatedDateView&)"
        lbPaymentType.text = "\(invoice.CategoryInvoiceView&)"
        lbNote.text = "\(invoice.Descriptions&)"
        lbPrice.text = invoice.SubAmount?.formattedWithSeparator
    }
}
