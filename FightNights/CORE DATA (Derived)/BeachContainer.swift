//
//  BeachContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-17.
//

import CoreData

final class BeachContainer {
  let container: NSPersistentContainer
  
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
    self.addMockData(moc: container.viewContext)
    return container.viewContext
  }
  
  static func addMockData(moc: NSManagedObjectContext) {
    let name1 = BeachEntity(context: moc)
    name1.name = "julu"
    name1.place = "Hawai"
    name1.rating = 9
    let name2 = BeachEntity(context: moc)
    name2.name = "florida"
    name2.place = "miami"
    name2.rating = 10
    
    try? moc.save()
  }
}
