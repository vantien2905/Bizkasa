//
//  BasePopUpView.swift
//  DQHome-Dev
//
//  Created by Ngoc Duong on 10/19/18.
//  Copyright © 2018 Engma. All rights reserved.
//

import Foundation
import UIKit

public protocol ComponentBuilder {}

public extension ComponentBuilder where Self: Any {
    /// Calls the parameter block in order to update the receiver properties and then returns the object.
    func build(_ block: (Self) -> Void) -> Self {
        block(self)

        return self
    }
}

extension NSObject: ComponentBuilder {}

extension UIView {
    public func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}

public typealias CompletionClosure = (() -> Void)

public enum BasePopUpViewType {
    case fromLeft
    case fromRight
    case fromBottom
    case fromTop
    case zoomOut
    case none
}

import UIKit

open class BasePopUpView: BaseView {
    private lazy var vBackGround = UIView().build {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    open lazy var vContent = UIView().build {
        $0.backgroundColor = UIColor.white
    }
    
    open lazy var btnOver = UIButton().build {
        $0.addTarget(self,
                     action: #selector(self.btnOverTapped),
                     for: .touchUpInside)
    }
    
    open var completionNo: CompletionClosure?
    open var completionYes: CompletionClosure?
    
    private var type: BasePopUpViewType = .fromBottom
    
    open override func setUpViews() {
        addSubview(vBackGround)
        vBackGround.fillSuperviewNotSafe()
        vBackGround.addSubview(btnOver)
        btnOver.fillSuperviewNotSafe()
        vBackGround.addSubview(vContent)
        vContent.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(1000)
        }
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        vContent.setRoundCorners([.topLeft, .topRight], radius: 10)
    }
    
    @objc func btnOverTapped() {
        hidePopUp()
    }
    
    open func showPopUp(type: BasePopUpViewType = BasePopUpViewType.zoomOut,
                        accept completeYes: CompletionClosure? = nil,
                        cancel completeNo: CompletionClosure? = nil) {
        
        if let window = UIApplication.shared.keyWindow {
            self.type = type
            window.addSubview(self)
            self.fillSuperviewNotSafe()
            self.vBackGround.alpha = 0
            self.completionYes = completeYes
            self.completionNo = completeNo
            
            showPopUpBeforeAnimation(type: type)
        }
    }
    
    open func hidePopUp(success: ((Bool) -> Void)? = nil) {
        //-- FIX ME
        if type == .zoomOut {
            self.vContent.frame = CGRect.zero
            self.vContent.alpha = 0
            self.removeFromSuperview()
            success?(true)
        } else {
            self.vBackGround.alpha = 1
            UIView.animate(withDuration: 0.3,
                           animations: {
            }, completion: { [weak self] _ in
                guard let self = self else {
                    success?(false)
                    return
                }
                self.vBackGround.alpha = 0
                self.removeFromSuperview()
                success?(true)
            })
        }
    }
    
    private func showPopUpBeforeAnimation(type: BasePopUpViewType) {
        if type == .none {
            self.layoutIfNeeded()
            self.vBackGround.alpha = 1
            self.vContent.snp.updateConstraints {
                $0.bottom.equalToSuperview().offset(0)
            }
        } else {
            self.vContent.snp.updateConstraints {
                $0.bottom.equalToSuperview().offset(1000)
            }
            self.showPopWithAnimation(type: type)
        }
    }
    
    private func showPopWithAnimation(type: BasePopUpViewType) {
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseIn,
                       animations: { [unowned self] in
                        self.vBackGround.alpha = 1
                        self.vContent.snp.updateConstraints {
                            switch type {
                            case .fromBottom:
                                $0.bottom.equalToSuperview().offset(0)
                            case .fromLeft:
                                $0.leading.equalToSuperview()
                            case .fromRight:
                                $0.trailing.equalToSuperview()
                            case.fromTop:
                                $0.top.equalToSuperview()
                            case.zoomOut:
                                AnimationHelper.shared.animationScale(view: self.vContent,
                                                                      fromScale: 0.1,
                                                                      toScale: 1)
                            case .none:
                                break
                            }
                        }
                        self.layoutIfNeeded()
        })
    }
}
