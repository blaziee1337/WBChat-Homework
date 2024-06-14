//
//  ContactsModel.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 14.06.2024.
//

import Foundation

struct Contact: Hashable {
    var name: String
    var phoneNumber: String
    var avatar: String?
    var isOnline: Bool
    var stories: Bool
    var status: String
}
