//
//  ContentView.swift
//  Weather-App
//
//  Created by Chinaza Ugwuoke on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: isNight)
          
            VStack{
                CityNameView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                HStack(spacing: 20){
                    WeatherDayView(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", temp: 70)
                    WeatherDayView(dayOfTheWeek: "WED", imageName: "sun.max.fill", temp: 90)
                    WeatherDayView(dayOfTheWeek: "THUR", imageName: "wind.snow", temp: 36)
                    WeatherDayView(dayOfTheWeek: "FRI", imageName: "sunset.fill", temp: 40)
                    WeatherDayView(dayOfTheWeek: "SAT", imageName: "snow", temp: 12)
                }
                Spacer()
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WeatherButton(title: "Change Day Time", backColor: Color.white, textColor: Color.blue)
                })
                Spacer()
                Spacer()
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}



struct WeatherDayView: View {
    
    var dayOfTheWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(dayOfTheWeek)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium))
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
            Text("\(temp)")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing) .ignoresSafeArea(edges: .all)
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 180, height: 180)
                .aspectRatio(contentMode: .fit)
            Text("\(temp)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .medium))
        }.padding(.bottom, 40)
    }
}
