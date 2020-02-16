//
//  UIButton+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

extension UIButton {
    func setAttributed(title: String, color: UIColor, font: UIFont?, isUnderLine: Bool = false ) {
        var attr = NSAttributedString()
        if isUnderLine {
            let attributes = [NSAttributedString.Key.foregroundColor: color,
                              NSAttributedString.Key.font: font!,
                              NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue] as [NSAttributedString.Key : Any]
            attr = NSAttributedString(string: title, attributes: attributes)
        } else {
            attr = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font!])
        }
        self.setAttributedTitle(attr, for: .normal)
    }
}

extension UIButton {
    
    func setTitle(text:String, state:UIControl.State = .normal) {
        self.setTitle(text, for: state)
    }
    
    func setTitle(text: String, font: UIFont, color: UIColor, textUnderline: String, fontLine: UIFont, colorLine: UIColor) {
        let formattedText = NSMutableAttributedString()
        formattedText.normalText(text, font: font, color: color).underlineText(textUnderline, font: fontLine, color: colorLine)
        self.setAttributedTitle(formattedText, for: .normal)
    }

    func setTitle(text: String, font: UIFont, color: UIColor) {
        let formattedText = NSMutableAttributedString()
        formattedText.normalText(text, font: font, color: color)
        self.setAttributedTitle(formattedText, for: .normal)
    }

    func setTitleUnderLine(text: String, font: UIFont, color: UIColor) {
        let formattedText = NSMutableAttributedString()
        formattedText.underlineText(text, font: font, color: color)
        self.setAttributedTitle(formattedText, for: .normal)
    }

    @IBInspectable
    /// SwifterSwift: Title of normal state for button; also inspectable from Storyboard.
    public var titleForNormal: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
}
