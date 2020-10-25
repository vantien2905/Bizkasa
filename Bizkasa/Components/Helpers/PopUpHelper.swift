//
//  PopUpHelper.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

public class PopUpHelper {
    public static let shared = PopUpHelper()
    
    lazy var infoRateSettingpopUp = InfoRateSettingPopUpView()
    
    public func showInfoRateSetting(title: String,
                            hideWhenAction: Bool = true,
                            hideWhenOverTapped: Bool = true,
                            type: BasePopUpViewType = BasePopUpViewType.fromBottom,
                            accept completeYes: CompletionClosure? = nil,
                            cancel completeNo: CompletionClosure? = nil) {
        infoRateSettingpopUp.showPopUp(title: title,
                        hideWhenAction: hideWhenAction,
                        hideWhenOverTapped: hideWhenOverTapped,
                        type: type,
                        accept: completeYes,
                        cancel: completeNo)
        
    }
    
    public func hidePopUpDefault() {
        infoRateSettingpopUp.hidePopUp()
    }
}
