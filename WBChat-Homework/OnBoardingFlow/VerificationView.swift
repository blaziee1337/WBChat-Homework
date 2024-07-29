//
//  VerificationView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import SwiftUI
import UISystem

struct VerificationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                BackButton()
                Spacer()
            }
            
            Spacer()
        }
    }
    
}


#Preview {
    VerificationView()
}

