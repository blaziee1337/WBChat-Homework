//
//  TimelineProvider.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 21.06.2024.
//

import WidgetKit

class Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> ContactEntry {
        ContactEntry(date: Date(), configuration: ContactSelectionIntent(), contact: exampleContact)
    }
    
    func getSnapshot(for configuration: ContactSelectionIntent, in context: Context, completion: @escaping (ContactEntry) -> ()) {
        createTimelineEntry(date: Date(), configuration: configuration, completion: completion)
    }
    
    func getTimeline(for configuration: ContactSelectionIntent, in context: Context, completion: @escaping (Timeline<ContactEntry>) -> ()) {
        createTimeline(date: Date(), configuration: configuration, completion: completion)
    }
    
    func createTimelineEntry(date: Date, configuration: ContactSelectionIntent, completion: @escaping (ContactEntry) -> ()) {
        guard let contact = configuration.contact else {
            let entry = ContactEntry(date: date, configuration: configuration, contact: exampleContact)
            completion(entry)
            return
        }
        
        let contactEntry = Contact(
            name: contact.displayString,
            phoneNumber: contact.phoneNumber ?? "",
            avatar: contact.avatar ?? ""
        )
        let entry = ContactEntry(date: date, configuration: configuration, contact: contactEntry)
        completion(entry)
    }
    
    func createTimeline(date: Date, configuration: ContactSelectionIntent, completion: @escaping (Timeline<ContactEntry>) -> ()) {
        guard let contact = configuration.contact else {
            let entry = ContactEntry(date: date, configuration: configuration, contact: exampleContact)
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
            return
        }
        
        let contactEntry = Contact(
            name: contact.displayString,
            phoneNumber: contact.phoneNumber ?? "",
            avatar: contact.avatar ?? ""
        )
        let entry = ContactEntry(date: date, configuration: configuration, contact: contactEntry)
        
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
    
    var exampleContact: Contact {
        return Contact(name: "Маман", phoneNumber: "+7 999 333-33-33", avatar: "maman")
    }
}
