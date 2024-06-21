//
//  ContactWidgetEntryView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 19.06.2024.
//

import SwiftUI
import WidgetKit

struct ContactWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidget(entry: entry)
        default:
            MediumWidget(entry: entry)
            
            
        }
    }
}

struct SmallWidget: View {
    @State var entry: Provider.Entry
    var body: some View {
        VStack {
            Text(entry.contact.name)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 15)
            Text(entry.contact.phoneNumber)
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
        }
    }
    
}


struct MediumWidget: View {
    var entry: Provider.Entry
    var body: some View {
        HStack(spacing: 15) {
            avatarView
            VStack(alignment: .leading) {
                Text(entry.contact.name)
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text(entry.contact.phoneNumber)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .center)
                sendMessageButton
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
        }
    }
    
    private var avatarView: some View {
        ZStack {
            if let avatar = entry.contact.avatar, !avatar.isEmpty {
                Image(avatar)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .frame(width: 80, height: 80)
                
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.purple)
                    .frame(width: 80, height: 80)
                    .overlay(
                        Text(initials(from: entry.contact.name))
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    )
                
            }
            
        }
    }
    
    private func initials(from name: String) -> String {
        let names = name.split(separator: " ")
        let initials = names.compactMap { $0.first }
        return initials.map(String.init).joined()
    }
    
    private var sendMessageButton: some View {
        Button {
            // TODO: Перейти в сообщение
        } label: {
            Text("Написать сообщение")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
        }
        .buttonStyle(PlainButtonStyle())
        
    }
}

#Preview(as: .systemSmall) {
    ContactWidget()
} timeline: {
    let contactSelectionIntent = ContactSelectionIntent()
    ContactEntry(date: .now, configuration: contactSelectionIntent, contact: Provider().exampleContact)
}
