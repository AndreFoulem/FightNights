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
        ParksContainer.addMockData(moc: container.viewContext)
      }
  }
}

extension ParksContainer {
  
//  static var preview: NSManagedObjectContext {
//    get {
//      let previewContainer = NSPersistentContainer(name: "FightNightsModel")
//      previewContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//      previewContainer.loadPersistentStores { _, _ in }
//      addMockData(moc: previewContainer.viewContext)
//      return previewContainer.viewContext
//    }
//  }
  
  static var preview: NSManagedObjectContext {
    get {
      let previewContainer = NSPersistentContainer(name: "ParksDataModel")
      previewContainer.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
      previewContainer.loadPersistentStores { _, _ in }
      self.addMockData(moc: previewContainer.viewContext)
      return previewContainer.viewContext
    }
  }
  
  static func addMockData(moc: NSManagedObjectContext) {
    let firstPark = ParkEntity(context: moc)
    firstPark.name_ = "White Rock"
    firstPark.country_ = "Canada"
    firstPark.rating = 2
    firstPark.region_ = "BC"
    firstPark.image_ = nil
    
    let secondPark = ParkEntity(context: moc)
    secondPark.name_ = "Surrey"
    secondPark.country_ = "Canada"
    secondPark.rating = 7
    secondPark.region_ = "BC"
    secondPark.image_ = nil
    
    let thirdPark = ParkEntity(context: moc)
    thirdPark.name_ = "Mexico"
    thirdPark.country_ = "USA"
    thirdPark.rating = 8
    thirdPark.region_ = "WE"
    thirdPark.image_ = nil
    
    let fourthPark = ParkEntity(context: moc)
    fourthPark.name_ = "San Fran"
    fourthPark.country_ = "USA"
    fourthPark.rating = 4
    fourthPark.region_ = "OR"
    fourthPark.image_ = nil
    
    let fouthPark = ParkEntity(context: moc)
    fouthPark.name_ = "Jap"
    fouthPark.country_ = "Japan"
    fouthPark.rating = 9
    fouthPark.region_ = "ozaka"
    fouthPark.image_ = nil
    
    let fifthPark = ParkEntity(context: moc)
    fifthPark.name_ = "Moscow"
    fifthPark.country_ = "Russia"
    fifthPark.rating = 4
    fifthPark.region_ = "west"
    fifthPark.image_ = nil
    
    try! moc.save()
  }
}
