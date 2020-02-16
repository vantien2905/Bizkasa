////
////  LocalizationManager.swift
////  TaskManagement
////
////  Created by DINH VAN TIEN on 1/22/19.
////  Copyright © 2019 Thang Nguyen. All rights reserved.
////
//
//import UIKit
//
//extension UIView {
//
//    @IBInspectable var localizationKey: String? {
//        get {
//            return self.accessibilityIdentifier
//        }
//        set {
//            return self.accessibilityIdentifier = newValue
//        }
//    }
//
//    static var getClassName: String {
//        return String(describing: self)
//    }
//    //  MARK: - public function
//    /// This function is help to create & check (when the scheme is in Localization) and apply (when in normal scheme)
//    ///
//    /// - parameter classType: current calling class
//    func convertToLocalize(_ classType: AnyClass) {
//        #if CREATE
//        self.createResourceLocalization(classType: classType)
//        #else
//        self.loadTextLocalization(classType: classType)
//        #endif
//    }
//
//    private var viewInfo: String {
//        return "\(classForCoder), frame: \(frame))"
//    }
//
//     func loadTextLocalization(classType: AnyClass) {
//        let classNameString = String(describing: classType)
//        _ = loadText(parentView: self, className: classNameString)
//    }
//
//    //--Load localize
//    private func loadText(parentView: UIView, level: Int = 0, className: String = "") {
//
//        for subview in parentView.subviews {
//            if let identify = subview.localizationKey {
//                let key = "\(className).\(identify)"
//
//                if let label = subview as? UILabel  {
//                    if let replacementString =  RealmHelper.share.getObjects(LanguageResourceEntity.self).filter("key == '\(key)'").first?.value {
//                        label.text = replacementString
//                    }
//                }
//
//                if let button = subview as? UIButton {
//                    if let replacementString =  RealmHelper.share.getObjects(LanguageResourceEntity.self).filter("key == '\(key)'").first?.value {
//                        button.setTitle( replacementString, for: .normal)
//                        button.setTitle( replacementString, for: .selected)
//                        button.setTitle( replacementString, for: .disabled)
//                    }
//                }
//
//                if let textField = subview as? UITextField {
//                    if let replacementString =  RealmHelper.share.getObjects(LanguageResourceEntity.self).filter("key == '\(key)'").first?.value {
//                        textField.placeholder = replacementString
//                    }
//                }
//
//                if let radioButton = subview as? DLRadioButton {
//                    if let replacementString =  RealmHelper.share.getObjects(LanguageResourceEntity.self).filter("key == '\(key)'").first?.value {
//                        radioButton.setTitle(replacementString, for: .normal)
//                    }
//                }
//            }
//            if subview.subviews.count != 0 {
//                loadText(parentView: subview, level: level + 1, className: className)
//            }
//        }
//    }
//
//    func createResourceLocalization(classType: AnyClass) {
//        let classNameString = String(describing: classType)
//        _ = subviews(parentView: self, className: classNameString)
//    }
//
//    //---create resource
//    private func subviews(parentView: UIView, level: Int = 0, className: String = "") {
//        for subview in parentView.subviews {
//            print("TYPE: \(subview)")
//            if let identify = subview.localizationKey {
//                let key = "\(className).\(identify)"
//
//                //-------Check view type
//                if let label = subview as? UILabel {
//                    self.saveToRealmDB(key: key, value: label.text&)
//                }
//
//                if let button = subview as? UIButton {
//                    self.saveToRealmDB(key: key, value: button.titleForNormal&)
//                }
//
//                if let textField = subview as? UITextField {
//                    self.saveToRealmDB(key: key, value: textField.placeholder&)
//                }
//
//                if let radioButton = subview as? DLRadioButton {
//                    self.saveToRealmDB(key: key, value: radioButton.titleForNormal&)
//                }
//            }
//
//            //Recursive find all view
//            if subview.subviews.count != 0 {
//                subviews(parentView: subview, level: level + 1, className: className)
//            }
//        }
//    }
//
//    private func saveToRealmDB(key: String, value: String) {
//        let myItem = LanguageResourceEntity(key: key, value: value)
//            RealmHelper.share.addObject(myItem)
//    }
//}
//
//extension String {
//
//    func localization(_ fileURL: String = #file) -> String {
//        let fileName = (fileURL as NSString).lastPathComponent
//        let name = (fileName as NSString).deletingPathExtension
////        let className = String(describing: type(of: anyObject))
//        let key = "\(name).\(self)"
//        #if CREATE
//        let myItem = LanguageResource(key: key, value: self)
//        RealmHelper.share.addObject(myItem)
//        return self
//        #else
//        return RealmHelper.share.getObjects(LanguageResourceEntity.self).filter("key == '\(key)'").first?.value ?? NSLocalizedString(self, comment: "")
//        #endif
//
//    }
//
//    func localizationOther(name: String) -> String {
//        let key = "\(name).\(self)"
//        #if CREATE
//        let myItem = LanguageResource(key: key, value: self)
//        RealmHelper.share.addObject(myItem)
//        return self
//        #else
//        return RealmHelper.share.getObjects(LanguageResourceEntity.self).filter("key == '\(key)'").first?.value ?? NSLocalizedString(self, comment: "")
//        #endif
//    }
//}
