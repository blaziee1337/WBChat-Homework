//
//  WalkthroughView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import SwiftUI
import UISystem

struct WalkthroughView: View {
    
    @State var showVerification = false
    
    var body: some View {
        VStack {
            
            Image("illustration")
                .resizable()
                .frame(width: 262, height: 271)
                .padding(.top, 135)
                .padding(.bottom, 42)
            
            Text(LocalizedStrings.communicateWithFriends)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text(LocalizedStrings.pressingContinueButton)
                .font(.system(size: 10))
                .foregroundStyle(.gray)
                .padding(.bottom, 1)
            Text(LocalizedStrings.privacyPolicy)
                .font(.system(size: 10))
                .foregroundStyle(.purple)
                .padding(.bottom, 13)
            WBButton(text: LocalizedStrings.startChatting,action: {
                showVerification.toggle()
            })
            .padding(.bottom, 20)
            .sheet(isPresented: $showVerification) {
                
            }
        }
    }
    
}

#Preview {
    WalkthroughView()
}

