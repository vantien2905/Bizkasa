//
//  UIImageView+Extension.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 12/3/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit
//
//
extension UIImageView {
    func drawCircle() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        //self.layer.borderWidth = 1.0
        //self.layer.borderColor = UIColor.red.cgColor
    }

}
