//
//  UITextFieldExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 Omar Albeik. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit


// MARK: - Properties
public extension UITextField {
	
	/// SwifterSwift: Check if text field is empty.
	public var isEmpty: Bool {
		return text?.isEmpty == true
	}
	
	/// SwifterSwift: Return text with no spaces or new lines in beginning and end.
	public var trimmedText: String? {
		return text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
	}
	
	@IBInspectable
	/// SwifterSwift: Left view tint color.
	public var leftViewTintColor: UIColor? {
		get {
			guard let iconView = leftView as? UIImageView else {
				return nil
			}
			return iconView.tintColor
		}
		set {
			guard let iconView = leftView as? UIImageView else {
				return
			}
			iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
			iconView.tintColor = newValue
		}
	}
	
	@IBInspectable
	/// SwifterSwift: Right view tint color.
	public var rightViewTintColor: UIColor? {
		get {
			guard let iconView = rightView as? UIImageView else {
				return nil
			}
			return iconView.tintColor
		}
		set {
			guard let iconView = rightView as? UIImageView else {
				return
			}
			iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
			iconView.tintColor = newValue
		}
	}
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
}


// MARK: - Methods
public extension UITextField {
	
	/// SwifterSwift: Clear text.
	public func clear() {
		text = ""
		attributedText = NSAttributedString(string: "")
	}
	
	/// SwifterSwift: Set placeholder text color.
	///
	/// - Parameter color: placeholder text color.
	public func setPlaceHolderTextColor(_ color: UIColor) {
		guard let holder = placeholder, !holder.isEmpty else {
			return
		}
		self.attributedPlaceholder = NSAttributedString(string: holder, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): color]))
	}
	
}
#endif

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
