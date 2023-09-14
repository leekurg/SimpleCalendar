//
//  Month.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

struct Month {
    let daysSequence: [DisplayableDay]
    let weekdaySequence: [Weekday]

    private let monthNumber: Int
    private let year: Int

    static private let calendar = Calendar.current

    init(month: Int, year: Int, weekdaySymbolFormat: WeekdaySymbolFormat) {
        self.monthNumber = month
        self.year = year

        self.daysSequence = Self.makeMonthDaysSequence(month: month, year: year)
        self.weekdaySequence = Self.makeWeekdaySymbolsSequence(weekdaySymbolFormat)
    }
}

extension Month {
    init(from date: Date, weekdaySymbolFormat: WeekdaySymbolFormat) {
        let month = date.get(.month)
        let year = date.get(.year)

        self.init(month: month, year: year, weekdaySymbolFormat: weekdaySymbolFormat)
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

                } else if calendar.isDateInToday(day) {
                    return .today(Day(dayInMonth: dayInMonth))

                } else if calendar.isDateInWeekend(day) {
                    return .weekend(Day(dayInMonth: dayInMonth))

                } else {
                    return .regular(Day(dayInMonth: dayInMonth))
                }
            }
    }

    static func makeWeekdaySymbolsSequence(_ format: WeekdaySymbolFormat) -> [Weekday] {
        let weekdaySymbols: [String]

        switch format {
        case .empty:
            weekdaySymbols = []
        case .veryShort:
            weekdaySymbols = calendar.veryShortStandaloneWeekdaySymbols
        case .short:
            weekdaySymbols = calendar.shortStandaloneWeekdaySymbols
        case .standart:
            weekdaySymbols = calendar.standaloneWeekdaySymbols
        }

        return weekdaySymbols.map { symbol in
            Weekday(title: symbol)
        }
    }
}
