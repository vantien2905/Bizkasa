//
//  ScrollKeyboardController.swift
//  Bizkasa
//
//  Created by Tien Dinh on 04/04/2021.
//  Copyright © 2021 DINH VAN TIEN. All rights reserved.
//

import UIKit

extension UIView {
    public func findFirstResponder() -> UIView? {
        if isFirstResponder {
            return self
        }
        
        for subview in subviews {
            
            if let responder = subview.findFirstResponder() {
                return responder
            }
        }
        return nil
    }
}

class ScrollViewKeyboardController: NSObject {
    weak var scrollView: UIScrollView?
    
    override init() {
        super.init()
    }
}

extension ScrollViewKeyboardController {
    func keyboardWillShowWithRect(_ rect: CGRect,
                                  duration: TimeInterval,
                                  animationOptions: UIView.AnimationOptions = []) {
        guard let scrollView = scrollView else {
            return
        }
        
        let convertedRect = scrollView.convert(rect, from: nil)
        let heightDifference = scrollView.bounds.maxY - convertedRect.minY

        var inset = scrollView.contentInset
        inset.bottom = heightDifference
        
        var scrollInset = scrollView.scrollIndicatorInsets;
        scrollInset.bottom = heightDifference;
        
        let offset = contentOffsetOfFirstResponder(in: scrollView, keyboardRect: rect)

        UIView.animate(
            withDuration: duration, delay: 0, options: animationOptions,
            animations: {
                scrollView.contentInset = inset
                scrollView.scrollIndicatorInsets = inset
                
                if let offset = offset {
                    scrollView.contentOffset = offset
                }
                
            },
            completion: nil
        )
    }
    
    func keyboardWillHideWithRect(_ rect: CGRect, duration: TimeInterval, animationOptions: UIView.AnimationOptions = []) {
        guard let scrollView = scrollView else {
            return
        }
        
        var inset = scrollView.contentInset;
        inset.bottom = 0;
        
        var scrollInset = scrollView.scrollIndicatorInsets;
        scrollInset.bottom = 0;
        
        UIView.animate(
            withDuration: duration, delay: 0, options: animationOptions,
            animations: {
                scrollView.contentInset = inset
                scrollView.scrollIndicatorInsets = inset
            },
            completion: nil
        )
    }
    
    private func contentOffsetOfFirstResponder(in scrollView: UIScrollView,
                                               keyboardRect: CGRect) -> CGPoint? {
        
        guard let responder = scrollView.findFirstResponder() else {
            return nil
        }
        
        let keyboardRect = scrollView.convert(keyboardRect, from: nil)
        let responderRect = scrollView.convert(responder.bounds, from: responder)
        
        guard responderRect.maxY > keyboardRect.minY else {
            return nil
        }
        
        let heightDifference = responderRect.maxY - keyboardRect.minY
        
        var offset = scrollView.contentOffset
        offset.y += heightDifference
        
        return offset
    }
}

