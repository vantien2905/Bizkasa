//
//  HeaderCheckOutCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HeaderCheckOutCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var imgCollapse: UIImageView!

    var selectCallback: (()->Void)?

//    var headerCheckout: HeaderCheckOut? {
//        didSet {
//            self.setData()
//        }
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(header: HeaderCheckOut, indexPath: IndexPath, info: OrderInfoEntity) {
        lbTitle.text = header.title
//        imgCollapse.rotate(header.isCollapse ? .pi : 0)

        switch indexPath.section {
        case 1:
            lbTotal.text = "\(info.RoomAmount*.formattedWithSeparator)"
        case 2:
            lbTotal.text = "\(info.PaymentMethod*.formattedWithSeparator)"
        case 3:
            lbTotal.text = "\(info.MiniBarAmount*.formattedWithSeparator)"
        case 4:
            lbTotal.text = "\(info.SurchargeAmount*.formattedWithSeparator)"
        case 5:
            lbTotal.text = "-\(info.DeductibleAmount*.formattedWithSeparator)"
        case 6:
            lbTotal.text = "-\(info.PrepaidAmount*.formattedWithSeparator)"
        case 7:
            lbTotal.text = "\(info.Customers.count.formattedWithSeparator)"
        case 8:
            lbTotal.text = "\(info.TotalAmount*.formattedWithSeparator)"
        default:
            lbTotal.text = ""
        }

        if indexPath.section == 8 {
            lbTotal.backgroundColor = AppColor.secondMain
        } else {
            lbTotal.backgroundColor = AppColor.normalOrange
        }
    }

    @IBAction func btnSelectTapped() {
//        guard let data = headerCheckout else { return }
//        data.isCollapse = !data.isCollapse
//        imgCollapse.rotate(data.isCollapse ? .pi : 0)
//        imgCollapse.rotate(.pi)
        selectCallback?()

    }
    
}
