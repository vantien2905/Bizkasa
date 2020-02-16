//
//  KActivityIndicatorView.swift
//  DemoLoading
//
//  Created by Tien Dinh on 8/16/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

public final class KActivityIndicatorView: UIView {
    public static var DEFAULT_TYPE: KActivityIndicatorType = .ballSpinFadeLoader
    public static var DEFAULT_COLOR = UIColor.white
    public static var DEFAULT_TEXT_COLOR = UIColor.white
    public static var DEFAULT_PADDING: CGFloat = 0
    public static var DEFAULT_BLOCKER_SIZE = CGSize(width: 60, height: 60)
    public static var DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD = 0
    public static var DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME = 0
    public static var DEFAULT_BLOCKER_MESSAGE: String?
    public static var DEFAULT_BLOCKER_MESSAGE_SPACING = CGFloat(8.0)
    public static var DEFAULT_BLOCKER_MESSAGE_FONT = UIFont.boldSystemFont(ofSize: 20)
    public static var DEFAULT_BLOCKER_BACKGROUND_COLOR = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    
    public static var DEFAULT_FADE_IN_ANIMATION: FadeInAnimation = { view in
        view.alpha = 0
        UIView.animate(withDuration: 0.25) {
            view.alpha = 1
        }
    }
    
    public static var DEFAULT_FADE_OUT_ANIMATION: FadeOutAnimation = { (view, complete) in
        UIView.animate(withDuration: 0.25,
                       animations: {
                        view.alpha = 0
        },
                       completion: { completed in
                        if completed {
                            complete()
                        }
        })
    }
    
    /// Animation type.
    public var type: KActivityIndicatorType = KActivityIndicatorView.DEFAULT_TYPE
    
    /// Color of activity indicator view.
    public var color: UIColor = KActivityIndicatorView.DEFAULT_COLOR
    
    /// Padding of activity indicator view.
    public var padding: CGFloat = KActivityIndicatorView.DEFAULT_PADDING
    
    public var animating: Bool { return isAnimating }
    /// Current status of animation, read-only.
    private(set) public var isAnimating: Bool = false
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        isHidden = true
    }
    
    /**
     Create a activity indicator view.
     
     Appropriate NVActivityIndicatorView.DEFAULT_* values are used for omitted params.
     
     - parameter frame:   view's frame.
     - parameter type:    animation type.
     - parameter color:   color of activity indicator view.
     - parameter padding: padding of activity indicator view.
     
     - returns: The activity indicator view.
     */
    public init(frame: CGRect? = nil , type: KActivityIndicatorType? = nil, color: UIColor? = nil, padding: CGFloat? = nil) {
        self.type = type ?? KActivityIndicatorView.DEFAULT_TYPE
        self.color = color ?? KActivityIndicatorView.DEFAULT_COLOR
        self.padding = padding ?? KActivityIndicatorView.DEFAULT_PADDING
        let tempFrame = frame == nil ? CGRect(origin: CGPoint.zero, size: KActivityIndicatorView.DEFAULT_BLOCKER_SIZE): frame!
        
        super.init(frame: tempFrame)
        isHidden = true
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        isHidden = true
    }
    
    public final func startAnimating() {
        isHidden = false
        isAnimating = true
        layer.speed = 1
        setUpAnimation()
    }
    
    public final func stopAnimating() {
        isHidden = true
        isAnimating = false
        layer.sublayers?.removeAll()
    }
    
    private final func setUpAnimation() {
        let animation: KActivityIndicatorAnimationDelegate = type.animation()
        
        var animationRect = frame.inset(by: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
        let minEdge = min(animationRect.width, animationRect.height)
        
        layer.sublayers = nil
        animationRect.size = CGSize(width: minEdge, height: minEdge)
        animation.setUpAnimation(in: layer, size: animationRect.size, color: color)
    }
}
