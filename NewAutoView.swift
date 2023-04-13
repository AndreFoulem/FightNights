//
//  NewAutoView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-13.
//

import SwiftUI

struct NewAutoView: View {
   var manufacturerEntity: ManufacturerEntity
  @Environment(\.managedObjectContext) private var context
  @Environment(\.dismiss) var dismiss
  @State private var modelYear = ""
  @State private var modelName = ""
  

    var body: some View {
      VStack(spacing: 15) {
        Text("New Automobile")
          .font(.largeTitle.weight(.bold))
        HStack {
          TextField("year", text: $modelYear).frame(width: 100)
          TextField("model", text: $modelName)
        }
        .textFieldStyle(.roundedBorder)
        
        
        Button("Save") {
          let auto = AutoEntity(context: context)
          auto.year = modelYear
          auto.model = modelName
          manufacturerEntity.addToAutoEntity(auto)
          do {
            try context.save()
            dismiss()
          } catch {
            print(error.localizedDescription)
          }
        }
        .buttonStyle(.borderedProminent)
        Spacer()
      }
      .padding()
    }
   
}


