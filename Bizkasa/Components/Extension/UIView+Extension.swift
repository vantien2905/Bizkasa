//
//  UIView+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

extension UIView {

    /// SwifterSwift: Remove all subviews in view.
    public func removeSubviews() {
        subviews.forEach({$0.removeFromSuperview()})
    }
    /// SwifterSwift: Get view's parent view controller
    public var parentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    public func setAnimationTouch(_ scale: CGFloat = 1.15) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut,
                       animations: {
                        self.transform = CGAffineTransform.init(scaleX: scale, y: scale)
                        //reducing the size
                        UIView.animate(withDuration: 0.5,
                                       delay: 0.2,
                                       usingSpringWithDamping: 0.5,
                                       initialSpringVelocity: 2,
                                       options: .curveEaseInOut,
                                       animations: {
                                        self.transform = CGAffineTransform.identity
                                        
                        })
        })
    }

    func setShadow(color: UIColor) {
        self.backgroundColor = color

        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
    }

    func setShadow() {
        self.backgroundColor = UIColor.white

        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
    }

    func setShadowCircle() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
    }
    
    func setShadowCircle(bgColor: UIColor) {
        self.backgroundColor = bgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
    }
}

extension UIView {
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
}

extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
}


extension UIView {
    func endOfView() -> CGFloat {
        return (self.frame.origin.y+self.frame.size.height)
    }

    func setBorder(borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear, cornerRadius: CGFloat) {
        self.layer.masksToBounds        = true
        clipsToBounds                   = true
        self.layer.borderWidth          = borderWidth
        self.layer.borderColor          = borderColor.cgColor
        self.layer.cornerRadius         = cornerRadius
    }

    func setCornerBorderView(cornerMask: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner], cornerRadius: CGFloat = 0, borderColor: UIColor = .clear, borderWidth: CGFloat = 0) {

        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.maskedCorners = cornerMask
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    /// SwifterSwift: Add shadow to view.
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #137992).
    ///   - radius: shadow radius (default is 3).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    public func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        clipsToBounds = false
    }
}

// MARK: Auto Layout
extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {

        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }

    // TODOs: with Supper view

    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
//            if #available(iOS 11.0, *) {
//                leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor).isActive = true
//                rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor).isActive = true
//                topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
//                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
//            } else {
                leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
                rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
                topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
                bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
//            }
        }
    }

    func fillSuperViewWithMargin(_ constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
        }
    }

    func fillSuperViewWithMargin(_ topConstant: CGFloat = 0, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor, constant: topConstant).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
        }
    }

    func fillSuperviewWithOnlyTopSafe() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }

    func fillSuperviewWithTopNavi() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }


    func fillSuperviewNotSafe() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }

    func fillHorizontalSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            if #available(iOS 11, *) {
                leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor, constant: constant).isActive = true
                rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor, constant: -constant).isActive = true
            } else {
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            }
        }
    }

    func fillVerticalSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            if #available(iOS 11, *) {
                topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
            } else {
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            }

        }
    }

    func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false

        _ = anchorWithReturnAnchors(top, left: left,
                                    bottom: bottom, right: right,
                                    topConstant: topConstant, leftConstant: leftConstant,
                                    bottomConstant: bottomConstant, rightConstant: rightConstant,
                                    widthConstant: widthConstant, heightConstant: heightConstant)
    }

    func anchorWithReturnAnchors(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }

        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }

        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }

        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }

        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }

        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }

        anchors.forEach({$0.isActive = true})

        return anchors
    }

    func centerXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            if let anchor = superview?.safeAreaLayoutGuide.centerXAnchor {
                centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        } else {
            if let anchor = superview?.centerXAnchor {
                centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        }
    }

    func centerYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            if let anchor = superview?.safeAreaLayoutGuide.centerYAnchor {
                centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        } else {
            if let anchor = superview?.centerYAnchor {
                centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        }
    }

    func centerSuperview() {
        centerXToSuperview()
        centerYToSuperview()
    }

    enum UIBorderSide {
        case Top, Bottom, Left, Right
    }

    func addLineBorder(side: UIBorderSide, color: UIColor, width: CGFloat, xBottom: CGFloat = 0) {
        let border = CALayer()
        border.backgroundColor = color.cgColor

        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width + 100, height: width)
        case .Bottom:
            border.frame = CGRect(x: xBottom, y: self.frame.size.height - width, width: self.frame.size.width + 100, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }

        layer.addSublayer(border)
        layer.masksToBounds = true
    }

    func addLineBorderWith(inset: CGFloat, side: UIBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor

        switch side {
        case .Top:
            if inset > 0 {
                border.frame = CGRect(x: inset, y: 0, width: frame.size.width + 300, height: width)
            } else {
                border.frame = CGRect(x: 0, y: 0, width: frame.size.width - inset, height: width)
            }
        case .Bottom:
            if inset > 0 {
                border.frame = CGRect(x: inset, y: self.frame.size.height - width, width: self.frame.size.width + 300, height: width)
            } else {
                border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: frame.size.width - inset, height: width)
            }
        case .Left:
            if inset > 0 {
                border.frame = CGRect(x: 0, y: inset, width: width, height: self.frame.size.height - inset)
            } else {
                border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height - inset)
            }
        case .Right:
            if inset > 0 {
                border.frame = CGRect(x: self.frame.size.width - width, y: inset, width: width, height: self.frame.size.height - inset)
            } else {
                border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height - inset)
            }
        }

        layer.addSublayer(border)
        layer.masksToBounds = true
    }

    func roundedTopLeft(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft],
                                     cornerRadii: CGSize(width: 15, height: 15))

        maskPath1.lineWidth = 1.0
        maskPath1.stroke(with: CGBlendMode.color, alpha: 1.0)

        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height+10)
        maskLayer1.path = maskPath1.cgPath

        layer.mask = maskLayer1
    }

    // TODOs: With other view
    func fillToView(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 11.0, *) {
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        } else {
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
            topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        }

    }

    func centerXToView(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 11, *) {
            centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: constant).isActive = true
        } else {
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
        }
    }

    func centerYToView(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: constant).isActive = true
        } else {
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        }

    }

    func centerToView(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXToView(view: view)
        centerYToView(view: view)
    }

    func fillHorizontalToView(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: constant).isActive = true
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -constant).isActive = true
        } else {
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constant).isActive = true
        }

    }

    func fillVerticalToView(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        } else {
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
        }

    }

    func setShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    func setShadowWithCornerRadius(corners : CGFloat = 10){
        self.layer.cornerRadius = corners
        let shadowPath2 = UIBezierPath(rect: self.bounds)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath2.cgPath

    }
    
    func rotateView(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
}

