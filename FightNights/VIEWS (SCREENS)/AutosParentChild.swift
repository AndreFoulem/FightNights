//
//  AutosParentChild.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-04.
//

import SwiftUI
import CoreData

struct AutosParentChild: View {
  @FetchRequest<ManufacturerEntity>(sortDescriptors: [])
  private var manufacturers
  
    var body: some View {
      NavigationStack {
        List(manufacturers) { manufacturer in
          
          NavigationLink {
            
            List(manufacturer.viewAutoEntities) { auto in
              Text(auto.model ?? "")
            }
            
          } label: {
            Text(manufacturer.name ?? "")
          }//nl

        }//list
      }//ns
      
    }//body
}

struct AutosParentChild_Previews: PreviewProvider {
    static var previews: some View {
        AutosParentChild()
        .environment(\.managedObjectContext, AutosContainer.preview)
    }
}
