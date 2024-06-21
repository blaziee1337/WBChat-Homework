//
//  ContactEntry.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 21.06.2024.
//

import WidgetKit

struct ContactEntry: TimelineEntry {
    let date: Date
    let configuration: ContactSelectionIntent
    let contact: Contact
}
