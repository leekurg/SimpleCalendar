//
//  Day.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

struct Day: Identifiable {
    let id: String
    let dayInMonth: Int

    init(dayInMonth: Int) {
        self.id = UUID().uuidString
        self.dayInMonth = dayInMonth
    }
}
