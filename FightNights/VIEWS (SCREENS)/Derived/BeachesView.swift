//
//  SwiftUIView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-17.
//

import SwiftUI

struct BeachesView: View {
  @FetchRequest<BeachEntity>(sortDescriptors: [SortDescriptor(\.nationEntity?.name)])
   private var beaches
  
    var body: some View {
      NavigationStack {
        List(beaches) { beach in
          VStack(alignment: .leading, spacing: 4) {
            Text(beach.viewName)
              .font(.title)
            Text(beach.viewPlace)
            Text(beach.placeCanonical ?? "")
            Text(beach.placeLowercase ?? "")
            Text(beach.placeUppercase ?? "")
          }
          .font(.body.weight(.light))
        }
        .listStyle(.insetGrouped)
      }
    }
}

struct BeachesView_Previews: PreviewProvider {
    static var previews: some View {
        BeachesView()
        .environment(\.managedObjectContext, BeachContainer.preview)
    }
}
