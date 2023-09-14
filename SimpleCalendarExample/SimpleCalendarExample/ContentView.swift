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
        SimpleCalendarView(month: 2, year: 2023)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
