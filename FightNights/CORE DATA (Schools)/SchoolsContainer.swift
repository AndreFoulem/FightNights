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
     let s1 = StudentEntity(context: moc)
     s1.name = "Andre"
     s1.image = nil
  
     let s1s2 = StudentEntity(context: moc)
     s1s2.name = "Andre"
     s1s2.image = nil
    
    let s3 = StudentEntity(context: moc)
     s3.name = "Andre"
     s3.image = nil
    
    let s1s = StudentEntity(context: moc)
     s1s.name = "Andre"
     s1s.image = nil
    
    try? moc.save()
  }
  
}
