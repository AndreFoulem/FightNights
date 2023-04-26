//
//  FetchingWithOOView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-25.
//

import SwiftUI

struct FetchingWithOOView: View {
    // inject the OO
    @StateObject var oo: PlanetsOO
    var body: some View {
      NavigationStack {
        List(oo.planets) { planet in
          HStack {
            Image(uiImage: planet.viewImage)
              .resizable()
              .scaledToFit()
              .frame(width: 60, height: 80)
              .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8.0) {
              Text(planet.viewName)
                .font(.title2.weight(.semibold))
              Text(planet.viewOrbitalPeriod)
                .font(.footnote)
                .foregroundColor(.red)
            }
          }//hs
          .padding(.vertical, 6)
        }//list
        .navigationTitle("Planets")
      }//ns
      .task {
        
      }
      
    }//body
}

struct FetchingWithOOView_Previews: PreviewProvider {
    static var previews: some View {
      FetchingWithOOView(oo: PlanetsOO(moc: PlanetsContainer.preview ))
//        .environment(\.managedObjectContext, PlanetsContainer.preview)
    }
}
