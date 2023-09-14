//
//  DayView.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import SwiftUI

struct DayView: View {
    let dispayableDay: DisplayableDay

    var body: some View {
        Group {
            if !dispayableDay.isAnotherMonth {
                Text("\(dispayableDay.value.dayInMonth)")
            } else {
                Text("00")
                    .hidden()
            }
        }
        .font(.system(size: 10, weight: .regular))
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(dispayableDay: .anotherMonth(.init(dayInMonth: 3)))
            .border(.red)
    }
}
