//
//  Int+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
postfix operator *

postfix func *<T>(element: T?) -> Int {
    return (element == nil) ? 0: Int("\(element!)")!
}

extension Int {
    func toIntPositive()-> Int {
        if self >= 0 {
            return self
        }
        return 0 - self
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension String {
    var formattedWithSeparator: String {
        let int = Int(self)
        return Formatter.withSeparator.string(for: int) ?? ""
    }
}

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
