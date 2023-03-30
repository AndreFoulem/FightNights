//
//  ParksContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//

import CoreData

public class ParksContainer {
    // A1 -> Declare Persistence Container
  let container: NSPersistentContainer
  
    // A2 -> Initiate Persistent Container + with Data Model name
  init(forPreview: Bool = false) {
      container = NSPersistentContainer(name: "ParksDataModel")
      
        // P1 -> Set the preview url "/dev/null" as storeDescription
      if(forPreview) {
        container.persistentStoreDescriptions.first!.url =  URL(filePath: "/dev/null")
      }
      
        // A3 -> Load up the Persistent Container
      container.loadPersistentStores { _, _ in }
    
        // P2 -> Add Preview Mockup if forPreview = true
      if(forPreview) {
        // call addMockData()
      }
  }
}
