//
//  MainTabView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ContactsView().tabItem {
                Image("persons")
                    .renderingMode(router.selectedTab == .contacts ? .template : .original)
                
            }.tag(Tabs.contacts)
            
            ChatsView().tabItem {
                Image("message")
                    .renderingMode(router.selectedTab == .chats ? .template : .original)
                
                
            }.tag(Tabs.chats)
            
            SettingsView().tabItem {
                Image("ellipsis")
                    .renderingMode(router.selectedTab == .settings ? .template : .original)
                
                
            }.tag(Tabs.settings)
            
        }
        .tint(.purple)
    }
    
}

#Preview {
    MainTabView()
}
