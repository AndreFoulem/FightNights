//
//  PlanetEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-25.
//
import UIKit

extension PlanetEntity {
  
  var viewName: String {
    return self.name ?? "N/A"
  }
  
  var viewImage: UIImage {
    if let data = self.picture,
       let image = UIImage(data: data) {
      return image
    } else {
      return UIImage(systemName: "globe.americas.fill")!
    }
  }
  
  var viewOrbitalPeriod: String {
    "Orbital Period: \(self.orbitalPeriod)"
  }

}
