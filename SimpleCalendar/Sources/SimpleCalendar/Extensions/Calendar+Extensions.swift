//
//  Calendar+Extensions.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

extension Calendar {
    /// Calendar with current app locale
    public static var localizedCurrent: Calendar {
        var calendar = Self.autoupdatingCurrent
        calendar.locale = Locale(identifier: Locale.preferredLanguages[0])

        return calendar
    }

    /// Index of last day oh the week, depends on calenadar's type (gregorian ot other)
    var lastWeekday: Int {
        self.firstWeekday == 1 ? daysInWeek : 1
    }

    /// Returns a DateInterval for given month
    func monthDateInterval(month: Int, year: Int) -> DateInterval? {
        guard let startDate = self.date(from: .init(year: year, month: month, day: 1)) else { return nil }
        guard let endDate = self.date(byAdding: .init(month: 1, day: -1), to: startDate) else { return nil }

        return DateInterval(start: startDate, end: endDate)
    }

    /// Returns a date of next day(including `from` date) with defined weekday in forward or backward search direction
    func findFirstWeekdayOccurance(from date: Date, weekday: Int, direction: SearchDirection = .forward) -> Date? {
        if date.get(.weekday) == weekday { return date }

        return nextDate(
            after: date,
            matching: .init(weekday: weekday),
            matchingPolicy: .nextTime,
            repeatedTimePolicy: .first,
            direction: direction
        )
    }
}
