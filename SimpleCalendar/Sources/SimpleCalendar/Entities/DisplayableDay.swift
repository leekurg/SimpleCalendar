//
//  DisplayableDay.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

enum DisplayableDay {
    case regular(_ day: Day)
    case today(_ day: Day)
    case weekend(_ day: Day)
    case anotherMonth(_ dat: Day)

    var value: Day {
        switch self {
        case .regular(let day):
            return day
        case .today(let day):
            return day
        case .weekend(let day):
            return day
        case .anotherMonth(let day):
            return day
        }
    }
}
