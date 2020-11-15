//
//  AddSurchargeCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol AddSurchargeCellDelegate: class {
    func updateSurcharge(indexPath: IndexPath, surcharge: CheckoutEntity)
}

class AddSurchargeCell: UITableViewCell {
    
    @IBOutlet weak var timeDropdown: AppDropdown!
    @IBOutlet weak var priceTextField: UITextField!
    
    var removeSurchargeCallback: ((_ row: IndexPath)->Void)?
    
    var indexPath: IndexPath!
    
    weak var delegate: AddSurchargeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timeDropdown.hideTextAndLogo()
        timeDropdown.actionButton.isEnabled = false
        var data: [String] = []
        for index in 1...24 {
            data.append("\(index)h")
        }
        // Initialization code
        timeDropdown.dataSource = data
        priceTextField.keyboardType = .numberPad
        
        priceTextField.addTarget(self,
                                 action: #selector(textfieldDidChange),
                                 for: .editingChanged)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    @objc func textfieldDidChange() {
        if let amountString = priceTextField.text?.currencyInputFormatting() {
            priceTextField.text = amountString
        }
        let surchange = CheckoutEntity()
        surchange.Key = timeDropdown.itemSelected + 1
        surchange.Value = Int(priceTextField.text&.removeCommaDecimal())
        delegate?.updateSurcharge(indexPath: indexPath, surcharge: surchange)
    }
    
    func setData(indexPath: IndexPath) {
        self.indexPath = indexPath
        timeDropdown.setItemSelected(index: indexPath.row)
        
        var data: [String] = []
        for index in 1...24 {
            if indexPath.section == SurchanrgeType.addtionCustomerList.rawValue {
                data.append("\(index) người")
            } else {
                data.append("\(index)h")
            }
        }
        // Initialization code
        timeDropdown.dataSource = data
        
    }
    
    func setPrice(price: ConfigPriceEntity, indexPath: IndexPath) {
        switch indexPath.section {
        case SurchanrgeType.checkinDayList.rawValue:
            setTextField(price.CheckinDayList[indexPath.row].Value)
        case SurchanrgeType.checkoutDayList.rawValue:
            setTextField(price.CheckoutDayList[indexPath.row].Value)
        case SurchanrgeType.checkinNightList.rawValue:
            setTextField(price.CheckinNightList[indexPath.row].Value)
        case SurchanrgeType.checkoutNightList.rawValue:
            setTextField(price.CheckoutNightList[indexPath.row].Value)
        case SurchanrgeType.priceByHour.rawValue:
            setTextField(price.PriceByDayList[indexPath.row].Value)
        case SurchanrgeType.addtionCustomerList.rawValue:
            setTextField(price.AddtionCustomerList[indexPath.row].Value)
        default:
            break
        }
    }
    
    private func setTextField(_ value: Int?) {
        if value* != 0 {
            priceTextField.text = "\(value*)"
        } else {
            priceTextField.text = ""
        }
    }
    
    @IBAction func removeSurchargeTapped() {
        removeSurchargeCallback?(indexPath)
    }
    
}
