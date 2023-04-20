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
          let country = countries[0]
          DispatchQueue.global(qos: .userInitiated).async {
            context.perform {
              country.name = "Brazil"
              try! context.save()
            }
          }
        }
      }
      
    }
}

struct AsyncCountriesView_Previews: PreviewProvider {
    static var previews: some View {
      AsyncCountriesView()
        .environment(\.managedObjectContext, CountriesContainer.preview)
    }
}
