//
//  HeaderCheckOutCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol HeaderCheckOutCellDelegate: class {
    func btnAddMoreTapped(indexPath: IndexPath)
}

class HeaderCheckOutCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var btnAddMore: UIButton!
    @IBOutlet weak var vTotal: UIView!
    @IBOutlet weak var vSpace: UIView!

    var selectCallback: (()->Void)?

    var indexPath: IndexPath!

    weak var delegate: HeaderCheckOutCellDelegate?

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
        self.indexPath = indexPath
        vTotal.isHidden = false
        vSpace.isHidden = false

        if indexPath.section == 0 || indexPath.section == 8 {
            btnAddMore.isHidden = true
        } else {
            btnAddMore.isHidden = false
        }

        switch indexPath.section {
        case 1:
            lbTotal.text = "\(info.RoomAmount*.formattedWithSeparator)"
        case 2:
            lbTotal.text = "\(info.AttachmentAmount*.formattedWithSeparator)"
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
            vTotal.isHidden = true
            vSpace.isHidden = true
        }

        if indexPath.section == 8 {
            vTotal.backgroundColor = AppColor.secondMain
        } else {
            vTotal.backgroundColor = AppColor.normalOrange
        }
    }

    @IBAction func btnSelectTapped() {
//        guard let data = headerCheckout else { return }
//        data.isCollapse = !data.isCollapse
//        imgCollapse.rotate(data.isCollapse ? .pi : 0)
//        imgCollapse.rotate(.pi)
        selectCallback?()

    }

    @IBAction func btnAddMoreTapped() {
        delegate?.btnAddMoreTapped(indexPath: indexPath)
    }
    
}
