//
//  ParksView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//

import SwiftUI

struct ParksView: View {
   @Environment(\.managedObjectContext) var context
  
  @FetchRequest<ParkEntity>(sortDescriptors: [SortDescriptor(\ParkEntity.name_)])
    private var parks
  
    var body: some View {
      NavigationStack {
        List(parks) { park in
          HStack {
            Image(uiImage: park.viewImage)
              .resizable()
              .scaledToFit()
              .frame(height: 60)
              .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
              Text(park.viewName).font(.title)
              Text(park.viewLocation).fontWeight(.light)
            }
            Spacer()
          }
          .padding(.vertical, 8)
        }//list
        .navigationTitle("Parks")
      }//ns
      
    }//body
}

struct ParksView_Previews: PreviewProvider {
    static var previews: some View {
        ParksView()
        .environment(\.managedObjectContext, ParksContainer.preview)
    }
}
