//
//  StringInterPolationView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 27.06.2024.
//

import SwiftUI

struct StringInterPolationView: View {
    
    @State private var selectedDate: Date = .now
    @State private var selectedLanguage = Locale.current
    
    private let languages = [
        (flag: "🇷🇺", locale: Locale(identifier: "ru")),
        (flag: "🇺🇸", locale: Locale(identifier: "en")),
        (flag: "🇹🇷", locale: Locale(identifier: "tr")),
        (flag: "🇩🇪", locale: Locale(identifier: "de")),
        (flag: "🇪🇸", locale: Locale(identifier: "es"))
    ]
    
    var body: some View {
        VStack {
            DatePicker("Выберите Дату", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .padding()
            
            
            Picker("Language", selection: $selectedLanguage) {
                ForEach(languages, id: \.locale) { language in
                    Text(language.flag).tag(language.locale)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            
            dateText(for: selectedDate.addingTimeInterval(-2 * 24 * 60 * 60), description: "Позавчера")
            dateText(for: selectedDate.addingTimeInterval(-24 * 60 * 60), description: "Вчера")
            dateText(for: selectedDate, description: "Сегодня")
                .fontWeight(.bold)
            dateText(for: selectedDate.addingTimeInterval(24 * 60 * 60), description: "Завтра")
            dateText(for: selectedDate.addingTimeInterval(2 * 24 * 60 * 60), description: "Послезавтра")
        }
        
    }
    
    func dateText(for date: Date, description: String) -> some View {
        VStack {
            HStack {
                Text("\(localizedDescription(description)): \(formattedDate(date))")
                    .padding(.vertical, 3)
            }
            Text("\(spellOut: date, locale: selectedLanguage)")
                .foregroundStyle(.gray)
                .font(.system(size: 13))
        }
        .padding(.vertical, 10)
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = selectedLanguage
        formatter.dateFormat = "dd MMMM, yyyy"
        return formatter.string(from: date)
    }
    
    func localizedDescription(_ description: String) -> String {
        print("Current locale identifier: \(selectedLanguage.identifier)")
        switch selectedLanguage.identifier {
            
        case "ru":
            switch description {
            case "Позавчера": return "Позавчера"
            case "Вчера": return "Вчера"
            case "Сегодня": return "Сегодня"
            case "Завтра": return "Завтра"
            case "Послезавтра": return "Послезавтра"
            default: return description
                
            }
        case "en":
            switch description {
            case "Позавчера": return "Day before yesterday"
            case "Вчера": return "Yesterday"
            case "Сегодня": return "Today"
            case "Завтра": return "Tomorrow"
            case "Послезавтра": return "Day after tomorrow"
            default: return description
            }
        case "tr":
            switch description {
            case "Позавчера": return "Önceki gün"
            case "Вчера": return "Dün"
            case "Сегодня": return "Bugün"
            case "Завтра": return "Yarın"
            case "Послезавтра": return "Öbür gün"
            default: return description
            }
        case "de":
            switch description {
            case "Позавчера": return "Vorgestern"
            case "Вчера": return "Gestern"
            case "Сегодня": return "Heute"
            case "Завтра": return "Morgen"
            case "Послезавтра": return "Übermorgen"
            default: return description
            }
        case "es":
            switch description {
            case "Позавчера": return "Anteayer"
            case "Вчера": return "Ayer"
            case "Сегодня": return "Hoy"
            case "Завтра": return "Mañana"
            case "Послезавтра": return "Pasado mañana"
            default: return description
            }
        default:
            return description
        }
        
    }
    
}



#Preview {
    StringInterPolationView()
}
