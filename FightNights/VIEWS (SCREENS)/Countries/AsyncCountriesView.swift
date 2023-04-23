//
//  AsyncCountriesView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-20.
//

import SwiftUI
import CoreData

struct AsyncCountriesView: View {
     // MARK: CoreData
     @Environment(\.managedObjectContext) var context
     @FetchRequest<CountryEntity>(sortDescriptors: [])
     private var countries

    var body: some View {
    
      List {
        ForEach(countries) { country in
          Text(country.viewName)
            .foregroundColor(country.name == "Brazil" ? .green: .primary)
        }
      }
      .refreshable {
        
        let backgroundContext = CountriesContainer.shared.backgroundContext
  
        backgroundContext.perform {
          let country = CountryEntity(context: backgroundContext)
          country.name = "Brazil"
          
          try! backgroundContext.save()
        }
        
      }
  
    }//body
}

struct AsyncCountriesView_Previews: PreviewProvider {
    static var previews: some View {
      AsyncCountriesView()
        .environment(\.managedObjectContext, CountriesContainer.preview)
    }
}
