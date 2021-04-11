//
//  NotificationCollectionViewCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 28/03/2021.
//  Copyright © 2021 DINH VAN TIEN. All rights reserved.
//

import UIKit

class NotificationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var background: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.text = "Bizkasa chúc bạn một ngày mới tốt lành!!!"
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        background.setShadow(color: AppColor.normalOrange)
    }

}
