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

extension ParksContainer {
  static func addMockData(moc: NSManagedObjectContext) {
    let firstPark = ParkEntity(context: moc)
    firstPark.name_ = "White Rock"
    firstPark.country_ = "Canada"
    firstPark.rating = 2
    firstPark.region_ = "BC"
    firstPark.image_ = nil
    
    let secondPark = ParkEntity(context: moc)
    firstPark.name_ = "Surrey"
    firstPark.country_ = "Canada"
    firstPark.rating = 7
    firstPark.region_ = "BC"
    firstPark.image_ = nil
    
    let thirdPark = ParkEntity(context: moc)
    firstPark.name_ = "Mexico"
    firstPark.country_ = "USA"
    firstPark.rating = 8
    firstPark.region_ = "WE"
    firstPark.image_ = nil
    
    let fourthPark = ParkEntity(context: moc)
    firstPark.name_ = "San Fran"
    firstPark.country_ = "USA"
    firstPark.rating = 4
    firstPark.region_ = "OR"
    firstPark.image_ = nil
    
    try! moc.save()
  }
}
