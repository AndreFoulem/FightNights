//
//  FetchedNoPredicate.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-23.
//

import SwiftUI

struct FetchedNoPredicate: View {
   @FetchRequest<ManufacturerEntity>(sortDescriptors: [],
                            predicate: NSPredicate(format: "name = 'Rivian'"))
                            private var rivians
  
    var body: some View {
      VStack {
        List(rivians) { rivian in
          VStack {
            Text(rivian.viewName)
            Text(rivian.viewCountry).font(.body)
          }
          
          Section("All manufacturers") {
            ForEach(rivian.viewManufacturers) { manufacturer in
              VStack(alignment: .leading) {
                Text(manufacturer.viewName)
                Text(manufacturer.viewCountry)
              }
            }
          }
        }
      }//vs
      
    }
}

struct FetchedNoPredicate_Previews: PreviewProvider {
    static var previews: some View {
        FetchedNoPredicate()
        .environment(\.managedObjectContext, AutosContainer.preview)
    }
}
