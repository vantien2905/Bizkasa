//
//  Loading+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 7/15/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

var gradientLayerKey = "gradientLayer"
var overlayViewKey = "overlayView"

extension UIColor {

    class func backgroundGray() -> UIColor {
        return UIColor(red: 246.0 / 255, green: 247 / 255, blue: 248 / 255, alpha: 1)
    }

    class func lightGray() -> UIColor {
        return UIColor(red: 238.0 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1)
    }

    class func darkGray() -> UIColor {
        return UIColor(red: 221.0 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1)
    }

}

class OverlayView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.lightGray.cgColor)
        context?.fill(bounds)

        context?.setBlendMode(.clear)
        context?.setFillColor(UIColor.clear.cgColor)

        superview?.subviews.forEach({
            if $0 != self {
                context?.fill($0.frame)
            }
        })
    }

}

extension UIView {

    func startLoading() {
        for animateView in getSubviewsInner(view: self) {
            animateView.startAnimationLoading()
        }
    }

    func stopLoading() {
        for animateView in getSubviewsInner(view: self) {
            animateView.stopAnimationLoading()
        }
    }

    func getSubviewsInner(view: UIView) -> [UIView] {
        var subviewArray = [UIView]()
        if view.subviews.isEmpty {
            return subviewArray
        }
        view.subviews.forEach {

            if let label = $0 as? UILabel {
                subviewArray.append(label)
            }

            if let image = $0 as? UIImageView {
                subviewArray.append(image)
            }

            if let btn = $0 as? UIButton {
                subviewArray.append(btn)
            }

            subviewArray += self.getSubviewsInner(view: $0)
        }
        return subviewArray
    }

    func startAnimationLoading() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.backgroundGray().cgColor,
            UIColor.lightGray().cgColor,
            UIColor.darkGray().cgColor,
            UIColor.lightGray().cgColor,
            UIColor.backgroundGray().cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: -0.85, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.15, y: 0)
        gradientLayer.locations = [-0.85, -0.85, 0, 0.15, 1.15]
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = gradientLayer.locations
        animation.toValue = [0, 1, 1, 1.05, 1.15]

        animation.repeatCount = .infinity
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.duration = 1
        // Add animation cho gradient layer
        gradientLayer.add(animation, forKey: "loading.animation")
        addOverlayView()
        layer.addSublayer(gradientLayer)

        objc_setAssociatedObject(self, &gradientLayerKey, gradientLayer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    func stopAnimationLoading() {
        let overlayView = objc_getAssociatedObject(self, &overlayViewKey) as? OverlayView
        let gradientLayer = objc_getAssociatedObject(self, &gradientLayerKey) as? CAGradientLayer
        overlayView?.removeFromSuperview()
        gradientLayer?.removeFromSuperlayer()
    }

    private func addOverlayView() {
        let overlayView = OverlayView()
        overlayView.frame = bounds
        overlayView.backgroundColor = .clear
        addSubview(overlayView)
        objc_setAssociatedObject(self, &overlayViewKey, overlayView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

}
