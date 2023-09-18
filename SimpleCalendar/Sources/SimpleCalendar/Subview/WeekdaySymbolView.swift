//
//  WeekdaySymbolView.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import SwiftUI

struct WeekdaySymbolView: View {
    let title: String
    @Environment(\.calendarTintColor) var calendarTintColor

    var body: some View {
        Text(title)
            .lineLimit(1)
            .foregroundColor(calendarTintColor.opacity(0.5))
    }
}

struct WeekdaySymbolView_Previews: PreviewProvider {
    static var previews: some View {
        WeekdaySymbolView(title: "S")
            .foregroundColor(.red)
    }
}
