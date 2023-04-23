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
      Button("Refresh") {
        let container = CountriesContainer.shared.container
        
        container.performBackgroundTask { backgroundContext in
          backgroundContext.refreshAllObjects()
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
