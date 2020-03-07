//
//  String+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration


let CC_SHA256_DIGEST_LENGTH   =  32

postfix operator &

postfix func & <T>(element: T?) -> String {
    return (element == nil) ? "" : "\(element!)"
}

postfix func & <T>(element: T) -> String {
    return "\(element)"
}

extension String {
    func convertDateString(fromFormat: String, toFormat: String = "yyyy-MM-dd") -> String? {
        let from = DateFormatter()
        from.dateFormat = fromFormat
        let dateFrom = from.date(from: self)!

        let to = DateFormatter()
        to.dateFormat = toFormat
        let toString = to.string(from: dateFrom)
        return toString
    }


    func convertUrl() -> URL? {
        let temp = self
        let domain = UserDefaultHelper.shared.getDomain()&
        let url = URL(string: domain)?.appendingPathComponent(temp)

        return url
    }
}

extension String {
    func date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: self)
    }
}

extension String {

     ///Encode to utf8
    //  public var utf8: Data? {
    //    return self.data(using: String.Encoding.utf8)
    //  }

    func contains(_ string: String, caseSensitive: Bool = true) -> Bool {
        if !caseSensitive {
            return range(of: string, options: .caseInsensitive) != nil
        }
        return range(of: string) != nil
    }

      func stringToBytes() -> [UInt8]? {
        let length = self.count
        if length & 1 != 0 {
          return nil
        }
        var bytes = [UInt8]()
        bytes.reserveCapacity(length/2)
        var index = self.startIndex
        for _ in 0..<length/2 {
          let nextIndex = self.index(index, offsetBy: 2)
          if let b = UInt8(self[index..<nextIndex], radix: 16) {
            bytes.append(b)
          } else {
            return nil
          }
          index = nextIndex
        }
        return bytes
      }

    // formatting text for currency textField
    func currencyInputFormatting(digit: Int) -> String {

        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = digit
        formatter.minimumFractionDigits = digit

        var amountWithPrefix = self

        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")

        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double/pow(Double(10), Double(digit))))

        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number)!
    }

    func formatToDouble(digit: Int) -> Double {

        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = digit
        formatter.minimumFractionDigits = digit

        var amountWithPrefix = self

        //        Double(vMoney.textField.text&.replacingOccurrences(of: ".", with: ""))

        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9.]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")

        let num = amountWithPrefix.toDouble()

        let double = Double(round(100*num)/100)// (amountWithPrefix as NSString).doubleValue

        return double
    }

    func removeCommaDecimal() -> String {
        let result = self.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: "")

        return result
    }

}

extension String {

    func htmlDecoded()->String {

        guard (self != "") else { return self }

        var newStr = self
        // from https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
        let entities = [ //a dictionary of HTM/XML entities.
            "&quot;"    : "\"",
            "&amp;"     : "&",
            "&apos;"    : "'",
            "&lt;"      : "<",
            "&gt;"      : ">",
            "&deg;"     : "º",
            ]

        for (name,value) in entities {
            newStr = newStr.replacingOccurrences(of: name, with: value)
        }
        return newStr
    }

    func htmlEncoded()->String {

        guard (self != "") else { return self }

        var newStr = self
        // from https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
        let entities = [ //a dictionary of HTM/XML entities.
            "&quot;"    : "\"",
            "&amp;"     : "&",
            "&apos;"    : "'",
            "&lt;"      : "<",
            "&gt;"      : ">",
            "&deg;"     : "º",
            ]

        for (name,value) in entities {
            newStr = newStr.replacingOccurrences(of: value, with: name)
        }
        return newStr
    }

    func isValidEmpty() -> Bool {
        if self.cutWhiteSpace().isEmpty {
            return true
        }
        return (self.cutWhiteSpace().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "")
    }

    func cutWhiteSpace() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func toDouble() -> Double {
        let nsString = self as NSString
        return nsString.doubleValue
    }
}

//MARK: validate
extension String {
    func phoneString() -> String? {
        return self.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
    }

    func sha256Ma() -> String {
        if let stringData = self.data(using: String.Encoding.utf8) {
            return hexStringFromData(input: digest(input: stringData as NSData))
        }
        return ""
    }

    private func digest(input : NSData) -> NSData {
        let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
        var hash = [UInt8](repeating: 0, count: digestLength)
        //        CC_SHA256(input.bytes, UInt32(input.length), &hash)
        return NSData(bytes: hash, length: digestLength)
    }

    private  func hexStringFromData(input: NSData) -> String {
        var bytes = [UInt8](repeating: 0, count: input.length)
        input.getBytes(&bytes, length: input.length)

        var hexString = ""
        for byte in bytes {
            hexString += String(format:"%02x", UInt8(byte))
        }

        return hexString
    }

    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func isEmptyIgnoreNewLine() -> Bool {
        return self.trim().isEmpty
    }

    /// SwifterSwift: Array of strings separated by given string.
    ///
    /// - Parameter separator: separator to split string by.
    /// - Returns: array of strings separated by given string.
    func splitted(by separator: Character) -> [String] {
        return self.split{$0 == separator}.map(String.init)
    }

    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func hasSpecialCharacters() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9 _ .].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }

        return false
    }

    func isValidPhone() -> Bool {
        let emailRegEx = "^(1\\-)?[0][0-9]{2,3}\\-?[0-9]{3,4}\\-?[0-9]{4,6}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

        let emailRegEx1 = "^(1\\-)?[+][0-9]{2,3}\\-?[0-9]{2,3}\\-?[0-9]{3,4}\\-?[0-9]{4,6}$"
        let emailTest1 = NSPredicate(format:"SELF MATCHES %@", emailRegEx1)

        return emailTest.evaluate(with: self) || emailTest1.evaluate(with: self)
    }

    func isValidPhone2() -> Bool {
        let phoneRegEx = "^[+]?[0-9]{10,14}$"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }

    func isValidLatterAndNumber() -> Bool {
        let tatterAndNumberRegEx = "^[a-zA-Z0-9]*$" // "^[a-zA-Z0-9]+([_ .]?[a-zA-Z0-9])*$"
        let ltatterAndNumberTest = NSPredicate(format:"SELF MATCHES %@", tatterAndNumberRegEx)

        return ltatterAndNumberTest.evaluate(with: self)
    }

    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    func attributedString(fontSize : Float) -> NSAttributedString? {
        if(self == ""){
            return nil
        }
        let oldString = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(fontSize)\">%@</span>", self)

        guard let data = oldString.data(using: String.Encoding.utf8,
                                        allowLossyConversion: false) else { return nil }
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html,

            ]
        let htmlString = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)

        // Removing this line makes the bug reappear
        htmlString?.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.clear, range: NSMakeRange(0, 1))

        return htmlString
    }

    func attributedString() -> NSAttributedString? {
        if(self == ""){
            return nil
        }
        guard let data = self.data(using: String.Encoding.utf8,
                                   allowLossyConversion: false) else { return nil }
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
        ]
        let htmlString = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)

        // Removing this line makes the bug reappear
        htmlString?.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.clear, range: NSMakeRange(0, 1))

        return htmlString
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension String {
    func toAttributedString(color: UIColor, font: UIFont? = nil, isUnderLine: Bool = false) -> NSAttributedString {
        if let font = font {
            if isUnderLine {
                return NSAttributedString(string: self,
                                          attributes: [NSAttributedString.Key.font: font,
                                                       NSAttributedString.Key.foregroundColor: color,
                                                       NSAttributedString.Key.underlineColor: color,
                                                       NSAttributedString.Key.underlineStyle: 1])
            }
            return NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color])
        } else {
            return NSAttributedString(string: self, attributes: [NSAttributedString.Key.foregroundColor: color])
        }

    }

    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }

    subscript (bounds: Int) -> String {
        let start = index(startIndex, offsetBy: bounds)
        return String(self[start])
    }
}

extension String {
    func toDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    func getSub(count: Int) -> String {
        if self.count > count {
            let start = String.Index(encodedOffset: 0)
            let end = String.Index(encodedOffset: count)
            let substring = String(self[start..<end])

            return "\(substring)..."
        }
        return self

    }
}

extension String {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }

        return String(data: data as Data, encoding: String.Encoding.utf8)
    }

    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }

        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }

    func removeTextInBase64() -> String {
        var str = self
        str = str.replacingOccurrences(of: "data:image/jpeg;base64,", with: "")
        str = str.replacingOccurrences(of: "data:image/png;base64,", with: "")
        str = str.replacingOccurrences(of: "data:image/jpg;base64,", with: "")

        return str
    }

    func toUIImage() -> UIImage? {
        let dataString = Data(base64Encoded: self, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
        guard let data = dataString else { return nil }
        return UIImage(data: data)
    }
}
extension StringProtocol where Index == String.Index {
    func nsRange(from range: Range<Index>) -> NSRange {
        return NSRange(range, in: self)
    }
}
extension String {
    func addComma() -> String? {
        if self.isEmpty == false{
            let formater = NumberFormatter()
            formater.groupingSeparator = ","
            formater.numberStyle = .decimal
            if let num = formater.number(from: self){
                return formater.string(from: num)
            }
            else{
                return nil
            }
        }
        return nil
    }

    func getSubString(fromCharacter: String) -> String?{
        if let range = self.range(of: fromCharacter) {
            let subText = self[range.upperBound...]
            return String(subText)
        }
        return nil
    }

}

extension String {
    /// Rounds the double to decimal places value
    func roundedDemical() -> String {
        if let float = Float(self) {
            return String(format: "%.1f", float)
        } else {
            return "0"
        }

    }
}


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension String {

    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }

    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
    
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
}
