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
  @State private var newAuto = false
  @State private var selectedManufacturer: ManufacturerEntity?
  
    var body: some View {
      NavigationStack {
        List(manufacturers) { manufacturer in
          Section {
              ForEach(manufacturer.viewAutoEntities) { auto in
                Text("\(auto.viewYear) \(auto.viewModel)")
              }
          } header: {
            HStack {
              Text(manufacturer.viewName)
              Spacer()
              Button {
                selectedManufacturer = manufacturer
                newAuto.toggle()
              } label: {
                Image(systemName: "plus.circle")
              }
            }
          }
        }//list
        .navigationTitle("Inserting a Parent")
        .sheet(item: $selectedManufacturer) { manufacturer in
          NewAutoView(manufacturerEntity: manufacturer)
            .presentationDetents([.medium])
        }
        
      }//ns
      
    }//body
}

struct AutosParentChild_Previews: PreviewProvider {
    static var previews: some View {
        AutosParentChild()
        .environment(\.managedObjectContext, AutosContainer.preview)
    }
}
