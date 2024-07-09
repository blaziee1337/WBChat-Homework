//
//  InfinityScrollView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 09.07.2024.
//

import SwiftUI

struct InfinityScrollView: View {
    @State private var iterationNumbers = Array(0...30)
    @State private var emojis: [String] = []
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(iterationNumbers, id: \.self) { index in
                    EmojiCell(emoji: randomEmoji())
                        .frame(height: 300)
                        .onAppear {
                            if index == iterationNumbers.last {
                                appendMoreItems()
                                
                            }
                        }
                }
            }
            
        }
        
    }
    
    private func randomEmoji() -> String {
        let unicodeRange = 0x1F300...0x1F3F0
        let randomScalar = UnicodeScalar(unicodeRange.randomElement()!)!
        return String(randomScalar)
    }
    
    private func appendMoreItems() {
        let newRange = iterationNumbers.count..<(iterationNumbers.count + 30)
        iterationNumbers.append(contentsOf: newRange)
        emojis.append(contentsOf: newRange.map { _ in randomEmoji() })
    }
}

struct EmojiCell: View {
    
    var emoji: String
    
    var body: some View {
        let layoutType = Int.random(in: 1...3)
        ZStack {
            generateRectangles(for: layoutType)
            Text(emoji)
                .font(.system(size: 200))
                .opacity(0.5)
            
        }
    }
    
    @ViewBuilder
    private func generateRectangles(for layoutType: Int) -> some View {
        switch layoutType {
        case 1: // 2 сверху, 1 снизу
            VStack(spacing: 30) {
                HStack(spacing: 30) {
                    makeRoundedRectangle(color: .gray)
                    makeRoundedRectangle(color: .orange)
                }
                makeRoundedRectangle(color: .green)
            }
            .padding(30)
            
        case 2: // 2 слева, 1 справа
            HStack(spacing: 30) {
                VStack(spacing: 30) {
                    makeRoundedRectangle(color: .red)
                    makeRoundedRectangle(color: .blue)
                }
                makeRoundedRectangle(color: .green)
            }
            .padding(30)
            
        case 3: // 1 сверху, 2 снизу
            VStack(spacing: 30) {
                makeRoundedRectangle(color: .mint)
                HStack(spacing: 30) {
                    makeRoundedRectangle(color: .brown)
                    makeRoundedRectangle(color: .black)
                }
            }
            .padding(30)
            
        default:
            EmptyView()
        }
    }
    
    private func makeRoundedRectangle(color: Color) -> some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
            .foregroundColor(color)
    }
}


#Preview {
    InfinityScrollView()
}
