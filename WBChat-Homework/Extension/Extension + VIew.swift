//
//  Extension + VIew.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 12.07.2024.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
