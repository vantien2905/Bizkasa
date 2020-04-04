//
//  AnimationHelper.swift
//  DQHome-Dev
//
//  Created by Ngoc Duong on 10/19/18.
//  Copyright © 2018 Engma. All rights reserved.
//

import Foundation

import UIKit
typealias Completion = () -> Void
enum AnimationType: String {
    case scale = "transform.scale"
    case opacity = "opacity"
    case rotation = "transform.rotation"
    case position = "position"
    
    var identity: String {
        return self.rawValue
    }
}

class AnimationHelper: NSObject, CAAnimationDelegate {
    static let shared = AnimationHelper()
    var completion: Completion?
    
    // MARK: layer single Animation
    func animationScale(view: UIView, fromScale: CGFloat, toScale: CGFloat,
                        duration: CGFloat = 0.3, repeatCount: Float = 0,
                        autoreverses: Bool = false, completion: Completion? = nil) {
        let animation = makeScaleAnimation(fromScale: fromScale, toScale: toScale)
        animation.delegate = self
        animation.repeatCount = repeatCount
        animation.autoreverses = autoreverses
        
        self.completion = completion
        
        view.layer.add(animation, forKey: nil)
    }
    
    func animationMove(view: UIView, centerPoint: CGPoint, completion: Completion? = nil) {
        self.completion = completion
        
        //
        let animation = makePositionAnimation(centerPoint: centerPoint)
        animation.delegate = self
        view.layer.add(animation, forKey: nil)
    }
    
    // MARK: layer mutilple animation
    func animationScaleOpacity(view: UIView, fromScale: CGFloat, toScale: CGFloat,
                               fromOpacity: CGFloat, toOpacity: CGFloat,
                               duration: CGFloat = 0.5, completion: Completion? = nil) {
        self.completion = completion
        
        let animationScale = makeScaleAnimation(fromScale: fromScale, toScale: toScale)
        
        let animationOpacity =  makeOpacityAnimation(fromOpacity: fromOpacity, toOpacity: toOpacity)
        
        let group = CAAnimationGroup()
        group.duration = CFTimeInterval(duration)
        group.delegate = self
        group.animations = [animationScale, animationOpacity]
        
        view.layer.add(group, forKey: nil)
    }
    
    func animationMoveRotationScale(view: UIView, fromScale: CGFloat, toScale: CGFloat,
                                    centerPoint: CGPoint, duration: CGFloat = 1,
                                    completion: Completion? = nil) {
        self.completion = completion
        
        let animationScale = makeScaleAnimation(fromScale: fromScale, toScale: toScale)
        
        let animationMove = makePositionAnimation(centerPoint: centerPoint)
        
        let group = CAAnimationGroup()
        group.duration = CFTimeInterval(duration)
        group.delegate = self
        group.animations = [animationScale, animationMove]
        
        view.layer.add(group, forKey: nil)
    }
    
    func animationKeyFrameLayer(view: UIView) {
        let animation = CAKeyframeAnimation(keyPath: AnimationType.rotation.identity)
        animation.duration = 1
        animation.values = [0.0, CGFloat.pi / 2, CGFloat.pi, 3*CGFloat.pi/2, 0.0]
        animation.keyTimes = [0.0, 0.25, 0.5, 0.75]
        
        view.layer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.completion?()
    }
    
    // MARK: UIView Animation
    func animation(view: UIView, from: CGPoint, to: CGPoint, scale: CGFloat, completion: Completion? = nil ) {
        let translationX = to.x - from.x
        let translationY = to.y - from.y
        
        let translation = CGAffineTransform(translationX: translationX, y: translationY)
        let scale = CGAffineTransform(scaleX: scale, y: scale)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
                        let transform = scale.concatenating(translation)
                        view.transform = transform
        }, completion: { _ in
            completion?()
        })
    }
    
    func resetAnimation(view: UIView, completion: Completion? = nil) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1,
                       initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
                        view.transform = .identity
        }, completion: { _ in
            completion?()
        })
    }
}

extension AnimationHelper {
    private func makeScaleAnimation(fromScale: CGFloat, toScale: CGFloat, duration: CGFloat = 0.3) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: AnimationType.scale.identity)
        
        animation.duration = CFTimeInterval(duration)
        animation.fromValue = fromScale
        animation.toValue = toScale
        animation.isRemovedOnCompletion = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        return animation
    }
    
    private func makeOpacityAnimation(fromOpacity: CGFloat, toOpacity: CGFloat, duration: CGFloat = 0.5) -> CABasicAnimation {
        let animationOpacity = CABasicAnimation(keyPath: AnimationType.opacity.identity)
        animationOpacity.fromValue = fromOpacity
        animationOpacity.toValue = toOpacity
        
        return animationOpacity
    }
    
    private func makePositionAnimation(centerPoint: CGPoint, duration: CGFloat = 0.5) -> CABasicAnimation {
        let animationTranslation = CABasicAnimation(keyPath: AnimationType.position.identity)
        animationTranslation.toValue = centerPoint
        animationTranslation.duration = CFTimeInterval(duration)
        
        return animationTranslation
    }
}
