//
//  ServiceChargeCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/3/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol ServiceChargeCellDelegate: class {
    func deleteTapped(subCharge: SubFeeDetailEntity, indexPath: IndexPath)
}

class ServiceChargeCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!

    var indexPath: IndexPath!
    var subCharge: SubFeeDetailEntity!

    weak var delegate: ServiceChargeCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(info: OrderInfoEntity, indexPath: IndexPath) {
        self.indexPath = indexPath
        let row = indexPath.row - 1
        switch indexPath.section {
        case 3:
            setContent(subCharge: info.MiniBars[row])
        case 4:
            setContent(subCharge: info.Surcharges[row])
        case 5:
            setContent(subCharge: info.Deductibles[row])
        case 6:
            setContent(subCharge: info.Prepaids[row])
        default:
            break
        }
    }

    private func setContent(subCharge: SubFeeDetailEntity) {
        self.subCharge = subCharge
        lbTitle.text = "\(subCharge.Title&), \(subCharge.Price*) x \(subCharge.Quantity*)"
        lbContent.text = "\(subCharge.SubAmount*)"
    }

    @IBAction func btnDeleteTapped() {
        delegate?.deleteTapped(subCharge: subCharge, indexPath: indexPath)
    }
    
}
