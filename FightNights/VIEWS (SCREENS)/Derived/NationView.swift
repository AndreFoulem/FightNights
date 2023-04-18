//
//  NationView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-18.
//

import SwiftUI

struct NationView: View {
    @FetchRequest<NationEntity>(sortDescriptors: []) private var nations
  
  
    var body: some View {
      NavigationStack {
        List(nations) { nation in
          NavigationLink {
            List(nation.viewBeachEntities) { beach in
              Text(beach.viewName)
            }
            .navigationTitle(nation.viewName)
          } label: {
            HStack {
              VStack {
                Text(nation.viewName)
                  .font(.title)
                Text(nation.viewAverageRating)
              }
            }
          }
          .badge(Int(nation.beachCount))

        }
      }
    }
}

struct NationView_Previews: PreviewProvider {
    static var previews: some View {
        NationView()
        .environment(\.managedObjectContext, BeachContainer.preview)
    }
}
