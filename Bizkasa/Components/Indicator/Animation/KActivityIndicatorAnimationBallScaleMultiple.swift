//
//  KActivityIndicatorAnimationBallScaleMultiple.swift
//  DemoLoading
//
//  Created by Tien Dinh on 8/16/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import Foundation

import UIKit

class KActivityIndicatorAnimationBallScaleMultiple: KActivityIndicatorAnimationDelegate {
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 1
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0, 0.2, 0.4]
        
        // Scale animation
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.duration = duration
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.duration = duration
        opacityAnimation.keyTimes = [0, 0.05, 1]
        opacityAnimation.values = [0, 1, 0]
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw balls
        for i in 0 ..< 3 {
            let circle = KActivityIndicatorShape.circle.layerWith(size: size, color: color)
            let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                               y: (layer.bounds.size.height - size.height) / 2,
                               width: size.width,
                               height: size.height)
            
            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame
            circle.opacity = 0
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
}
