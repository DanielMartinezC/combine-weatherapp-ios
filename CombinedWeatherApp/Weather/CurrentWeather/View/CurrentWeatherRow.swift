/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct CurrentWeatherRow: View {
  private let viewModel: CurrentWeatherRowViewModel
  
  init(viewModel: CurrentWeatherRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    
    ZStack {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(Color.white)
            .shadow(radius: 10)

        VStack {
            MapView(coordinate: viewModel.coordinate)
             .cornerRadius(25)
             .disabled(true)
             .padding(.bottom, 20)

            tempratureView
            
            maxTempratureView
            
            minTempratureView
            
            humidityView
        }
        .padding(20)
        .multilineTextAlignment(.center)
    }
    .padding(20) 
  }
}

extension CurrentWeatherRow {
  
  var tempratureView: some View {
    HStack {
      Text("☀️ Temperature")
      
      Spacer()
      
      Text("\(viewModel.temperature)°")
        .frame(alignment: .trailing)
        .foregroundColor(.gray)
    }
    .padding(.bottom, 20)
  }
  
  var minTempratureView: some View {
    HStack {
      Text("📉 Min temperature")
      
      Spacer()
      
      Text("\(viewModel.minTemperature)°")
        .frame(alignment: .trailing)
        .foregroundColor(.gray)
    }
    .padding(.bottom, 20)
  }
  
  var maxTempratureView: some View {
    HStack {
      Text("📈 Max temperature")
      
      Spacer()
      
      Text("\(viewModel.maxTemperature)°")
        .frame(alignment: .trailing)
        .foregroundColor(.gray)
    }
    .padding(.bottom, 20)
  }
  
  var humidityView: some View {
    HStack {
      Text("💧 Humidity")
            
      Spacer()
      
      Text("\(viewModel.humidity)°")
        .frame(alignment: .trailing)
        .foregroundColor(.gray)
    }
    .padding(.bottom, 20)
  }
}
