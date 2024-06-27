//
//  Extension + StringInterPolation.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 27.06.2024.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(spellOut date: Date, locale: Locale) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        
        let dayFormatter = NumberFormatter()
        dayFormatter.numberStyle = .spellOut
        dayFormatter.locale = locale
        let dayString = dayFormatter.string(from: NSNumber(value: components.day ?? 0)) ?? ""
        
        let monthFormatter = DateFormatter()
        monthFormatter.locale = locale
        monthFormatter.dateFormat = "MMMM"
        let monthString = monthFormatter.string(from: date)
        
        let yearFormatter = NumberFormatter()
        yearFormatter.numberStyle = .spellOut
        yearFormatter.locale = locale
        let yearString = yearFormatter.string(from: NSNumber(value: components.year ?? 0)) ?? ""
        
        appendLiteral("\(dayString) \(monthString) \(yearString)")
    }
}
