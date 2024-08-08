//
//  WeatherInfoView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 08.08.2024.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherInfoViewModel()
    
    var body: some View {
        ZStack {
            Image("backgroundWeather")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                weaterInfoHeader()
                WeatherScrollView(forecasts: viewModel.dailyForecasts)
                 .padding(.top, 20)
                Spacer()
                
            }
            .padding(.top, 30)
            .onAppear {
                viewModel.fetchTwoDayForecast(city: "Анталья")
            }
            
        }
        
    }
    
    private func weaterInfoHeader() -> some View {
        VStack {
            Text(viewModel.city)
                .frame(alignment: .center)
                .foregroundStyle(.white)
                .font(.title)
                .padding(.top, 20)
                .padding(.bottom, 5)
                
            
            if let temp = viewModel.dailyForecasts.first?.main?.temp {
                Text("\(Int(temp - 273.15))°")
                    .frame(alignment: .center)
                    .foregroundStyle(.white)
                    .font(.system(size: 50, weight: .bold))
                    .padding(.bottom, 5)
            } else {
                Text("N/A")
                    .font(.subheadline)
            }
            
            
            Text(viewModel.dailyForecasts.first?.weather?.first?.description ?? "")
                .frame(alignment: .center)
                .font(.system(size: 30))
                .foregroundStyle(.white)
                .padding(.bottom, 5)
            
            Text("\(LocalizedStrings.maxTemp): \(Int((viewModel.dailyForecasts.first?.main?.tempMax ?? 0) - 273.15))°,  \(LocalizedStrings.minTemp): \(Int((viewModel.dailyForecasts.first?.main?.tempMin ?? 0) - 273.15))°")
                .frame(alignment: .center)
                .font(.system(size: 25))
                .foregroundStyle(.white)
                .padding(.bottom, 30)
            
            Text(LocalizedStrings.weatherForTwoDays)
                .frame(alignment: .center)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
        }
    }
}


#Preview {
    WeatherView()
}
