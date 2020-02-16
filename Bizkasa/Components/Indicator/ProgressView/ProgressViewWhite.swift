//
//  ProgressViewWhite.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 7/3/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit


open class ProgressViewWhite {

    let vcontainer: UIView = {
        let v = UIView()
        v.backgroundColor = .gray // AppColor.indicatorBackground

        return v
    }()

    let vIndicator: KActivityIndicatorView = {
        let view = KActivityIndicatorView(type: KActivityIndicatorType.ballClipRotate)

        return view
    }()

    let vOver: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()

    public static let shared = ProgressViewWhite()

    private func show(_ view: UIView) {

        view.window?.addSubview(vOver)
        vOver.fillSuperviewWithTopNavi()
        vOver.addSubview(vcontainer)

        vcontainer.centerSuperview()
        vcontainer.anchor(widthConstant: 80, heightConstant: 80)
        vcontainer.setBorder(cornerRadius: 10)
        //---
        vcontainer.addSubview(vIndicator)
        vIndicator.anchor(widthConstant: 60, heightConstant: 60)
        vIndicator.centerSuperview()
        vIndicator.startAnimating()
    }

    open func show() {
        DispatchQueue.main.async {
            guard let view = UIApplication.topViewController()?.view else { return }
            self.show(view)
        }
    }

    func showProgressOnWindow() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else  { return }
            self.show(window)
        }
    }

    open func hide() {
        DispatchQueue.main.async {
            self.vcontainer.removeFromSuperview()
            self.vIndicator.removeFromSuperview()
            self.vOver.removeFromSuperview()
        }
    }

    open func hideAfter(second: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + second) {
            self.vcontainer.removeFromSuperview()
            self.vIndicator.removeFromSuperview()
            self.vOver.removeFromSuperview()
        }
    }
}

