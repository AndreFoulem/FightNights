//
//  PlanetsContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-25.
//

import UIKit
import CoreData

final class PlanetsContainer {
  
  let container: NSPersistentContainer
  let backgroundContext: NSManagedObjectContext
  
  init(forPreview: Bool = false) {
    container = NSPersistentContainer(name: "PlanetsDataModel")
    
    // MARK: context policies
    let context = container.viewContext
    context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    context.automaticallyMergesChangesFromParent = true
    
    // MARK: debug path
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    }
    
    // MARK: load data
    container.loadPersistentStores { _, _ in }
    backgroundContext = container.newBackgroundContext()
    
    // MARK: mock data
    if(forPreview) {
//      PlanetsContainer.addMockData(moc: context)
    }
  }//init
  
  static var shared: PlanetsContainer {
    return sharedPlanetsContainer
  }
  
  private static var sharedPlanetsContainer: PlanetsContainer
  = {
    #if DEBUG
    return PlanetsContainer(forPreview: true)
    #else
    return PlanetsContainer()
    #endif
  }()
}

// MARK: Extension for Functions
extension PlanetsContainer {
  static func addMockData(moc: NSManagedObjectContext) {
    addPlanet(moc: moc, name: "Mercury", orbitalPeriod: 88, position: 1, picture: "mercury")
    addPlanet(moc: moc, name: "Venus", orbitalPeriod: 225, position: 2, picture: "venus")
    addPlanet(moc: moc, name: "Earth", orbitalPeriod: 356, position: 3, picture: "earth")
    addPlanet(moc: moc, name: "Mars", orbitalPeriod: 687, position: 4, picture: "mars")
    addPlanet(moc: moc, name: "Jupiter", orbitalPeriod: 4272, position: 5, picture: "jupiter")
    addPlanet(moc: moc, name: "Saturn", orbitalPeriod: 10324, position: 6, picture: "saturn")
    addPlanet(moc: moc, name: "Uranus", orbitalPeriod: 29904, position: 7, picture: "uranus")
    addPlanet(moc: moc, name: "Neptune", orbitalPeriod: 58740, position: 8, picture: "neptune")
    
    try? moc.save()
  }
  
  static func addPlanet(moc: NSManagedObjectContext, name: String, orbitalPeriod: Int32, position: Int16,  picture: String) {
    let planet = PlanetEntity(context: moc)
    planet.name = name
    planet.orbitalPeriod = orbitalPeriod
    planet.position = position
    planet.picture =  UIImage(named: picture)?.pngData()
  }
}

// MARK: Extension for preview managed context
extension PlanetsContainer {
  static var preview: NSManagedObjectContext {
    let container = NSPersistentContainer(name: "PlanetsDataModel")
    container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    container.loadPersistentStores { _, _ in }
    Self.addMockData(moc: container.viewContext)
    return container.viewContext
  }
}
