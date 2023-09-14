//
//  Date+Extensions.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

extension Date {
    /// Returns a today's date with erased time part
    static func todayNoon(_ calendar: Calendar = Calendar.current) -> Date {
        calendar.startOfDay(for: Date())
    }

    /// Returns a number of days passed since a specified `date`. A number can be negative
    func daysSince(_ date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date, to: self).day ?? 0
    }

    /// Returns specified component of date
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        calendar.component(component, from: self)
    }
}
