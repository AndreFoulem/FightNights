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
        VStack(alignment: .leading) {
            getImage(imageData: book.cover)
              .resizable()
              .scaledToFit()
            
          HStack {
            Text(book.title ?? "")
              .font(.title)
            Spacer()
            Image(systemName: book.available ? "checkmark" : "xmark")
          }
          Text(book.lastUpdated?.formatted(date: .numeric, time: .omitted) ?? "N/A")
          Text("Pages: \(book.pages)")
          Text( (book.price ?? 0) as Decimal, format: .currency(code: "USD") )
          Link(destination: book.url ?? URL(string: "https://www.rds.ca")! ) {
            Text("Learn More")
          }
          Text(book.bookid?.uuidString ?? "no book id")
            .font(.callout)
        }
      }
    }//body
  
  func getImage(imageData: Data?) -> Image {
    if let data = imageData, let image = UIImage(data: data) {
      return Image(uiImage: image)
    } else {
      return Image(systemName: "photo.fill")
    }
  }
  }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.managedObjectContext, PersistentContainer.preview)
    }
}
