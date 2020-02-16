//
//  AppFont.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

enum FontType: String {
    case muliSemiBold = "Muli-SemiBold"
    case muliRegular = "Muli-Regular"
    case muliBold = "Muli-Bold"
    case muliItalic = "Muli-Italic"
}

extension UIFont {
    static func createFont(type: FontType, size: Int) -> UIFont {
        return  UIFont.systemFont(ofSize: 14)
    }

    static var muliSemiBold14: UIFont {
        return createFont(type: .muliSemiBold, size: 14)
    }

    static var muliRegular15: UIFont {
        return createFont(type: .muliRegular, size: 15)
    }

    static var muliRegular20: UIFont {
        return createFont(type: .muliRegular, size: 20)
    }

    static var muliSemiBold15: UIFont {
        return createFont(type: .muliSemiBold, size: 15)
    }

    static var muliSemiBold17: UIFont {
        return createFont(type: .muliSemiBold, size: 17)
    }

    static var muliSemiBold22: UIFont {
        return createFont(type: .muliSemiBold, size: 22)
    }

    static var muliRegular17: UIFont {
        return createFont(type: .muliRegular, size: 17)
    }

    static var muliBold11: UIFont {
        return createFont(type: .muliBold, size: 11)
    }

    static var muliBold14: UIFont {
        return createFont(type: .muliBold, size: 14)
    }

    static var muliBold17: UIFont {
        return createFont(type: .muliBold, size: 17)
    }

    static var muliBold19: UIFont {
        return createFont(type: .muliBold, size: 19)
    }

    static var muliBold25: UIFont {
        return createFont(type: .muliBold, size: 25)
    }

    static var muliRegular11: UIFont {
        return createFont(type: .muliRegular, size: 11)
    }

    static var muliItalic11: UIFont {
        return createFont(type: .muliItalic, size: 11)
    }

    static var muliItalic12: UIFont {
        return createFont(type: .muliItalic, size: 12)
    }
}
