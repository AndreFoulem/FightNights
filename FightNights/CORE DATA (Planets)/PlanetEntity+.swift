//
//  PlanetEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-25.
//
import UIKit

extension PlanetEntity {
  
  var viewName: String {
    return name ?? "N/A"
  }
  
  var viewImage: UIImage {
    if let data = picture,
       let image = UIImage(data: data) {
      return image
    } else {
      return UIImage(systemName: "globe.americas.fill")!
    }
  }

}
