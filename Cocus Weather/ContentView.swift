//
//  ContentView.swift
//  Cocus Weather
//
//  Created by m1 on 27/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text(viewModel.timeZone)
                    .font(.system(size: 32))
                Text(viewModel.temperature)
                    .font(.system(size: 44))
                Text(viewModel.title)
                    .font(.system(size: 24))
                Text(viewModel.descriptionText)
                .font(.system(size: 24))
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
