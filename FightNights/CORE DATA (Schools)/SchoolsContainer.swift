//
//  SchoolsContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-04.
//

import CoreData

final class SchoolsContainer {
  let container: NSPersistentContainer
  
  init(forPreview: Bool = false) {
    // init container
    container = NSPersistentContainer(name: "SchoolsDataModel")
    
    // add policy to context
    let context = container.viewContext
    context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    
    //** Add store descriptions for preview
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    }
  
    // load store
    container.loadPersistentStores { _, _ in }
    
    //** Load mockup data
     Self.addMockData(moc: context)
  }
}

extension SchoolsContainer {
  
  static var preview: NSManagedObjectContext {
    let container = NSPersistentContainer(name: "SchoolsDataModel")
    container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    container.loadPersistentStores { _, _ in }
    self.addMockData(moc: container.viewContext )
    return container.viewContext
  }
  
  static func addMockData(moc: NSManagedObjectContext) {
    
  }
  
}
