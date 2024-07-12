//
//  BackButton.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 12.07.2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button{
            dismiss()
            
        } label: {
            Image("backButton")
                .resizable()
                .frame(width: 24, height: 24)
               
        }
    }
}

#Preview {
    BackButton()
}
