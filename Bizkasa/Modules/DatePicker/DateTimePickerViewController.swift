//
//  DateTimePickerViewController.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 12/30/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol DateTimePickerViewControllerDelegate: class {
    func getDateTimeSelected(dateTime:String)
}

class DateTimePickerViewController: UIViewController {
    
    @IBOutlet weak var vMain:UIView!
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var timePicker:UIDatePicker!
    
    let dateFormat = DateFormatter()
    
    var dateTime = ""
//    var format = DateFormat.DEFAULT
    
    weak var delegate: DateTimePickerViewControllerDelegate?
    
    let calendar = Calendar.current
    
    class open func createModule(dateTime: String, format: String, delegate: DateTimePickerViewControllerDelegate, isToTime: Bool = false, modalPresent: UIModalPresentationStyle = .overCurrentContext, modalTransition: UIModalTransitionStyle = .crossDissolve) -> DateTimePickerViewController {
        let vc = DateTimePickerViewController.initFromNib()
        vc.dateTime = dateTime
        vc.dateFormat.dateFormat = format
        vc.delegate = delegate
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
    
    func setupDateFormat() {
        datePicker.datePickerMode = .date
        timePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "vi_VN")
        timePicker.locale = Locale(identifier: "en_GB")
        
        datePicker.date = dateFormat.date(from: dateTime)!
        timePicker.date = dateFormat.date(from: dateTime)!
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
            timePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
    }
    
    func getTime() -> String {
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
        
        dateTime = getTime()
        
        print("dateTime: \(dateTime)")
        
        delegate?.getDateTimeSelected(dateTime: dateTime)
        dismiss()
    }
    
    @objc func dismissAction(){
        dismiss()
    }

}
