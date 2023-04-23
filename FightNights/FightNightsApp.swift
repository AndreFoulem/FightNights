//
//  FightNightsApp.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-17.
//

//: CONNECT CORE DATA
//: A - Initiate NSPersistent Container
//: B - Reference viewContext in .environment
//: C:1 - Import the context in a View
//: C:2 - Connect a @FetchRequest in a View

import SwiftUI

@main
struct FightNightsApp: App {

    var body: some Scene {
        WindowGroup {
            //: B -> Reference the viewContext in .environment
          FetchedNoPredicate()
            .environment(\.managedObjectContext,
                          AutosContainer.shared.container.viewContext)
//            .environment(\.managedObjectContext,
//                          CountriesContainer(forPreview: true).container.viewContext)
        }
    }
}
