//
//  AppTitleImage.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 11/8/19.
//  Copyright © 2019 Lac Viet Corp. All rights reserved.
//

import Foundation
import UIKit

class AppTitleLogo: BaseViewXib {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!

    func setTitleAndLogo(_ image: UIImage, title: String) {
        imgLogo.image = image
        lbTitle.text = title
    }
    
    func setBold(){
        lbTitle.font = UIFont.boldSystemFont(ofSize: 17 )
    }
}
