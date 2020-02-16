//
//  KActivityIndicatorAnimationSemiCircleSpin.swift
//  DemoLoading
//
//  Created by Tien Dinh on 8/16/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

class KActivityIndicatorAnimationSemiCircleSpin: KActivityIndicatorAnimationDelegate {
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 0.6
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        animation.keyTimes = [0, 0.5, 1]
        animation.values = [0, Double.pi, 2 * Double.pi]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circle
        let circle = KActivityIndicatorShape.circleSemi.layerWith(size: size, color: color)
        let frame = CGRect(
            x: (layer.bounds.width - size.width) / 2,
            y: (layer.bounds.height - size.height) / 2,
            width: size.width,
            height: size.height
        )
        
        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
