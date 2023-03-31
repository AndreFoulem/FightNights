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
  @SectionedFetchRequest<String, ParkEntity>(sectionIdentifier: \.viewSuperCountry, sortDescriptors: [SortDescriptor(\.country_)] ) private var parks

  //MARK: state (local)
    var body: some View {
      NavigationStack {
        List(parks) { section in
          Section {
            ForEach(section) { park in
              HStack {
                VStack(alignment: .leading) {
                  Text(park.viewName).bold()
                  Text(park.viewLocation)
                }
                .font(.title2)
              }//hs
              
            }//for
          } header: {
            Text(section.id)
          }
          
          
        }//list
        .headerProminence(.increased)
        .navigationTitle("Parks")
        .listStyle(.automatic)
      }//ns
      
    }//body
}

struct ParksView_Previews: PreviewProvider {
    static var previews: some View {
      ParksView()
        .environment(\.managedObjectContext, ParksContainer.preview)
    }
}
