//
//  ContactWidget.swift
//  ContactWidget
//
//  Created by Halil Yavuz on 19.06.2024.
//

import WidgetKit
import SwiftUI

struct ContactWidget: Widget {
    let kind: String = "ContactWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ContactSelectionIntent.self, provider: Provider()) { entry in
            ContactWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Contact Selection")
        .description("Contact information")
        .supportedFamilies([.systemMedium, .systemSmall])
    }
}



