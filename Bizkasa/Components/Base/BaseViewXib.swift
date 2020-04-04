//
//  BaseViewXib.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class BaseViewXib: UIView {
    var view : UIView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    func loadViewFromNib() {
        let nibName     = String(describing: type(of: self))
        let nib         = UINib(nibName: nibName, bundle: Bundle.main)
        view        = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view?.frame      = bounds
        addSubview(view!)
        view?.fillVerticalSuperview()
        view?.fillHorizontalSuperview()
        setUpViews()
    }

    func setUpViews() {

    }
}


