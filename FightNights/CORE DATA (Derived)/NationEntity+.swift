//
//  NationEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-18.
//

import Foundation

extension NationEntity {
  var viewName: String {
    return self.name ?? ""
  }
  
  var viewBeachEntities: [BeachEntity] {
    return self.beachEntity?.allObjects as? [BeachEntity] ?? []
  }
  
  var viewBeachNames: [String] {
    // Looping through the beachEntity to-many relationship collection and returning
    // an array of string
    var beachNames: [String] = []
    
    if let beaches = self.beachEntity {
        for case let beach as BeachEntity in beaches {
          beachNames.append(beach.viewName)
        }
      }
    
    return beachNames
  }
  
  var viewAverageRating: String {
    if self.beachCount == 0 {
      return "N/A"
    }
    let avg = Double(self.ratingSum/self.beachCount)

    return "Average Beach Rating \(avg)"
  }
  
}
