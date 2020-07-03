//
//  DateHelper.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 12/12/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation

class DateHelper {
    static func getDateTime(input: String ) -> String {
        let formatDate = DateFormatter()
        formatDate.dateFormat = DateFormat.DEFAULT
        if input.isEmpty {
            return "#"
        }else{
            if let date:Date = formatDate.date(from: input) {
                formatDate.dateFormat = "dd/MM/yyyy"
                return formatDate.string(from: date)
            } else {
                return "#"
            }
        }
    }

    static func getDate(input: String, format: String = DateFormat.DEFAULT) -> String {
        let formatDate = DateFormatter()
        formatDate.dateFormat = format
        if !input.isEmpty, let date:Date = formatDate.date(from: input)  {
            formatDate.dateFormat = "dd/MM/yyyy"
            return formatDate.string(from: date)
        } else{
            return "#"
        }
    }

    
    static func getFullDateTime(input: String) ->String {
        var dateTime  = input
        let formatDate = DateFormatter()
        if input.contains(".") {
            dateTime = dateTime.replacingOccurrences(of: "\\.\\d+", with: "", options: .regularExpression)
        }
        
        formatDate.dateFormat = DateFormat.DEFAULT
        
        if input.isEmpty {
            return "#"
        }else{
            if let date:Date = formatDate.date(from: dateTime) {
                formatDate.dateFormat = "dd-MM-yyyy HH:mm"
                return formatDate.string(from: date)
            } else {
                return "#"
            }
        }
    }
    
    static func getSimpleDate(input:String) ->String {
        let formatDate = DateFormatter()
        formatDate.dateFormat = DateFormat.DEFAULT
        if input.isEmpty {
            return "#"
        }else{
            if let date:Date = formatDate.date(from: input) {
                formatDate.dateFormat = DateFormat.SIMPLE_DATE
                return formatDate.string(from: date)
            } else {
                return "#"
            }
        }
    }
    
    static func getLongDateTime(input:String) ->String {
        let formatDate = DateFormatter()
        formatDate.dateFormat = DateFormat.DEFAULTZ
        if input.isEmpty {
            return "#"
        }else{
            if let date:Date = formatDate.date(from: input) {
                formatDate.dateFormat = "dd' Th'MM"
                return formatDate.string(from: date)
            } else {
                return "#"
            }
        }
    }
    
    static func getCurrentDateWithDayAndMonth() ->String{
        let date = Date()
        let formatDate = DateFormatter()
        formatDate.dateFormat = DateFormat.SIMPLE_DATE
        
        return formatDate.string(from: date)
    }
    
    static func getCurrentTime() -> String {
        let date = Date()
        let formatDate = DateFormatter()
        formatDate.dateFormat = "HH':'mm"
        
        return formatDate.string(from: date)
    }
    
    static func getTime(input: String) ->String{
        let formatDate = DateFormatter()
        formatDate.dateFormat = DateFormat.DEFAULT
        if input.isEmpty {
            return "#"
        }else{
            if let date:Date = formatDate.date(from: input) {
                formatDate.dateFormat = "HH':'mm"
                return formatDate.string(from: date)
            } else {
                return "#"
            }
        }
    }
    
    static func getLongTime(input: String) ->String{
        let formatDate = DateFormatter()
        formatDate.dateFormat = DateFormat.DEFAULTZ
        if input.isEmpty {
            return "#"
        }else{
            if let date:Date = formatDate.date(from: input) {
                formatDate.dateFormat = "HH':'mm"
                return formatDate.string(from: date)
            } else {
                return "#"
            }
        }
    }
    
    static func getNextDate() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.SIMPLE_DATE
        guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date) else { return "" }
        return dateFormatter.string(from: tomorrow)
    }
    
    static func getDateTimeISO() -> String {
        let date = Date()
        let formatDate = DateFormatter()
        formatDate.dateFormat = DateFormat.DEFAULT
        
        return formatDate.string(from: date)
    }
    
    static func getNextDateTimeISO() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.DEFAULT
        guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date) else { return "" }
        return dateFormatter.string(from: tomorrow)
    }
    
    static func isGoNext(fromTime:String, toTime:String) ->Bool{
        var isGoNext = false
        
        
        let formatDate = DateFormatter()
        formatDate.dateFormat = DateFormat.DEFAULT
        let fromDate = formatDate.date(from: fromTime)!
        let toDate:Date = formatDate.date(from: toTime)!
        
        switch fromDate.compare(toDate) {
            
        case .orderedDescending: //Date A is later than date B
            isGoNext = false
            break
        case .orderedAscending: //Date A is earlier than date B
            isGoNext = true
            break
        case .orderedSame:
            isGoNext = false //The two dates are the same
            break
        }
        
        return isGoNext
    }
}
