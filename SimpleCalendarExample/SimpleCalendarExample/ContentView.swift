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
        VStack {
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

            SimpleCalendarView(
                month: 9,
                year: 2023,
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

            SimpleCalendarView(
                month: 1,
                year: 2023,
                fontSize: 7,
                verticalCellPadding: 1,
                weekdayHeaderPadding: 5,
                weekdaySymbolFormat: .empty
            )
            .frame(width: 100)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(white: 0.95))
            )
            .calendarTintColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
