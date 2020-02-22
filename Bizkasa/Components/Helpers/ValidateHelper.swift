//
//  CommonHelper.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 12/3/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class ValidateHelper {
    static let shared = ValidateHelper()

    func canOpenURL(string: String?) -> Bool {
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: string)
    }

}
