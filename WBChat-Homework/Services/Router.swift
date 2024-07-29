//
//  Router.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import Foundation

enum Tabs: Hashable {
    case contacts
    case chats
    case settings
}

final class Router: ObservableObject {
    @Published var selectedTab: Tabs = .contacts
}
