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
    private let fontSize: CGFloat
    private let verticalCellPadding: CGFloat
    private let weekdayHeaderPadding: CGFloat

    public init(
        month: Int,
        year: Int,
        fontSize: CGFloat = 16,
        verticalCellPadding: CGFloat = 0,
        weekdayHeaderPadding: CGFloat = 15,
        weekdaySymbolFormat: WeekdaySymbolFormat = .veryShort
    ) {
        self.month = Month(
            month: month,
            year: year,
            weekdaySymbolFormat: weekdaySymbolFormat
        )

        self.fontSize = fontSize
        self.verticalCellPadding = verticalCellPadding
        self.weekdayHeaderPadding = weekdayHeaderPadding
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
                    .padding(.bottom, weekdayHeaderPadding)
            }

            ForEach(month.daysSequence, id: \.value.id) { day in
                DayView(dispayableDay: day, fontSize: fontSize)
                    .padding(.vertical, verticalCellPadding)
            }
        }
        .font(.system(size: fontSize, weight: .medium))
    }
}

public extension SimpleCalendarView {
    init(
        from date: Date,
        fontSize: CGFloat = 16,
        verticalCellPadding: CGFloat = 0,
        weekdayHeaderPadding: CGFloat = 15,
        weekdaySymbolFormat: WeekdaySymbolFormat = .veryShort
    ) {
        self.init(
            month: date.get(.month),
            year: date.get(.year),
            fontSize: fontSize,
            verticalCellPadding: verticalCellPadding,
            weekdayHeaderPadding: weekdayHeaderPadding,
            weekdaySymbolFormat: weekdaySymbolFormat
        )
    }
}

struct SimpleCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCalendarView(
            month: 9,
            year: 2023,
            fontSize: 12,
            verticalCellPadding: 5,
            weekdayHeaderPadding: 10,
            weekdaySymbolFormat: .veryShort
        )
        .frame(width: 150)
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(white: 0.95))
        )
        .calendarTintColor(.green)
    }
}
