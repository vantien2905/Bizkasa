//
//  KActivityIndicatorAnimationBallZigZagDeflect.swift
//  DemoLoading
//
//  Created by Tien Dinh on 8/16/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//


import UIKit

class KActivityIndicatorAnimationBallZigZagDeflect: KActivityIndicatorAnimationDelegate {
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let circleSize: CGFloat = size.width / 5
        let duration: CFTimeInterval = 0.75
        let deltaX = size.width / 2 - circleSize / 2
        let deltaY = size.height / 2 - circleSize / 2
        let frame = CGRect(x: (layer.bounds.size.width - circleSize) / 2, y: (layer.bounds.size.height - circleSize) / 2, width: circleSize, height: circleSize)
        
        // Circle 1 animation
        let animation = CAKeyframeAnimation(keyPath: "transform")
        
        animation.keyTimes = [0, 0.33, 0.66, 1]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        animation.values = [
            NSValue(caTransform3D: CATransform3DMakeTranslation(0, 0, 0)),
            NSValue(caTransform3D: CATransform3DMakeTranslation(-deltaX, -deltaY, 0)),
            NSValue(caTransform3D: CATransform3DMakeTranslation(deltaX, -deltaY, 0)),
            NSValue(caTransform3D: CATransform3DMakeTranslation(0, 0, 0))
        ]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.autoreverses = true
        animation.isRemovedOnCompletion = false
        
        // Draw circle 1
        circleAt(frame: frame, layer: layer, size: CGSize(width: circleSize, height: circleSize), color: color, animation: animation)
        
        // Circle 2 animation
        animation.values = [
            NSValue(caTransform3D: CATransform3DMakeTranslation(0, 0, 0)),
            NSValue(caTransform3D: CATransform3DMakeTranslation(deltaX, deltaY, 0)),
            NSValue(caTransform3D: CATransform3DMakeTranslation(-deltaX, deltaY, 0)),
            NSValue(caTransform3D: CATransform3DMakeTranslation(0, 0, 0))
        ]
        
        // Draw circle 2
        circleAt(frame: frame, layer: layer, size: CGSize(width: circleSize, height: circleSize), color: color, animation: animation)
    }
    
    func circleAt(frame: CGRect, layer: CALayer, size: CGSize, color: UIColor, animation: CAAnimation) {
        let circle = KActivityIndicatorShape.circle.layerWith(size: size, color: color)
        
        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
