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
  
   @State private var error: Error?
   @State private var showError = false
  
    var body: some View {
      VStack {
        List {
          ForEach(countries) { country in
            Text(country.viewName)
          }
        }
        Button("Change first country to Brazil") {
          Task {
            do {
              try await AddNewCountry()
            } catch {
              context.rollback() // undo
              self.error = error
              showError = true
            }
          }//task
        }//button
        .alert("Error", isPresented: $showError, presenting: error) { _ in
            //default button
        } message: { _ in
          Text("missing text")
        }
      }//vs
    
      
    }//body
    
  func AddNewCountry() async throws {
    try await context.perform {
      let country = CountryEntity(context: context)
//      country.name = "New Country"
      try context.save() // throws an error
    }
   }
  
}

struct AsyncCountriesView_Previews: PreviewProvider {
    static var previews: some View {
      AsyncCountriesView()
        .environment(\.managedObjectContext, CountriesContainer.preview)
    }
}
