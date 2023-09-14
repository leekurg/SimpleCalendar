//
//  Weekday.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

struct Weekday: Identifiable {
    let id: String
    let title: String

    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
