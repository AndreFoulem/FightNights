//
//  AsyncCountriesView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-20.
//

import SwiftUI

struct AsyncCountriesView: View {
  @Environment(\.managedObjectContext) var context
   @FetchRequest<CountryEntity>(sortDescriptors: []) private var countries
  
    var body: some View {
      VStack {
        List {
          ForEach(countries) { country in
            Text(country.viewName)
          }
        }
        Button("Change first country to Brazil") {
          Task {
            let country = countries[0]
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            country.name = "Brazil"
            try! context.save()
            
          }
        }
      }
      
    }//body
    
  func AddNewCountry() async throws {
    
  }
  
}

struct AsyncCountriesView_Previews: PreviewProvider {
    static var previews: some View {
      AsyncCountriesView()
        .environment(\.managedObjectContext, CountriesContainer.preview)
    }
}
