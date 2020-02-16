//
//  UIDate+Extension.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 12/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

extension Date {
    func toFormatDate(format: String) -> String {
      let dateFormatter: DateFormatter = DateFormatter()
      dateFormatter.timeZone = TimeZone.current
      dateFormatter.dateFormat = format
      return dateFormatter.string(from: self)
    }

    func toDateFormatCurrentTime(_ format: String) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension Date {
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }

    var dayAfterThree: Date {
        return Calendar.current.date(byAdding: .day, value: 3, to: noon)!
    }

    var dayAfterWeek: Date {
        return Calendar.current.date(byAdding: .day, value: 7, to: noon)!
    }

    var dayTomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }

    var dayYesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }

    var dayBeforThree: Date {
        return Calendar.current.date(byAdding: .day, value: -3, to: noon)!
    }

    func isInSameWeek(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .weekOfYear)
    }
    func isInSameMonth(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
    }
    func isInSameYear(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
    }
    func isInSameDay(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .day)
    }
    var isInThisWeek: Bool {
        return isInSameWeek(date: Date())
    }

    var isInTheFuture: Bool {
        return Date() < self
    }
    var isInThePast: Bool {
        return self < Date()
    }

    func removeTimeStamp() -> Date {
         guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
             fatalError("Failed to strip time from Date object")
         }
         return date
     }

    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }

    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}
