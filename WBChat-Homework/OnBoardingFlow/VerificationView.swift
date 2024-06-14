//
//  VerificationView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import SwiftUI

struct VerificationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                backButton
                Spacer()
            }
            
            Spacer()
        }
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            
        }) {
            
            Image("backButton")
                .resizable()
                .frame(width: 24, height: 24)
                .padding()
        }
    }
}


#Preview {
    VerificationView()
}

