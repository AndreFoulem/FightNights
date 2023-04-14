//
//  AutoEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-03.
//

import CoreData


extension AutoEntity {
  var viewModel: String {
    return model ?? "N/A"
  }
  var viewYear: String {
    return year ?? "N/A"
  }
  
}
