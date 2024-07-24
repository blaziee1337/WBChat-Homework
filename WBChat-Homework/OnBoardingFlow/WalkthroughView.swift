//
//  WalkthroughView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import SwiftUI

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
            startChatButton
                .padding(.bottom, 20)
                .sheet(isPresented: $showVerification) {
                    VerificationView()
                }
        }
    }
    
    private var startChatButton: some View {
        Button { showVerification.toggle() }
    label: {
        HStack {
            Spacer()
            Text(LocalizedStrings.startChatting)
                .foregroundColor(Color(red: 247/255, green: 257/255, blue: 247/255))
                .font(.system(size: 16, weight: .semibold))
                .padding(EdgeInsets(top: 12, leading: 48, bottom: 12, trailing: 48))
            
            
            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color("backgroundPurple"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.trailing, 24)
        .padding(.leading, 24)
        
        
    }
    }
}

#Preview {
    WalkthroughView()
}

