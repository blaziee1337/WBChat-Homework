//
//  WeatherViewModel.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 08.08.2024.
//

import SwiftUI
import WeatherAPI


class WeatherInfoViewModel: ObservableObject {
    @Published var error: String?
    @Published var dailyForecasts: [ForecastItem] = []
    @Published var city: String = ""
    
    //MARK: - Вывод информации погоды на 2 дня
    func fetchTwoDayForecast(city: String) {
        self.city = city
        ForecastDataAPI.dailyForecast(q: city) { [weak self] data, error in
            if let error = error {
                print("Error fetching forecast: \(error)")
                return
            }
            
            if let data = data, let forecastItems = data.list {
                DispatchQueue.main.async {
                    self?.dailyForecasts = self?.filterForecasts(forecastItems) ?? []
                    print("Daily Forecasts: \(forecastItems)")
                }
            }
        }
    }
    
    private func filterForecasts(_ forecasts: [ForecastItem]) -> [ForecastItem] {
        let now = Date()
        let calendar = Calendar.current
        let todayStart = calendar.startOfDay(for: now)
        let tomorrowStart = calendar.date(byAdding: .day, value: 1, to: todayStart)!
        let dayAfterTomorrowStart = calendar.date(byAdding: .day, value: 2, to: todayStart)!
        
        return forecasts.filter { forecast in
            let forecastDate = Date(timeIntervalSince1970: TimeInterval(forecast.dt ?? 0))
            let forecastStartOfDay = calendar.startOfDay(for: forecastDate)
            return (forecastStartOfDay == todayStart) || (forecastStartOfDay == tomorrowStart) || (forecastStartOfDay == dayAfterTomorrowStart)
        }
    }
}
