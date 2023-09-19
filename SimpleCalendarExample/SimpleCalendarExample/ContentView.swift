//
//  ContentView.swift
//  SimpleCalendarExample
//
//  Created by Илья Аникин on 14.09.2023.
//

import SimpleCalendar
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            SimpleCalendarView(
                month: 1,
                year: 2023,
                calendar: .current,
                fontSize: 7,
                verticalCellPadding: 1,
                weekdayHeaderPadding: 5,
                weekdaySymbolFormat: .empty
            )
            .frame(width: 100)
            .padding(10)
            .border(.red, width: 0.5)

            SimpleCalendarView(
                month: 9,
                year: 2023,
                calendar: .init(identifier: .gregorian),
                fontSize: 12,
                verticalCellPadding: 5,
                weekdayHeaderPadding: 10,
                weekdaySymbolFormat: .veryShort
            )
            .frame(width: 150)
            .calendarTintColor(.blue)
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(white: 0.95))
            )

            SimpleCalendarView(
                month: 9,
                year: 2023,
                calendar: .localizedCurrent,
                fontSize: 18,
                verticalCellPadding: 10,
                weekdayHeaderPadding: 15,
                weekdaySymbolFormat: .short
            )
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(white: 0.95))
            )
            .calendarTintColor(.orange)
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
