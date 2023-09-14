//
//  DateInterval+Extensions.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

extension DateInterval {
    /// Returns an array of dates for given DateInterval, includes interval bounds
    func enumerated(_ calendar: Calendar = .current) -> [Date] {
        let dateFrom = calendar.startOfDay(for: self.start)
        let dateTo = calendar.startOfDay(for: self.end)
        guard dateFrom < dateTo else { return [] }

        var dates = [Date]()
        var date = dateFrom

        while date <= dateTo {
            dates.append(date)

            guard let nextDate = calendar.date(byAdding: .day, value: 1, to: date) else { break }
            date = nextDate
        }

        return dates
    }
}
