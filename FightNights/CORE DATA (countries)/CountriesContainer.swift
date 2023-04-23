//
//  CountriesContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-31.
//

import CoreData

public class CountriesContainer {
  let container: NSPersistentContainer
  
  init(forPreview: Bool = false) {
   container = NSPersistentContainer(name: "CountriesDataModel")
    
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null") }
    
    container.loadPersistentStores { _, _ in }
    
    if(forPreview) {
      CountriesContainer.addMockData(moc: container.viewContext)
    }
    
    let context = container.viewContext
    context.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
  }
 
  static var shared: CountriesContainer {
    return sharedCountriesContainer
  }
  
  private static var sharedCountriesContainer: CountriesContainer = {
    #if DEBUG
    return CountriesContainer(forPreview: true)
    #else
    return CountriesContainer()
    #endif
  }()
  
}

extension CountriesContainer {
  
  static var preview: NSManagedObjectContext {
    let container = NSPersistentContainer(name: "CountriesDataModel")
    container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    container.loadPersistentStores { _, _ in }
    self.addMockData(moc: container.viewContext)
    return container.viewContext
  }
  
  static func addMockData(moc: NSManagedObjectContext) {
     let one = CountryEntity(context: moc)
     one.name = "Canada"
     one.lastVisited = Date.now
    let two = CountryEntity(context: moc)
     two.name = "USA"
     two.lastVisited = Date.now
    let three = CountryEntity(context: moc)
     three.name = "Mexico"
     three.lastVisited = Date.now
    let four = CountryEntity(context: moc)
     four.name = "Russia"
     four.lastVisited = Date.now
    let five = CountryEntity(context: moc)
     five.name = "China"
     five.lastVisited = Date.now
    let six = CountryEntity(context: moc)
     six.name = "Australia"
     six.lastVisited = Date.now
    let seven = CountryEntity(context: moc)
     seven.name = "Japan"
     seven.lastVisited = Date.now
    let height = CountryEntity(context: moc)
     height.name = "Chile"
     height.lastVisited = Date.now
  }
  
}

