//
//  BeachEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-17.
//

import Foundation

extension BeachEntity {
  var viewName: String {
    return name ?? "[No beach name]"
  }
  var viewPlace: String {
    return place ?? " [No place name]"
  }
}
