//
//  PlanetsOO.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-26.
//

import CoreData
import UIKit

class PlanetsOO: ObservableObject {
  
  let moc: NSManagedObjectContext!
  
  @Published var planets: [PlanetEntity] = []
  
  init(moc: NSManagedObjectContext) {
    self.moc = moc
  }
  
  //fetch()
  func fetch() {
    let request = PlanetEntity.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \PlanetEntity.position, ascending: true)]
    
    if let planets = try? moc.fetch(request) {
      self.planets = planets
    }
  }
  
  //delete(offsets:)
  func delete(offsets: IndexSet) {
    var deleteAtIndex: Int?
    
    for offset in offsets {
      moc.delete(planets[offset])
      deleteAtIndex = offset
      break
    }
    
    do {
      try moc.save()
      
      if let deleteAtIndex {
        planets.remove(at: deleteAtIndex)
      }
    } catch {
      print("Error deleting item")
    }
  }
  
  //addPlanet(name:)
  func addPlanet(name: String) {
    let planet = PlanetEntity(context: moc)
    planet.id = UUID()
    planet.name = name
    planet.picture = UIImage(named: "planetx")?.pngData()
    planet.orbitalPeriod = [569, 11298, 4837, 85934].randomElement()!
    
    do {
      try moc.save()
      planets.append(planet)
    } catch {
      print("Failed to insert planet")
    }
  }
  
  //updatePlanet(newPlanet:)
  func updatePlanet(newPlanet: PlanetEntity) {
    try? moc.save()
    //-> use the ObservableObject built-in objectWillChange to notify the view to update itself
    objectWillChange.send()
  }
}
