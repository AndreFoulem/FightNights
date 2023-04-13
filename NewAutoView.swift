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
  

    var body: some View {
      VStack(spacing: 15) {
        
      }
    }
}

struct NewAutoView_Previews: PreviewProvider {
    static var previews: some View {
        NewAutoView()
    }
}
