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
  private var books: FetchedResults<BookEntity>
  

  
var body: some View {
    
   VStack {
      List(books) { book in
        Text(book.title ?? "")
      }
      Button("Add a book") {
        let book = BookEntity(context: context)
        book.title = ["book1", "book2", "book3"].randomElement()
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
        .environment(\.managedObjectContext, PersistentContainer.preview)
    }
}
