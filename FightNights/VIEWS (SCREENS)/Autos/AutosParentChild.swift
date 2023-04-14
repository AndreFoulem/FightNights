//
//  AutosParentChild.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-04.
//

import SwiftUI
import CoreData

struct AutosParentChild: View {
   @Environment(\.managedObjectContext) private var context
    @FetchRequest<ManufacturerEntity>(sortDescriptors: [])
    private var manufacturers
    @FetchRequest<AutoEntity>(sortDescriptors: [])
    private var autos
  
    var body: some View {
      NavigationStack {
        VStack(spacing: 0) {
          List {
            ForEach(manufacturers) { manufacturer in
              Text(manufacturer.viewName)
            }
            .onDelete(perform: deleteTask)
          }
          
          List(autos) { auto in
            Text("\(auto.viewModel)")
          }
        }
        
      }//ns
      
    }//body
}

extension AutosParentChild {
  private func deleteTask(offsets: IndexSet) {
    for offset in offsets {
      context.delete(manufacturers[offset])
    }
    try! context.save()
  }
}

struct AutosParentChild_Previews: PreviewProvider {
    static var previews: some View {
        AutosParentChild()
        .environment(\.managedObjectContext, AutosContainer.preview)
    }
}
