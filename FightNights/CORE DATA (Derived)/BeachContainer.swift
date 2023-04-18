//
//  BeachContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-17.
//

import CoreData

final class BeachContainer {
  let container: NSPersistentContainer
  “
  init(forPreview: Bool = false) {
    container = NSPersistentContainer(name: "BeachDataModel")
    
    //context
    let context = container.viewContext
    context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    }
    
    container.loadPersistentStores { _, _ in }
    
    if(forPreview) {
      Self.addMockData(moc: context)
    }
    
  }
}

extension BeachContainer {
  static var preview: NSManagedObjectContext {
    let container = NSPersistentContainer(name: "BeachesDataModel")
    container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    container.loadPersistentStores { _, _ in }
    addMockData(moc: container.viewContext)
    return container.viewContext
  }
  
  static func addMockData(moc: NSManagedObjectContext) {
    let nation1 = NationEntity(context: moc)
    nation1.name = "Florida"
    nation1.beachEntity = [
      addBeach2(moc: moc, name: "yellow Beach", place: "miami", rating: 12),
      addBeach2(moc: moc, name: "red Beach", place: "miami", rating: 12),
      addBeach2(moc: moc, name: "blue Beach", place: "miami", rating: 12),
      addBeach2(moc: moc, name: "pink Beach", place: "miami", rating: 12),
      addBeach2(moc: moc, name: "white Beach", place: "miami", rating: 12)
    ]
    
    let nation4 = NationEntity(context: moc)
    nation4.name = "Vancouver"
    nation4.beachEntity = [
      addBeach2(moc: moc, name: "yellow Beach", place: "LA", rating: 6),
      addBeach2(moc: moc, name: "red Beach", place: "LA", rating: 6),
      addBeach2(moc: moc, name: "blue Beach", place: "LA", rating: 6),
      addBeach2(moc: moc, name: "pink Beach", place: "LA", rating: 6),
      addBeach2(moc: moc, name: "white Beach", place: "LA", rating: 6)
    ]
    
    let nation2 = NationEntity(context: moc)
    nation2.name = "Cali"
    nation2.beachEntity = [
      addBeach2(moc: moc, name: "yellow Beach", place: "New York", rating: 9),
      addBeach2(moc: moc, name: "red Beach", place: "New York", rating: 9),
      addBeach2(moc: moc, name: "blue Beach", place: "New York", rating: 9),
      addBeach2(moc: moc, name: "pink Beach", place: "New York", rating: 9),
      addBeach2(moc: moc, name: "white Beach", place: "New Yorki", rating: 9)
    ]
    
    let nation3 = NationEntity(context: moc)
    nation3.name = "New York"
    nation3.beachEntity = [
      addBeach2(moc: moc, name: "yellow Beach", place: "DC", rating: 5),
      addBeach2(moc: moc, name: "red Beach", place: "DC", rating: 5),
      addBeach2(moc: moc, name: "blue Beach", place: "DC", rating: 5),
      addBeach2(moc: moc, name: "pink Beach", place: "DC", rating: 5),
      addBeach2(moc: moc, name: "white Beach", place: "DC", rating: 5)
    ]
    
    try? moc.save()
  }
  
  static func addBeach2(moc: NSManagedObjectContext, name: String, place: String, rating: Int16) -> BeachEntity {
    let beach = BeachEntity(context: moc)
    beach.name = name
    beach.place = place
    beach.rating = rating
    return beach
  }
}
