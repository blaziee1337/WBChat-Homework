//
//  SwiftUIView.swift
//  
//
//  Created by Halil Yavuz on 24.07.2024.
//

import SwiftUI

public struct WBButton: View {
    public var text: String
    public var action: () -> Void
    public var backgroundColor: Color
    public var textColor: Color
    public var fontSize: CGFloat
    public var fontWeight: Font.Weight
    public var padding: EdgeInsets
    public var cornerRadius: CGFloat
    public var isDisabled: Bool = false

    public init(
        text: String,
        action: @escaping () -> Void,
        backgroundColor: Color = Color("backgroundPurple"),
        textColor: Color = .white,
        fontSize: CGFloat = 16,
        fontWeight: Font.Weight = .regular,
        padding: EdgeInsets = EdgeInsets(top: 12, leading: 48, bottom: 12, trailing: 48),
        cornerRadius: CGFloat = 30,
        isDisabled: Bool = false
    ) {
        self.text = text
        self.action = action
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.isDisabled = isDisabled
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .font(.system(size: fontSize, weight: fontWeight))
                    .foregroundColor(textColor)
                    .padding(padding)
                Spacer()
            }
        }
        .padding(.vertical, 8)
        .background(isDisabled ? backgroundColor.opacity(0.5) : backgroundColor)
        .cornerRadius(cornerRadius)
        .disabled(isDisabled)
        .padding(.horizontal, 24)
    }
}

#Preview {
    WBButton(text: "Hello", action: {
        
    })
}


