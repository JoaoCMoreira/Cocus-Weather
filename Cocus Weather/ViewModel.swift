//
//  ViewModel.swift
//  Cocus Weather
//
//  Created by m1 on 27/07/2022.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var descriptionText: String = ""
    @Published var temperature: String = ""
    @Published var timeZone: String = ""
    
    init() {
        fetchWeather()
            
    }
    
        func fetchWeather() {
            guard let url = URL(string: "") else {
                return
            }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    self.temperature = "\(model.current.temp)º"
                    self.timeZone = model.timezone
                }
            }
            catch {
                print("failed")
            }
        }
        task.resume()
    }
}


