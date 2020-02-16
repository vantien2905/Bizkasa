//
//  SlideInPresentationManager.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 7/25/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

enum PresentationDirection {
    case left
    case top
    case right
    case bottom
    case center
}

final class SlideInPresentationManager: NSObject {

    static let shared = SlideInPresentationManager()
    // MARK: - Properties
    var direction = PresentationDirection.left
    var disableCompactHeight = false
    var sizePercent: CGFloat = 2/3
}

// MARK: - UIViewControllerTransitioningDelegate
extension SlideInPresentationManager: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = SlideInPresentationController(presentedViewController: presented, presenting: presenting, direction: direction, sizeChild: sizePercent)
        presentationController.delegate = self
        return presentationController
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresentation: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresentation: false)
    }
}

// MARK: - UIAdaptivePresentationControllerDelegate
extension SlideInPresentationManager: UIAdaptivePresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        if traitCollection.verticalSizeClass == .compact && disableCompactHeight {
            return .overFullScreen
        } else {
            return .none
        }
    }

    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        guard case(.overFullScreen) = style else { return nil }

        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RotateViewController")
    }
}
