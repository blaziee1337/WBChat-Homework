//
//  WBChat_HomeworkApp.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import SwiftUI

@main
struct WBChat_HomeworkApp: App {
    @StateObject private var router: Router = .init()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(router)
        }
    }
}
