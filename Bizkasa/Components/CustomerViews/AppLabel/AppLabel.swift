//
//  AppLabel.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/15/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

@IBDesignable class AppLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 10.0
    @IBInspectable var rightInset: CGFloat = 10.0

    var radius: CGFloat = 10.0 {
        didSet {
            layer.cornerRadius = radius
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }

    func setUpView() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
    }

    var onClick: () -> Void = {}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setAnimationTouch()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        onClick()
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
        self.layer.cornerRadius = 10
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
