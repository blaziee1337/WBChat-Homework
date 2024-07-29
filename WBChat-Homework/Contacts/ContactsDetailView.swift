//
//  ContactsDetailView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import SwiftUI

struct ContactDetailView: View {
    
    let name: String
    let phoneNumber: String
    let avatar: String?
        
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(spacing: 5) {
            avatarView
                .padding(.bottom, 20)
            
            Text(name)
                .font(.system(size: 24).weight(.semibold))
            
            Text(phoneNumber)
                .font(.system(size: 16))
                .foregroundStyle(Color(UIColor.systemGray2))
                .padding(.bottom, 40)
            
            HStack(spacing: 15) {
                socialIcons(iconName: "twitter")
                socialIcons(iconName: "instagram")
                socialIcons(iconName: "linkedin")
                socialIcons(iconName: "facebook")
            }
            
        }
        .padding(.top, -130)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("backButton")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    Text("Профиль")
                        .font(.system(size: 18, weight: .semibold))
                    
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                   
                }) {
                    Image("pencil")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
        
    }
    
    private var avatarView: some View {
        ZStack {
            if let avatar = avatar {
                Image(avatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
            } else {
                Circle()
                    .fill(Color(UIColor.systemGray6))
                    .frame(width: 200, height: 200)
                    .overlay(
                        Image("person")
                            .resizable()
                            .frame(width: 112, height: 112)
                    )
            }
        }
    }
    
    private func socialIcons(iconName: String) -> some View {
        RoundedRectangle(cornerRadius: 25)
            .stroke(Color.purple, lineWidth: 2)
            .frame(width: 70, height: 40)
            .foregroundStyle(.white)
            .overlay(
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
            )
    }
    
}


#Preview {
    ContactDetailView(name: "Ivan Ivanov", phoneNumber: "+7999 99-99-99", avatar: "person")
}
