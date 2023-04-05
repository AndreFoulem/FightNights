//
//  AutosParentChild.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-04.
//

import SwiftUI
import CoreData

struct AutosParentChild: View {
  @SectionedFetchRequest<String?, AutoEntity>(
    sectionIdentifier: \.manufacturerEntity?.name,
    sortDescriptors: [SortDescriptor(\.manufacturerEntity?.name)] )
  private var autos
  
    var body: some View {
      NavigationStack {
        List(autos) { section in
          Section {
            ForEach(section){ auto in
              Text(auto.viewModel)
            }
          } header: {
            Text(section.id!)
            // Section id represent the section Identifier you set in the fetch
          }
            
        }//list
        .navigationTitle("Nested")
        .headerProminence(.increased)
      }//ns
      
    }//body
}

struct AutosParentChild_Previews: PreviewProvider {
    static var previews: some View {
        AutosParentChild()
        .environment(\.managedObjectContext, AutosContainer.preview)
    }
}
