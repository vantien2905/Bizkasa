//
//  AppFont.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

enum FontType: String {
    case semiBold   = "Roboto-Medium"
    case regular    = "Roboto-Regular"
    case bold       = "Roboto-Bold"
    case italic     = "Roboto-Italic"
}

extension UIFont {
    static func createFont(type: FontType, size: Int) -> UIFont {
        return  UIFont(name: type.rawValue, size: CGFloat(size))!
    }
    
    static var bold14: UIFont {
        return createFont(type: .semiBold, size: 14)
    }
    
    static var regular15: UIFont {
        return createFont(type: .regular, size: 15)
    }
    
    static var regular20: UIFont {
        return createFont(type: .regular, size: 20)
    }
    
    static var semiBold15: UIFont {
        return createFont(type: .semiBold, size: 15)
    }
    
    static var semiBold17: UIFont {
        return createFont(type: .semiBold, size: 17)
    }
    
    static var semiBold22: UIFont {
        return createFont(type: .semiBold, size: 22)
    }
    
    static var regular17: UIFont {
        return createFont(type: .regular, size: 17)
    }
    
    static var bold11: UIFont {
        return createFont(type: .bold, size: 11)
    }
    
    static var bold17: UIFont {
        return createFont(type: .bold, size: 17)
    }
    
    static var bold19: UIFont {
        return createFont(type: .bold, size: 19)
    }
    
    static var bold25: UIFont {
        return createFont(type: .bold, size: 25)
    }
    
    static var regular11: UIFont {
        return createFont(type: .regular, size: 11)
    }
    
    static var italic11: UIFont {
        return createFont(type: .italic, size: 11)
    }
    
    static var italic12: UIFont {
        return createFont(type: .italic, size: 12)
    }
}
