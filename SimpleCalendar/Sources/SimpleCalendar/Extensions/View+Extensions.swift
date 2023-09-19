//
//  View+Extensions.swift
//  
//
//  Created by Илья Аникин on 18.09.2023.
//

import SwiftUI

public extension View {
    func calendarTintColor(_ color: Color) -> some View {
        environment(\.calendarTintColor, color)
    }
}

extension EnvironmentValues {
    var calendarTintColor: Color {
        get { self[CalendarTintColor.self] }
        set { self[CalendarTintColor.self] = newValue }
    }
}

fileprivate struct CalendarTintColor: EnvironmentKey {
    static let defaultValue: Color = .black
}
