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
//  @FetchRequest<ParkEntity>(sortDescriptors: [] ) private var parks

  //MARK: state (local)
  @State private var parksCount = 0
  @State private var parkArray: [String] = []
  
    var body: some View {
      NavigationStack {
        List {
          VStack {
            Text("Parks")
              .bold().badge(parksCount).font(.title2)
            Text(parkArray, format: .list(type: .and, width: .standard))
              .fixedSize(horizontal: false, vertical: true)
          }
        }//list
        .task {
          let request = ParkEntity.fetchRequest()
          request.predicate = NSPredicate(format: "country_ CONTAINS %@", "Canada")
          request.sortDescriptors = [NSSortDescriptor(key: "name_", ascending: true)]
          if let parks = try? context.fetch(request) {
            parksCount = parks.count
            
            for park in parks {
              parkArray.append(park.viewName)
            }
          }
          
        }//task
      }//ns
      
    }//body
}

struct ParksView_Previews: PreviewProvider {
    static var previews: some View {
      ParksView()
        .environment(\.managedObjectContext, ParksContainer.preview)
    }
}
