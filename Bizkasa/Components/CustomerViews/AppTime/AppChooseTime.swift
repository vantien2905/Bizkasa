//
//  AppChooseTime.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 12/29/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class AppChooseTime: BaseViewXib {
    @IBOutlet weak var lbDate   : UILabel!
    @IBOutlet weak var lbTime   : UILabel!
    @IBOutlet weak var vContainer   : UIView!
    
    var getDateTime: ((_ dateTime: String) -> Void)?
    
    var dateTime = DateHelper.getDateTimeISO()
    
    override func draw(_ rect: CGRect) {
        vContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fromTimeAction)))
        vContainer.isUserInteractionEnabled = true
        
        getDateTime?(dateTime)
    }

    override func setUpViews() {
        super.setUpViews()
        self.setDateTime()
    }
    
    func setDateTime(){
        lbDate.text = DateHelper.getCurrentDateWithDayAndMonth()
        lbTime.text = DateHelper.getCurrentTime()
    }
    
    @objc func fromTimeAction(){
        let vc = DateTimePickerViewController.createModule(dateTime: dateTime, format: DateFormat.DEFAULT, delegate: self)
        UIApplication.topViewController()?.present(controller: vc)
    }
}

extension AppChooseTime : DateTimePickerViewControllerDelegate {
    func getDateTimeSelected(dateTime: String) {
        self.dateTime = dateTime

        lbDate.text = DateHelper.getSimpleDate(input: dateTime)
        lbTime.text = DateHelper.getTime(input: dateTime)
        getDateTime?(dateTime)
    }
}
