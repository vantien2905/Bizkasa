//
//  KeyboardNotifier.swift
//  Bizkasa
//
//  Created by Tien Dinh on 04/04/2021.
//  Copyright © 2021 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

protocol KeyboardEvents: class {
    func keyboardWillShowWithRect(_ rect:CGRect, duration: TimeInterval, animationOptions: UIView.AnimationOptions)
    func keyboardWillHideWithRect(_ rect:CGRect, duration: TimeInterval, animationOptions: UIView.AnimationOptions)
}

final class KeyboardNotifier: Multicastable {
    public static let sharedInstance = KeyboardNotifier()
    public let multicast = Multicast<KeyboardEvents>()
    
    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        guard let userInfo = notification.userInfo as NSDictionary?,
            let keyboardFrame: NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue,
            let animation = userInfo.value(forKey: UIResponder.keyboardAnimationDurationUserInfoKey) as? NSNumber,
            let curveInfo = userInfo.value(forKey: UIResponder.keyboardAnimationCurveUserInfoKey) as? NSNumber
            else { return }
        
        let keyboardRectangle = keyboardFrame.cgRectValue
        let animationDuration = animation.doubleValue
        let animationOption = UIView.AnimationOptions(rawValue: UIView.AnimationOptions.RawValue(curveInfo.intValue << 16))
        multicast.invokeMain {
            $0.keyboardWillHideWithRect(
                keyboardRectangle,
                duration: animationDuration,
                animationOptions: animationOption)
        }
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        guard let userInfo = notification.userInfo as NSDictionary?,
            let keyboardFrame: NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue,
            let animation = userInfo.value(forKey: UIResponder.keyboardAnimationDurationUserInfoKey) as? NSNumber,
            let curveInfo = userInfo.value(forKey: UIResponder.keyboardAnimationCurveUserInfoKey) as? NSNumber
            else { return }
        
        let keyboardRectangle = keyboardFrame.cgRectValue
        let animationDuration = animation.doubleValue
        let animationOption = UIView.AnimationOptions(rawValue: UIView.AnimationOptions.RawValue(curveInfo.intValue << 16))
        multicast.invokeMain {
            $0.keyboardWillShowWithRect(
                keyboardRectangle,
                duration: animationDuration,
                animationOptions: animationOption)
        }
    }
}
