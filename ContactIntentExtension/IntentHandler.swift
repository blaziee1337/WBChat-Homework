//
//  IntentHandler.swift
//  ContactIntentExtension
//
//  Created by Halil Yavuz on 21.06.2024.
//

import Intents

class IntentHandler: INExtension, ContactSelectionIntentHandling {
    
    func provideContactOptionsCollection(for intent: ContactSelectionIntent, with completion: @escaping (INObjectCollection<Contacts>?, Error?) -> Void) {
        
        let contacts = [
            createContact(identifier: "Маман", display: "Маман", phoneNumber: "+7 999 333-33-33", avatar: "maman"),
            createContact(identifier: "Петя", display: "Петя", phoneNumber: "+7 999 222-22-22", avatar: "petya"),
            createContact(identifier: "Анастасия Иванова", display: "Анастасия Иванова", phoneNumber: "+7 999 111-11-11", avatar: "nastya"),
            createContact(identifier: "Арбуз Дыня", display: "Арбуз Дыня", phoneNumber: "+7 999 444-44-44", avatar: "arbuz"),
            createContact(identifier: "Иван Иванов", display: "Иван Иванов", phoneNumber: "+7 999 555-55-55", avatar: nil)
            
               
        ]
        
        let collection = INObjectCollection(items: contacts)
        completion(collection, nil)
    
    }
    func createContact(identifier: String, display: String, phoneNumber: String, avatar: String?) -> Contacts {
          let contact = Contacts(identifier: identifier, display: display)
          contact.phoneNumber = phoneNumber
          contact.avatar = avatar
          return contact
      }
  
}
