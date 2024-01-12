//
//  WeatherView.swift
//  ArdalanWeatherApp
//
//  Created by Ardalan Askarian on 2024-01-02.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack{
                        VStack(spacing: 20){
                            
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150,alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(width: 380, height: 90)
                    AsyncImage(url: URL(string: "https://www.mustdocanada.com/wp-content/uploads/2017/09/Saskatoon.jpg")){image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            //.frame(width: 350)
                            .cornerRadius(10, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 19){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble() + ("°")))
                            Spacer()
                            WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble() + "°"))
                        }
                    HStack {
                            WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor((/*@START_MENU_TOKEN@*/Color(hue: 0.543, saturation: 1.0, brightness: 1.0)/*@END_MENU_TOKEN@*/))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background((/*@START_MENU_TOKEN@*/Color(hue: 0.543, saturation: 1.0, brightness: 1.0)/*@END_MENU_TOKEN@*/))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
