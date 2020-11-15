//
//  DatePickerViewController.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 12/19/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var vMain        : UIView!
    @IBOutlet weak var datePicker   : UIDatePicker!
    @IBOutlet weak var timePicker   : UIDatePicker!
    @IBOutlet weak var btFromTime   : UIButton!
    @IBOutlet weak var btToTime     : UIButton!
    @IBOutlet weak var vFromTime    : UIView!
    @IBOutlet weak var vToTime      : UIView!
    
//    @IBOutlet weak var lbFromTitle  : UILabel!
//    @IBOutlet weak var lbToTitle    : UILabel!
    
    let dateFormat = DateFormatter()
    var date = Date()
    var fromTime = "", toTime = ""
    var isToTime = false

    var fromDate: Date = Date()
    var toDate = Date()
    
    weak var delegate: DatePickerViewControllerDelegate?
    
    let calendar = Calendar.current
    
    var haveSetTime = false
    
    class open func createModule(fromTime:String, toTime:String, delegate:DatePickerViewControllerDelegate, isToTime:Bool = false, modalPresent:UIModalPresentationStyle = .overCurrentContext, modalTransition:UIModalTransitionStyle = .crossDissolve, haveSetTime: Bool = false) -> DatePickerViewController {
        let vc = DatePickerViewController.initFromNib()
        vc.fromTime = fromTime
        vc.toTime = toTime
        vc.delegate = delegate
        vc.isToTime = isToTime
        vc.haveSetTime = haveSetTime
        vc.modalPresentationStyle = modalPresent
        vc.modalTransitionStyle = modalTransition
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        vMain.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissAction)))
        
        setupDateFormat()
    }
    
    func setupDateFormat(){
        dateFormat.dateFormat = DateFormat.DEFAULT
        datePicker.datePickerMode = .date
        timePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "vi_VN")
        timePicker.locale = Locale(identifier: "en_GB")
        
        timePicker.isHidden = !haveSetTime
        
        if isToTime {
            vFromTime.backgroundColor = AppColor.whiteColor
            vToTime.backgroundColor = AppColor.secondMain
            
            datePicker.date = dateFormat.date(from: toTime)!
            timePicker.date = dateFormat.date(from: toTime)!
        }else{
            vFromTime.backgroundColor = AppColor.secondMain
            vToTime.backgroundColor = AppColor.whiteColor
            
            datePicker.date = dateFormat.date(from: fromTime)!
            timePicker.date = dateFormat.date(from: fromTime)!
        }
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
            timePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setTitle(from: String, to: String) {
        btFromTime.setTitle(text: from)
        btToTime.setTitle(text: to)
    }
    
    @IBAction func chooseFromTime(){
        isToTime = false
        vFromTime.backgroundColor = AppColor.secondMain
        vToTime.backgroundColor = AppColor.whiteColor
        
        toTime = getTime()
        
        datePicker.date = dateFormat.date(from: fromTime)!
        timePicker.date = dateFormat.date(from: fromTime)!
        fromDate = datePicker.date
        fromTime = getTime()
        print("FromTime: \(fromTime)")
    }
    
    @IBAction func chooseToTime() {
        isToTime = true
        vFromTime.backgroundColor = AppColor.whiteColor
        vToTime.backgroundColor = AppColor.secondMain
        
        fromTime = getTime()
     
        datePicker.date = dateFormat.date(from: toTime)!
        timePicker.date = dateFormat.date(from: toTime)!
        toDate = datePicker.date
        toTime = getTime()
        print("ToTime: \(toTime)")
    }
    
    func getTime() ->String {
        let dateComponent = calendar.dateComponents([.year, .month, .day], from: datePicker.date)
        let timeComponent = calendar.dateComponents([.hour, .minute, .second], from: timePicker.date)

        var compineComponent = DateComponents()
        compineComponent.year = dateComponent.year
        compineComponent.month = dateComponent.month
        compineComponent.day = dateComponent.day
        compineComponent.hour = timeComponent.hour
        compineComponent.minute = timeComponent.minute
        compineComponent.second = timeComponent.second
        return dateFormat.string(from: calendar.date(from: compineComponent)!)
    }
    
    @IBAction func confirmDone() {
        
        if isToTime {
            toTime = getTime()
        }else{
            fromTime = getTime()
        }
        
        print("FromTime: \(fromTime)  \n ToTime: \(toTime)")
        if DateHelper.isGoNext(fromTime: fromTime, toTime: toTime) {
            delegate?.getDateTimeSelected(fromTime: fromTime, toTime: toTime)
            dismiss()
        }else{
            self.makeToast(message: "Thời gian kết thúc phải lớn hơn thời gian bắt đầu !")
        }
    }
    
    @objc func dismissAction(){
        dismiss()
    }

}

protocol DatePickerViewControllerDelegate: class {
    func getDateTimeSelected(fromTime:String, toTime:String)
}
