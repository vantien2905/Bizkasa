//
//  HeaderSurchargeCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HeaderSurchargeCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var section: Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var addCallback: ((_ section: Int)->Void)?
    
    func setTitle(section: Int) {
        self.section = section
        switch section {
        case SurchanrgeType.checkinDayList.rawValue:
            titleLabel.text = "Phụ thu checkin sớm (theo ngày)"
        case SurchanrgeType.checkoutDayList.rawValue:
            titleLabel.text = "Phụ thu quá giờ checkout (theo ngày)"
        case SurchanrgeType.checkinNightList.rawValue:
            titleLabel.text = "Phụ thu checkin sớm (theo đem)"
        case SurchanrgeType.checkoutNightList.rawValue:
            titleLabel.text = "Phụ thu quá giờ checkout (theo đêm)"
        case SurchanrgeType.priceByHour.rawValue:
            titleLabel.text = "Giá bán theo giờ"
        case SurchanrgeType.addtionCustomerList.rawValue:
            titleLabel.text = "Phụ thu thêm khách"
        default:
            break
        }
    }
    
    @IBAction func addButtonTapped() {
        addCallback?(section)
    }
}
