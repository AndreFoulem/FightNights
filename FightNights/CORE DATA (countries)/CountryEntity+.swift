//
//  CountryEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-31.
//

import SwiftUI
import Foundation

extension CountryEntity {
  
  var viewName: String {
    self.name ?? "N/A"
  }
  
  var viewDate: String {
    self.lastVisited?.formatted(date: .numeric, time: .omitted) ?? ""
  }
}
