//
//  NSMutableAttributedString+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    @discardableResult func underlineText(_ text:String, font: UIFont, color: UIColor) -> NSMutableAttributedString {

        let attrs : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : font,
            NSAttributedString.Key.foregroundColor : color,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        let boldString = NSMutableAttributedString(string: text, attributes: attrs)
        self.append(boldString)
        return self
    }

    @discardableResult func normalText(_ text:String, font: UIFont, color: UIColor)->NSMutableAttributedString {
        let attrs : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : font,
            NSAttributedString.Key.foregroundColor : color
        ]
        let normal =  NSAttributedString(string: text,  attributes:attrs)
        self.append(normal)
        return self
    }
}
