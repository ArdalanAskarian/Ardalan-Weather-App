//
//  ContentView.swift
//  ArdalanWeatherApp
//
//  Created by Ardalan Askarian on 2024-01-01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
                    if let location = locationManager.location {
                        if let weather = weather {
                            WeatherView(weather: weather)
                        } else {
                            LoadingView()
                                .task {
                                    do {
                                        weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                    } catch {
                                        print("Error getting weather: \(error)")
                                    }
                                }
                        }
                    } else {
                        if locationManager.isLoading {
                            LoadingView()
                        } else {
                            WelcomeView()
                                .environmentObject(locationManager)
                        }
                    }
                }
        .background((/*@START_MENU_TOKEN@*/Color(hue: 0.543, saturation: 1.0, brightness: 1.0)/*@END_MENU_TOKEN@*/))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
