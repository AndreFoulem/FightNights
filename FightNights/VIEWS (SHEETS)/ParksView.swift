//
//  ParksView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//

import SwiftUI

struct ParksView: View {
  //MARK: fetch request
  @Environment(\.managedObjectContext) var context
  @FetchRequest<ParkEntity>(
    sortDescriptors: []) private var parks
  
  //MARK: state (local)
  @State private var justCanada = false
  
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
              HStack {
                Text(park.viewName)
                Spacer()
                Image(systemName: park.viewRating)
              }.font(.title)
              Text(park.viewLocation).fontWeight(.light)
            }
            Spacer()
          }
          .padding(.vertical, 8)
        }//list
        .navigationTitle("Parks")
        .toolbar {
          ToolbarItem {
            Button {
              justCanada.toggle()
              //! using the parks FetchResults sortDescriptors
              parks.nsPredicate = justCanada ? NSPredicate(format: "country_ = %@", "Canada") : nil
            } label: {
              Image(systemName: justCanada ? "line.3.horizontal.decrease.circle" : "line.3.horizontal.decrease.circle.fill")
            }
          }
        }
      }//ns
      
    }//body
}

struct ParksView_Previews: PreviewProvider {
    static var previews: some View {
      ParksView()
        .environment(\.managedObjectContext, ParksContainer.preview)
    }
}
