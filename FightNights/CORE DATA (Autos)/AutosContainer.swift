//
//  AutosContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-03.
//

import CoreData

final class AutosContainer {
  let container : NSPersistentContainer
  
  init(forPreview: Bool = false) {
    container = NSPersistentContainer(name: "AutosDataModel")
    
    //-> Add policies on context
    let context = container.viewContext
    context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    
    //-> Set store url for preview
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    }
    
    //-> load data store
    container.loadPersistentStores { _, _ in }
    
    //-> Call mock data on preview
//    if(forPreview) {
//      AutosContainer.addMockData(moc: context)
//    }
  }//init
  
}
