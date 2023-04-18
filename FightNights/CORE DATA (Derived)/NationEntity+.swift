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
}
