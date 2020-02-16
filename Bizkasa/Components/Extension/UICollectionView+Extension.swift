//
//  UICollectionView+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/9/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit
// MARK: Cell
extension UICollectionViewCell {

//    static var className: String {
//        return String(describing: self)
//    }
//
//    static var identifier: String {
//        return self.className
//    }
}

// MARK: Table
extension UICollectionView {

    // Cell
    func registerCollectionCell<T: UICollectionViewCell>(_: T.Type, fromNib: Bool = true) {
        if fromNib {
            self.register(T.nib, forCellWithReuseIdentifier: T.identifier)
        } else {
            self.register(T.self, forCellWithReuseIdentifier: T.identifier)
        }
    }

    func dequeueCollectionCell<T: UICollectionViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else { return T.init()}

        return cell
    }

}
