//
//  BasePopUpView.swift
//  DQHome-Dev
//
//  Created by Ngoc Duong on 10/19/18.
//  Copyright © 2018 Engma. All rights reserved.
//

import UIKit

typealias CompletionClosure = (() -> Void)
typealias CompletionMessage = ((_ message: String?) -> Void)
typealias CompletionAny = ((_ item: Any?) -> Void)

enum BasePopUpViewType {
    case fromLeftToCenter
    case fromRightToCenter
    case fromBottomToCenter
    case fromTopToCenter
    case zoomOut
}

class BasePopUpView: UIView {
    let vBackGround: UIView = {
        let view                = UIView()
        view.backgroundColor    = UIColor.black.withAlphaComponent(0.2)
        return view
    }()
    
    let vContent: UIView = {
        let view                = UIView()
        view.backgroundColor    = UIColor.black.withAlphaComponent(0.9)
        view.setBorder(borderWidth: 1, borderColor: AppColor.whiteColor.withAlphaComponent(0.7), cornerRadius: 5)
        return view
    }()
    
    lazy var btnOver: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(self.btnOverTapped), for: .touchUpInside)
        
        return button
    }()
    
    var completionNo: CompletionClosure?
    var completionYes: CompletionClosure?
    
    private var widthContent: CGFloat = 0
    private var heightContent: CGFloat = 0
    private var minXContent: CGFloat = 0
    private var minYContent: CGFloat = 0
    private var widthWindow: CGFloat = 0
    private var heightWindow: CGFloat = 0
    private var type: BasePopUpViewType = .fromLeftToCenter
    
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        addSubview(vBackGround)
        vBackGround.fillSuperview()
        vBackGround.addSubview(btnOver)
        btnOver.fillSuperview()
        vBackGround.addSubview(vContent)
    }
    
    @objc func btnOverTapped() {
        hidePopUp()
    }
    
    func showPopUp(width: CGFloat = 250 , height: CGFloat = 250, type: BasePopUpViewType = BasePopUpViewType.zoomOut) {
        
        if let window = UIApplication.shared.keyWindow {
            if #available(iOS 11.0, *) {
                widthWindow = window.safeAreaLayoutGuide.layoutFrame.width
                heightWindow = window.safeAreaLayoutGuide.layoutFrame.height
            } else {
                widthWindow = window.frame.width
                heightWindow = window.frame.height
            }
            
            //---
            minXContent = (widthWindow - width) / 2
            minYContent = (heightWindow - height) / 2
            widthContent = width
            heightContent = height
            self.type = type
            
            //---
            window.addSubview(self)
            self.fillSuperview()
            self.vBackGround.alpha = 0
            
            //---
            showPopWithAnimation(type: type)
        }
    }
    
    func hidePopUp(success: ((Bool) -> Void)? = nil) {
        
        self.hidePopUpWithAnimation()
        
        //-- FIX ME
        if type == .zoomOut {
            
//            AnimationHelper.shared.animationScaleOpacity(view: self.vContent, fromScale: 1, toScale: 0, fromOpacity: 1, toOpacity: 0, duration: 0.1) {
//                
//            }
            
            self.vContent.frame = CGRect.zero
            self.vContent.alpha = 0
            self.removeFromSuperview()
            success?(true)
        } else {
            self.vBackGround.alpha = 1
            UIView.animate(withDuration: 0.3, animations: { [unowned self] in
                self.hidePopUpWithAnimation()
                }, completion: { [weak self] _ in
                    guard let strongSelf = self else {
                        success?(false)
                        return }
                    
                    strongSelf.vBackGround.alpha = 0
                    strongSelf.removeFromSuperview()
                    success?(true)
            })
            
        }
        
    }
    
    private func hidePopUpWithAnimation() {
        switch type {
        case .fromBottomToCenter:
            self.vContent.frame = CGRect(x: minXContent, y: 0 - heightContent, width: widthContent, height: heightContent)
            break
        case .fromLeftToCenter:
            self.vContent.frame = CGRect(x: widthWindow + widthContent, y: minYContent, width: widthContent, height: heightContent)
            break
        case .fromRightToCenter:
            self.vContent.frame = CGRect(x: -widthContent, y: minYContent, width: widthContent, height: heightContent)
            break
        case .fromTopToCenter:
            
            
            self.vContent.frame = CGRect(x: minXContent, y: heightWindow + heightContent, width: widthContent, height: heightContent)
            break
        case .zoomOut:
            break
        }
    }
    
    private func showPopUpBeforeAnimation(type: BasePopUpViewType) {
        self.vBackGround.alpha = 0
        switch type {
        case .fromBottomToCenter:
            self.vContent.frame = CGRect(x: minXContent, y: 1000, width: widthContent, height: heightContent)
            break
        case .fromLeftToCenter:
            self.vContent.frame = CGRect(x: -1000, y: minYContent, width: widthContent, height: heightContent)
            break
        case .fromRightToCenter:
            self.vContent.frame = CGRect(x: 1000, y: minYContent, width: widthContent, height: heightContent)
            break
        case .fromTopToCenter:
            self.vContent.frame = CGRect(x: minXContent, y: -1000, width: widthContent, height: heightContent)
            break
        case .zoomOut:
            self.vBackGround.alpha = 1
            self.vContent.frame = CGRect(x: minXContent, y: minYContent, width: widthContent, height: heightContent)
        }
    }
    
    private func showPopWithAnimation(type: BasePopUpViewType) {
        showPopUpBeforeAnimation(type: type)
        
        switch type {
        case .fromBottomToCenter, .fromLeftToCenter, .fromRightToCenter, .fromTopToCenter:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseOut, animations: { [unowned self] in
                self.vBackGround.alpha = 1
                self.vContent.frame = CGRect(x: self.minXContent, y: self.minYContent, width: self.widthContent, height: self.heightContent)
                }, completion: nil)
            
        case .zoomOut:
            AnimationHelper.shared.animationScale(view: self.vContent, fromScale: 0.1, toScale: 1)
            
        }
    }
    
}
