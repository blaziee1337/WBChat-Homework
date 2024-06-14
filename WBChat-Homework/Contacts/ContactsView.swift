//
//  ContactsView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var text = ""
    @State var path = [Contact]()
    private let contacts: [Contact] = [
        .init(name: "Анастасия Иванова", phoneNumber: "+7 999 111-11-11", avatar: "nastya", isOnline: false, stories: false, status: "Last seen yesterday"),
        .init(name: "Петя", phoneNumber: "+7 999 222-22-22", avatar: "petya", isOnline: true, stories: false, status: "Online"),
        .init(name: "Маман", phoneNumber: "+7 999 333-33-33", avatar: "maman", isOnline: false, stories: true, status: "Last seen 3 hours ago"),
        .init(name: "Арбуз Дыня", phoneNumber: "+7 999 444-44-44", avatar: "arbuz", isOnline: true, stories: false, status: "Online"),
        .init(name: "Иван Иванов", phoneNumber: "+7 999 555-55-55", avatar: nil, isOnline: true, stories: false, status: "Online"),
        .init(name: "Лиса Алиса", phoneNumber: "+7 999 666-66-66", avatar: nil, isOnline: false, stories: true, status: "Last seen 30 minutes ago")
        
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 0) {
                searchBar
                    .padding(.top, 15)
                List(contacts, id: \.self) { contact in
                    ContactRow(contact: contact)
                        .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                        .background(
                            NavigationLink(destination: ContactDetailView(name: contact.name, phoneNumber: contact.phoneNumber, avatar: contact.avatar)) {
                                
                            }
                                .opacity(0)
                        )
                }
                .listStyle(.plain)
                .environment(\.defaultMinListRowHeight, 85)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Контакты")
                            .font(.headline)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.trailing, 30)
            }
            
        }
        
    }
    
    private var searchBar: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 6)
                TextField("Search", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(4)
        }
        .padding(.horizontal)
    }
    
    
}

struct ContactRow: View {
    let contact: Contact
    
    private let gradientStories = LinearGradient(colors: [Color(red: 210/255, green: 213/255, blue: 249/255), Color(red: 44/255, green: 55/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        HStack(spacing: 15) {
            avatarView
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.system(size: 14, weight: .bold))
                    .padding(.bottom, 5)
                
                Text(contact.status)
                    .font(.system(size: 12))
                    .foregroundStyle(Color(UIColor.systemGray2))
            }
        }
    }
    
    private var avatarView: some View {
        ZStack(alignment: .topTrailing) {
            if let avatar = contact.avatar {
                Image(avatar)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .frame(width: 48, height: 48)
                    .overlay(storiesBorder)
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.purple)
                    .frame(width: 48, height: 48)
                    .overlay(
                        Text(initials(from: contact.name))
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    )
                    .overlay(storiesBorder)
            }
            
            if contact.isOnline {
                onlineIndicator
            }
        }
    }
    
    private var storiesBorder: some View {
        RoundedRectangle(cornerRadius: 18)
            .strokeBorder(
                gradientStories,
                lineWidth: contact.stories ? 2 : 0
            )
            .frame(width: 58, height: 58)
        
    }
    
    private var onlineIndicator: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white)
                .frame(width: 20, height: 20)
                .offset(x: 6, y: -6)
            Circle()
                .fill(Color.green)
                .frame(width: 12, height: 12)
                .offset(x: 5, y: -5)
        }
    }
    
    private func initials(from name: String) -> String {
        let names = name.split(separator: " ")
        let initials = names.compactMap { $0.first }
        return initials.map(String.init).joined()
    }
}


#Preview {
    ContactsView()
}
