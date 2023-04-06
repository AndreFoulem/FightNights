//
//  NewManufacturer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-05.
//

import SwiftUI

struct NewManufacturer: View {
  @Environment(\.managedObjectContext) private var moc
  @Environment(\.dismiss) private var dismiss
  @State private var manufacturerName = ""
  
    var body: some View {
      VStack(spacing: 16.0) {
        Text("New Manufacturer")
          .font(.largeTitle.weight(.bold))
        TextField("manufacturer name", text: $manufacturerName)
          .textFieldStyle(.roundedBorder)
          .padding()
        
        Button("Save") {
        // Create an entity
        let manufacturer = ManufacturerEntity(context: moc)
        // add property
        manufacturer.name = manufacturerName
          do {
            try moc.save()
            dismiss()
          } catch {
            print(error.localizedDescription)
          }
          
        }
        .buttonStyle(.borderedProminent)
        
      }//vs
      
      
    }//b
}

struct NewManufacturer_Previews: PreviewProvider {
    static var previews: some View {
        NewManufacturer()
    }
}
