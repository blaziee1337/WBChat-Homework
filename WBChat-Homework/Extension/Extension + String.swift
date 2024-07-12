//
//  Extension + String.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 12.07.2024.
//

import Foundation

extension String {
    func formatCustomNumber(mask: String) -> String {
        let cleanPhoneNumber = self.filter { $0.isNumber }
        var result = ""
        var index = cleanPhoneNumber.startIndex
        
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
   
}
