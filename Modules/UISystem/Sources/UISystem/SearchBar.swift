//
//  SwiftUIView.swift
//  
//
//  Created by Halil Yavuz on 23.07.2024.
//

import SwiftUI

public struct SearchBar: View {
    @Binding var text: String
    
    public init(text: Binding<String>) {
        self._text = text
    }
    
    public var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 6)
                TextField("Search", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(4)
        }
        .padding(.horizontal)
    }
}

