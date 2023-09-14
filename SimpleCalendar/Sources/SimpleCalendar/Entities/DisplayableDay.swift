//
//  DisplayableDay.swift
//  
//
//  Created by Илья Аникин on 14.09.2023.
//

import Foundation

enum DisplayableDay {
    case past(_ day: Day)
    case today(_ day: Day)
    case future(_ day: Day)
    case anotherMonth(_ dat: Day)

    var value: Day {
        switch self {
        case .past(let day):
            return day
        case .today(let day):
            return day
        case .future(let day):
            return day
        case .anotherMonth(let day):
            return day
        }
    }

    var isAnotherMonth: Bool {
        switch self {
        case .anotherMonth:
            return true
        default:
            return false
        }
    }
}
