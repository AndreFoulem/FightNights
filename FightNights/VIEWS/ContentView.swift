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
      List(books) { book in
        VStack{
          Image(uiImage: book.cover)
          Text(book.title)
          HStack {
            Text(book.title)
            Spacer()
          }
          Text(book.lastUpdated)
          Text(book.viewPages)
          Text(book.price)
          Link(destination: book.url) {
            Text("learn more")
          }
          Text(book.bookid)
            .font(.caption)
        }
        
      }
    }//body
  
//  func getImage(imageData: Data?) -> Image {
//    if let data = imageData, let image = UIImage(data: data) {
//      return Image(uiImage: image)
//    } else {
//      return Image(systemName: "photo.fill")
//    }
//  }
  }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.managedObjectContext, PersistentContainer.preview)
    }
}
