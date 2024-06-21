//
//  ContactWidgetBundle.swift
//  ContactWidget
//
//  Created by Halil Yavuz on 19.06.2024.
//

import WidgetKit
import SwiftUI

@main
struct ContactWidgetBundle: WidgetBundle {
    var body: some Widget {
        ContactWidget()
        ContactWidgetLiveActivity()
    }
}
