//
//  ContentView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-17.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
  // C.1 import the context from environment
  @Environment(\.managedObjectContext) var context
  
  // C.2 Wrap a fetch request in ContentView
  @FetchRequest(sortDescriptors: [])
  private var people: FetchedResults<PersonEntity>
  

  
var body: some View {
    
   VStack {
      List(people) { person in
        Text(person.firstName ?? "")
      }
      Button("Add a person") {
        let person = PersonEntity(context: context)
        person.firstName = ["Andre", "joe", "luc"].randomElement()
        try? context.save()
      }
    }
   .font(.largeTitle)
   .fontWeight(.bold)
    
  }//body
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
