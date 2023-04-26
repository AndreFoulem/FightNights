//
//  PlanetsOO.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-26.
//

import CoreData

class PlanetsOO: ObservableObject {
  
  let moc: NSManagedObjectContext!
  
  @Published var planets: [PlanetEntity] = []
  
  init(moc: NSManagedObjectContext) {
    self.moc = moc
  }
  
  func fetch() {
    let request = PlanetEntity.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \PlanetEntity.position, ascending: true)]
    
    if let planets = try? moc.fetch(request) {
      self.planets = planets
    }
    
  }
}
