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

  
    var body: some View {
      NavigationStack {
        VStack(spacing: 0) {
          List(manufacturers) { manufacturer in
            Section {
              ForEach(manufacturer.viewAutoEntities) { auto in
                Text(auto.viewModel)
              }
              .onDelete { indexSet in
                for index in indexSet {
                  manufacturer.removeFromAutoEntity(at: index)
                }
              }
            } header: {
              Text(manufacturer.viewName)
            }
            
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
    do {
      try context.save()
    } catch {
      print(error.localizedDescription)
      context.undo()
    }
  }
}

struct AutosParentChild_Previews: PreviewProvider {
    static var previews: some View {
        AutosParentChild()
        .environment(\.managedObjectContext, AutosContainer.preview)
    }
}
