//
//  AppDateTime.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 12/18/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class AppDateTime: BaseViewXib {
//    @IBOutlet weak var lbFromDate   : UILabel!
//    @IBOutlet weak var lbToDate     : UILabel!
//    @IBOutlet weak var lbFromTime   : UILabel!
//    @IBOutlet weak var lbToTime     : UILabel!
//    @IBOutlet weak var vFromTime    : UIView!
//    @IBOutlet weak var vToTime      : UIView!
    @IBOutlet weak var vTitle: AppTitleLogo!
       @IBOutlet weak var tfContent: UITextField!
       @IBOutlet weak var vBottomLine: UIView!
       @IBOutlet weak var heightTitle: NSLayoutConstraint!
    
    var getDateTime: ((_ fromTime: String, _ toTime: String) -> Void)?
    
    var fromTime = DateHelper.getDateTimeISO(), toTime = DateHelper.getNextDateTimeISO()
    
    override func draw(_ rect: CGRect) {
//        vFromTime.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fromTimeAction)))
//        vToTime.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toTimeAction)))
//        vFromTime.isUserInteractionEnabled = true
//        vToTime.isUserInteractionEnabled = true
//
        getDateTime?(fromTime , toTime)
    }

    override func setUpViews() {
        super.setUpViews()
        self.setDateTime()
    }

    func setHeightTitle(value: CGFloat) {
        heightTitle.constant = value
    }

    func getText() -> String {
        return tfContent.text&
    }

    func setText(_ text: String) {
        tfContent.text = text
    }

    func setTitleAndLogo(_ image: UIImage,
                         title: String,
                         isSecurity: Bool = false) {
        vTitle.setTitleAndLogo(image, title: title)
        tfContent.isSecureTextEntry = isSecurity
    }

    func hideTitle(){
        vTitle.isHidden = true
    }

    func setPlaceHolder(title:String){
        tfContent.placeholder = title&
    }

    func setPlaceHolderColor(color:UIColor){
        tfContent.setPlaceHolderTextColor(color)
    }
    
    func setDateTime() {
        let dateFrom = DateHelper.getCurrentDateWithDayAndMonth()
        let dateTo = DateHelper.getNextDate()
        let timeFrom = DateHelper.getCurrentTime()
        let timeTo = DateHelper.getCurrentTime()

        tfContent.text = "\(dateFrom) \(timeFrom) - \(dateTo) \(timeTo)"
    }

    func setDateAndTime(fromTime: String, toTime: String) {
        self.fromTime = fromTime
        self.toTime = toTime

        let dateFrom = DateHelper.getSimpleDate(input: fromTime)
        let dateTo = DateHelper.getSimpleDate(input: toTime)
        let timeFrom = DateHelper.getTime(input: fromTime)
        let timeTo = DateHelper.getTime(input: toTime)

        tfContent.text = "\(dateFrom) \(timeFrom) - \(dateTo) \(timeTo)"
    }

    @IBAction func btnCalendarTapped() {

        let vc = DatePickerViewController.createModule(fromTime: self.fromTime, toTime: self.toTime, delegate: self)
        UIApplication.topViewController()?.present(controller: vc)
    }
}

extension AppDateTime : DatePickerViewControllerDelegate {
    
    func getDateTimeSelected(fromTime: String, toTime: String) {
        self.fromTime = fromTime
        self.toTime = toTime

        let dateFrom = DateHelper.getSimpleDate(input: fromTime)
        let dateTo = DateHelper.getSimpleDate(input: toTime)
        let timeFrom = DateHelper.getTime(input: fromTime)
        let timeTo = DateHelper.getTime(input: toTime)

        tfContent.text = "\(dateFrom) \(timeFrom) - \(dateTo) \(timeTo)"
        
        getDateTime?(fromTime , toTime)
    }
}
