//
//  UILabel+Extensions.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 1/3/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setIconLeft(_ img: UIImage, text:String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = img
        
        //Set bound to reposition
        let imageOffsetY:CGFloat = -5.0;
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 20, height: 20)
        //Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        //Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        //Add image to mutable string
        completeText.append(attachmentString)
        //Add your text to mutable string
        let  textAfterIcon = NSMutableAttributedString(string: text)
        completeText.append(textAfterIcon)
        self.textAlignment = .center;
        self.attributedText = completeText;
        
    }

    func setTextHighlight(_ text: String, searchText: String, color: UIColor = .yellow) {
        self.text = text
        let locale = Locale(identifier: "en-EN")
        let title = text
        let attribute = NSMutableAttributedString(string: title)
        var range = (title as NSString).range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
        if range.location == NSNotFound {
            let newText = title.folding(options: .diacriticInsensitive, locale: locale)
            range = (newText as NSString).range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
        }

        attribute.addAttributes([NSAttributedString.Key.backgroundColor : color], range: range)
        self.attributedText = attribute
    }

    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes:  [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}
