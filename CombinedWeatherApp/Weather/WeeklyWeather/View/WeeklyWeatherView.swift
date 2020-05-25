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

struct WeeklyWeatherView: View {
  
  // The @ObservedObject property delegate establishes a connection between the WeeklyWeatherView and the WeeklyWeatherViewModel. This means that, when the WeeklyWeatherView‘s property objectWillChange sends a value, the view is notified that the data source is about to change and consequently the view is re-rendered.
  @ObservedObject var weeklyViewModel: WeeklyWeatherViewModel
  
  init(viewModel: WeeklyWeatherViewModel) {
    self.weeklyViewModel = viewModel
  }
  
  var body: some View {
     NavigationView {
       List {
         searchField

        if weeklyViewModel.isDataSourceEmpty {
           emptySection
         } else {
           cityHourlyWeatherSection
           forecastSection
         }
       }
       .listStyle(GroupedListStyle())
       .navigationBarTitle("Weather ⛅️")
     }
  }
}

private extension WeeklyWeatherView {
  var searchField: some View {
    HStack(alignment: .center) {
      
      // $viewModel.city establishes a connection between the values you’re typing in the TextField and the WeeklyWeatherViewModel‘s city property. Using $ allows you to turn the city property into a Binding<String>. This is only possible because WeeklyWeatherViewModel conforms to ObservableObject and is declared with the @ObservedObject property wrapper.
      TextField("e.g. Cupertino", text: $weeklyViewModel.city)
      //DaniNote: Remeber ($) its used a two way binding: If city is modified in View it will notifiy ViewModel and viceversa.
      
    }
  }
  
  var forecastSection: some View {
    Section {
      
      // Initialize the daily weather forecast rows with their own ViewModels.
      ForEach(weeklyViewModel.dataSource, content: DailyWeatherRow.init(viewModel:))
      
    }
  }
  
  var cityHourlyWeatherSection: some View {
    Section {
      NavigationLink(destination: weeklyViewModel.currentWeatherView) {
        VStack(alignment: .leading) {
          
          // You can still use and access the WeeklyWeatherViewModel properties without any fancy binds. This just displays the city name in a Text.
          Text(weeklyViewModel.city)
          
          Text("Weather today")
            .font(.caption)
            .foregroundColor(.gray)
        }
      }
    }
  }
  
  var emptySection: some View {
    Section {
      Text("No results :(")
        .foregroundColor(.gray)
    }
  }
}
