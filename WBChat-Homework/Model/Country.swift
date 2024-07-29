//
//  Country.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 12.07.2024.
//

import Foundation

struct Country: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let flag: String
    let code: String
    let digits: Int
    
    static let countries: [Country] = [
           Country(name: "Russia", flag: "🇷🇺", code: "+7", digits: 10),
           Country(name: "Turkey", flag: "🇹🇷", code: "+90", digits: 10),
           Country(name: "United States", flag: "🇺🇸", code: "+1", digits: 10),
       ]
}

   
