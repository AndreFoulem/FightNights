//
//  Persistence.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-17.
//

import CoreData

public class PersistentContainer {
    // CD.A1 -> Declare Persistence Container
  let container: NSPersistentContainer
  
    // CD.A2 -> Initiate Persistent Container + with Data Model name
  init(forPreview: Bool = false) {
    
    container = NSPersistentContainer(name: "FightNightsModel")
    
    if forPreview {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    
    // CD.A3 -> Load up the Persistent Container
    container.loadPersistentStores { _, _ in }
    
    if forPreview {
      PersistentContainer.addMockData(moc: container.viewContext)
    }
  }
  
}

extension PersistentContainer {
  
  static var preview: NSManagedObjectContext {
    get {
      let previewContainer = NSPersistentContainer(name: "FightNightsModel")
      previewContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
      previewContainer.loadPersistentStores { _, _ in }
      addMockData(moc: previewContainer.viewContext)
      return previewContainer.viewContext
    }
  }
  
  
  static func addMockData(moc: NSManagedObjectContext) {
    let BookA = BookEntity(context: moc)
    BookA.title = "my book"
    BookA.pages = 13
    BookA.available = true
    BookA.price = 40
    BookA.url = URL(string: "https://www.google.com")
    BookA.lastUpdated = Date.now
    
    let BookB = BookEntity(context: moc)
    BookB.title = "my book2"
    BookB.pages = 13
    BookB.available = true
    BookB.price = 40
    BookB.url = URL(string: "https://www.google.com")
    BookB.lastUpdated = Date.now
    
    let BookC = BookEntity(context: moc)
    BookC.title = "my boo3k"
    BookC.pages = 13
    BookC.available = true
    BookC.price = 40
    BookC.url = URL(string: "https://www.google.com")
    BookC.lastUpdated = Date.now

    try? moc.save()
  }
}






//struct PersistenceController {
//    static let shared = PersistenceController()
//
//    static var preview: PersistenceController = {
//        let result = PersistenceController(inMemory: true)
//        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        return result
//    }()
//
//    let container: NSPersistentContainer
//
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "FightNights")
//        if inMemory {
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        container.viewContext.automaticallyMergesChangesFromParent = true
//    }
//}
