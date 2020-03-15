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
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbIndentifierNumber: UILabel!
    @IBOutlet weak var lbCreateDate: UILabel!
    @IBOutlet weak var lbRoomType: UILabel!

    var customer: CustomerEntity? {
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
        lbStatus.setShadow(color: .orange)
    }

    private func setData() {
        guard let customer = customer else { return }
        lbName.text = "Tên: \(customer.Name&)"
        lbIndentifierNumber.text = "CMT: \(customer.PassportId&)"
        lbCreateDate.text = "Ngày tạo: \(customer.CheckInDate&)"
        lbRoomType.text = customer.RoomClassName
//        lbStatus.text = customer.
    }
    
}
