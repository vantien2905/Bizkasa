//
//  GeneralInfoCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class GeneralInfoCell: UITableViewCell {
    
    @IBOutlet weak var textField: AppTextFieldLogo!
    
    var textfieldDidChangeCallback: ((_ text: String) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.textFieldCallBack = {[weak self] text in
            guard let self = self else { return }
            self.textfieldDidChangeCallback?(text)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    func setDataConfigure(index: Int) {
        switch index {
        case GeneralConfigure.configureName.rawValue:
            textField.setTitleAndLogo(AppImage.imgRoom,
                                      title: "Tên cấu hình")
        case GeneralConfigure.priceByDay.rawValue:
            textField.setTitleAndLogo(AppImage.payment,
                                      title: "Giá theo ngày")
            textField.setKeyboardDecimal()
        case GeneralConfigure.priceByNight.rawValue:
            textField.setTitleAndLogo(AppImage.payment,
                                      title: "Giá qua đêm")
            textField.setKeyboardDecimal()
        case GeneralConfigure.priceByMonth.rawValue:
            textField.setTitleAndLogo(AppImage.payment,
                                      title: "Giá theo tháng")
            textField.setKeyboardDecimal()
        default:
            break
        }
    }
    
    func setDataConfigureEdit(index: Int, price: PriceEntity?) {
        guard let price = price?.ConfigPriceRow else { return }
        switch index {
        case GeneralConfigure.configureName.rawValue:
            textField.setText(price.Name)
        case GeneralConfigure.priceByDay.rawValue:
            textField.setText("\(price.PriceByDay*)")
            textField.setKeyboardDecimal()
        case GeneralConfigure.priceByNight.rawValue:
            textField.setText("\(price.PriceByNight*)")
            textField.setKeyboardDecimal()
        case GeneralConfigure.priceByMonth.rawValue:
            textField.setText("\(price.PriceByMonth*)")
            textField.setKeyboardDecimal()
        default:
            break
        }
    }
    
    func setData(index: Int) {
        switch index {
        case GeneralInfo.roomType.rawValue:
            textField.setTitleAndLogo(AppImage.imgRoom,
                                      title: "Loại phòng")
        case GeneralInfo.bedNum.rawValue:
            textField.setTitleAndLogo(AppImage.coupleRoom,
                                      title: "Số giường")
            textField.setKeyboardNumber()
        case GeneralInfo.customerNum.rawValue:
            textField.setTitleAndLogo(AppImage.imgUser,
                                      title: "Số người")
            textField.setKeyboardNumber()
        case GeneralInfo.priceByDay.rawValue:
            textField.setTitleAndLogo(AppImage.payment,
                                      title: "Giá theo ngày")
            textField.setKeyboardDecimal()
        case GeneralInfo.priceByNight.rawValue:
            textField.setTitleAndLogo(AppImage.payment,
                                      title: "Giá qua đêm")
            textField.setKeyboardDecimal()
        case GeneralInfo.priceByMonth.rawValue:
            textField.setTitleAndLogo(AppImage.payment,
                                      title: "Giá theo tháng")
            textField.setKeyboardDecimal()
        default:
            break
        }
    }
    
}
