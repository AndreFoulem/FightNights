//
//  FetchedNoPredicate.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-23.
//

import SwiftUI

struct FetchedNoPredicate: View {
   @FetchRequest<ManufacturerEntity>(sortDescriptors: [])
                            private var manufacturers
  
    var body: some View {
      NavigationStack {
        List(manufacturers) { manufacturer in
          
          NavigationLink {
            VStack {
              List(manufacturer.viewAutoEntities) { auto in
                Text(auto.viewModel)
              }
              Text("All manufa in \(manufacturer.viewCountry)")
              List(manufacturer.viewManufacturersInSameCountry) { sameCountry in
                Text(sameCountry.viewName)
              }
            }
            .navigationTitle(manufacturer.viewName)
          } label: {
            Text(manufacturer.viewName)
          }
    
        }//list
          
      }//ns
        
      
    }
}

struct FetchedNoPredicate_Previews: PreviewProvider {
    static var previews: some View {
        FetchedNoPredicate()
        .environment(\.managedObjectContext, AutosContainer.preview)
    }
}
