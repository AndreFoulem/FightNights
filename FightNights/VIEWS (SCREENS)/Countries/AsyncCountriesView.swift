//
//  AsyncCountriesView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-20.
//

import SwiftUI

struct AsyncCountriesView: View {
   @FetchRequest<CountryEntity>(sortDescriptors: []) private var countries
  
    var body: some View {
      List(countries) { country in
        Text(country.viewName)
      }
    }
}

struct AsyncCountriesView_Previews: PreviewProvider {
    static var previews: some View {
      AsyncCountriesView()
        .environment(\.managedObjectContext, CountriesContainer.preview)
    }
}
