//
//  ListReceiptCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 2/29/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ListReceiptCell: UITableViewCell {

    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var lbStatus: AppLabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbIndentifierNumber: UILabel!
    @IBOutlet weak var lbCreateDate: UILabel!
    @IBOutlet weak var lbRoomType: UILabel!
    @IBOutlet weak var lbRoomName: UILabel!
    @IBOutlet weak var lbPrice: UILabel!

    var invoice: InvoiceEntity? {
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
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        vBackground.setShadow()
        lbStatus.setShadow(color: AppColor.secondMain)
    }

    private func setData() {
        guard let invoice = invoice else { return }
        lbName.text = "Tên: \(invoice.CustomerName&)"
        lbIndentifierNumber.text = "CMT: \(invoice.PassportId&)"
        lbCreateDate.text = "Ngày tạo: \(invoice.CreatedDateView&)"
        lbRoomType.text = invoice.RoomClassName
        lbPrice.text = invoice.TotalAmount*.formattedWithSeparator
        lbRoomName.text = invoice.RoomName
        lbStatus.text = OrderStatus.getTitle(invoice.InvoiceStatus*).title
    }

}
