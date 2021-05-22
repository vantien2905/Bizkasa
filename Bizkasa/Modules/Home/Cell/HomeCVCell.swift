//
//  HomeCVCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 2/23/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

extension UIImage {
    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
    
}
class HomeCVCell: UICollectionViewCell {
    
    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .lightGray
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //        vBackground.setShadow()
    }
    
    func setData(index: Int) {
        lbTitle.text = listTitle[index + 1]
        imgLogo.backgroundColor = AppColor.homeArrayColor[index%5]
        imgLogo.image = listImageTitle[index].imageWithInsets(insetDimen: 5)
    }
}
