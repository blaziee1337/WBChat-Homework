//
//  WeatherInfoScrollView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 08.08.2024.
//

import SwiftUI
import WeatherAPI

struct WeatherScrollView: View {
    let forecasts: [ForecastItem]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(forecasts, id: \.dt) { forecast in
                    VStack(spacing: 10) {
                        Text(dayOfWeek(from: forecast.dt))
                            .font(.headline)
                            .foregroundStyle(.white)
                          
                        Image(systemName: weatherIcon(from: forecast.weather?.first?.icon ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                        
                        Text("\(Int((forecast.main?.temp ?? 0) - 273.15))°C")
                            .font(.subheadline)
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .frame(width: 80, alignment: .center)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .frame(height: 120)
            
        }
        .scrollIndicators(.hidden)
        
    }
    
    private func dayOfWeek(from timestamp: Int?) -> String {
        guard let timestamp = timestamp else { return "" }
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: date)
    }
    
    private func weatherIcon(from iconCode: String) -> String {
        switch iconCode {
        case "01d": return "sun.max.fill" // Ясное дневное небо
        case "01n": return "moon.stars.fill" // Ясное ночное небо
        case "02d": return "cloud.sun.fill" // Переменная облачность днем
        case "02n": return "cloud.moon.fill" // Переменная облачность ночью
        case "03d", "03n": return "cloud.fill" // Облачно
        case "04d", "04n": return "icloud.fill" // Плотные облака
        case "09d", "09n": return "cloud.heavyrain.fill" // Ливень
        case "10d": return "cloud.sun.rain.fill" // Дождь днем
        case "10n": return "cloud.moon.rain.fill" // Дождь ночью
        case "11d", "11n": return "cloud.bolt.rain.fill" // Гроза
        case "13d", "13n": return "snow" // Снег
        case "50d", "50n": return "cloud.fog.fill" // Туман
        default: return "questionmark.circle.fill" // Неизвестное состояние
        }
    }
    
}

#Preview {
    WeatherView()
}
