//
//  NationEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-18.
//

import Foundation

extension NationEntity {
  var viewName: String {
    return name ?? ""
  }
  
  var viewBeachEntities: [BeachEntity] {
    return beachEntity?.allObjects as? [BeachEntity] ?? []
  }
  
  var viewBeachNames: [String] {
    // Looping through the beachEntity to-many relationship collection and returning
    // an array of string
    var beachNames: [String] = []
    
      if let beaches = beachEntity {
        for case let beach as BeachEntity in beaches {
          beachNames.append(beach.viewName)
        }
      }
    
    return beachNames
  }
  
  var viewAverageRating: String {
    if beachCount == 0 {
      return "N/A"
    }
    let avg = Double(ratingSum/beachCount)
    
    return "Average Beach Rating \(avg)"
  }
  
}
