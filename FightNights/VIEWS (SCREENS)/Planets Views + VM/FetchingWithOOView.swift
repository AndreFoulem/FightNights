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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FetchingWithOOView_Previews: PreviewProvider {
    static var previews: some View {
      FetchingWithOOView(oo: PlanetsOO(moc: PlanetsContainer.preview ))
//        .environment(\.managedObjectContext, PlanetsContainer.preview)
    }
}
