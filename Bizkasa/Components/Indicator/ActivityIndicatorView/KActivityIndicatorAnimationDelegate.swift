//
//  KActivityIndicatorAnimationDelegate.swift
//  DemoLoading
//
//  Created by Tien Dinh on 8/16/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//


import UIKit

protocol KActivityIndicatorAnimationDelegate {
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor)
}

