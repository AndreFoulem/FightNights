//
//  ManufacturerEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-03.
//

import CoreData

extension ManufacturerEntity {
  
  var viewName: String {
    return name ?? "NA"
  }
  var viewCountry: String {
    return country ?? "NA"
  }
  
  var viewAutoEntities: [AutoEntity] {
    // convert NSSET to an array
    return autoEntity?.array as? [AutoEntity] ?? []
  }
}

//-> NSSet for relationship => entityName has .allObjects property
//-> NSOrderedSet has an .array as a property