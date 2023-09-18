//
//  DayView.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import SwiftUI

struct DayView: View {
    let dispayableDay: DisplayableDay
    let fontSize: CGFloat
    @Environment(\.calendarTintColor) var calendarTintColor
    
    var body: some View {
        Group {
            switch dispayableDay {
            case .regular(let day):
                Text("\(day.dayInMonth)")
                    .foregroundColor(calendarTintColor)

            case .today(let day):
                Text("\(day.dayInMonth)")
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .fill(calendarTintColor)
                            .padding(-fontSize / 3.0)
                    )

            case .weekend(let day):
                Text("\(day.dayInMonth)")
                    .foregroundColor(calendarTintColor.opacity(0.5))

            case .anotherMonth:
                Text("00").hidden()
            }
        }
        .lineLimit(1)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(dispayableDay: .anotherMonth(.init(dayInMonth: 3)), fontSize: 16)
            .border(.red)
    }
}
