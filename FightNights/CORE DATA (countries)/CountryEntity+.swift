//
//  CountryEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-31.
//

import SwiftUI

extension CountryEntity {
  
  var viewName: String {
     name ?? "N/A"
  }
  
  var viewDate: String {
    lastVisited?.formatted(date: .numeric, time: .omitted) ?? ""
  }
  
}
