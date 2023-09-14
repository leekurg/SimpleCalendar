//
//  Month.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

public struct Month {
    let daysSequence: [DisplayableDay]
    let weekdaySequence: [Weekday]

    private let monthNumber: Int
    private let year: Int

    static private let calendar = Calendar.current

    public init(month: Int, year: Int, weekdaySymbolFormat: WeekdaySymbolFormat) {
        self.monthNumber = month
        self.year = year

        self.daysSequence = Self.makeMonthDaysSequence(month: month, year: year)
        self.weekdaySequence = Self.makeWeekdaySymbolsSequence(weekdaySymbolFormat)
    }
}

private extension Month {
    static func makeMonthDaysSequence(month: Int, year: Int) -> [DisplayableDay] {
        guard let monthDateInterval = calendar.monthDateInterval(month: month, year: year) else { return [] }

        let gridDateInterval: DateInterval
        if let firstGridDay = calendar.findFirstWeekdayOccurance(
                from: monthDateInterval.start,
                weekday: calendar.firstWeekday,
                direction: .backward
            ),
            let lastGridDay = calendar.findFirstWeekdayOccurance(
                from: monthDateInterval.end,
                weekday: calendar.lastWeekday,
                direction: .forward
            ) {
            gridDateInterval = .init(start: firstGridDay, end: lastGridDay)
        } else {
            return []
        }


        return gridDateInterval
            .enumerated()
            .map { day in
                let dayInMonth = day.get(.day)

                if !monthDateInterval.contains(day) {
                    return .anotherMonth(Day(dayInMonth: dayInMonth))

                } else if day < .todayNoon() {
                    return .past(Day(dayInMonth: dayInMonth))

                } else if day == .todayNoon() {
                    return .today(Day(dayInMonth: dayInMonth))

                } else if day > .todayNoon() {
                    return .future(Day(dayInMonth: dayInMonth))
                } else {
                    return .anotherMonth(Day(dayInMonth: dayInMonth))
                }
            }
    }

    static func makeWeekdaySymbolsSequence(_ format: WeekdaySymbolFormat) -> [Weekday] {
        let weekdaySymbols: [String]

        switch format {
        case .veryShort:
            weekdaySymbols = calendar.veryShortWeekdaySymbols
        case .short:
            weekdaySymbols = calendar.shortWeekdaySymbols
        }

        return weekdaySymbols.map { symbol in
            Weekday(title: symbol)
        }
    }
}
