//
//  SimpleCalendarView.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import SwiftUI

let daysInWeek = 7

public struct SimpleCalendarView: View {
    private let month: Month

    public init(
        month: Int,
        year: Int,
        weekdaySymbolFormat: WeekdaySymbolFormat = .veryShort
    ) {
        self.month = Month(
            month: month,
            year: year,
            weekdaySymbolFormat: weekdaySymbolFormat
        )
    }

    private let columns: [GridItem] = .init(
        repeating: GridItem(
            .flexible(),
            spacing: 0
        ),
        count: daysInWeek
    )

    public var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(month.weekdaySequence) { weekday in
                WeekdaySymbolView(title: weekday.title)
                    .padding(.bottom)
            }

            ForEach(month.daysSequence, id: \.value.id) { day in
                DayView(dispayableDay: day)
            }
        }
    }
}

struct SimpleCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCalendarView(month: 5, year: 2023, weekdaySymbolFormat: .short)
    }
}
