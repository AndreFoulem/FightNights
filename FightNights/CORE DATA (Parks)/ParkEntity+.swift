//
//  ParksEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//

import SwiftUI
import UIKit
import CoreData

//-> FORMAT ATTRIBUTES + OPTIONALS
extension ParkEntity {
  var viewImage: UIImage {
    if let data = self.image_,
       let image = UIImage(data: data) {
        return image
    } else { return UIImage(systemName: "photo")! }
  }
  var viewName: String { self.name_ ?? "[No Park Name]" }
  var viewRegion: String { self.region_ ?? "N/A" }
  @objc var viewCountry: String { self.country_  ?? "N/A" }
  @objc var viewSuperCountry: String { viewCountry + " SUPER " }
  var viewLocation: String { viewRegion + ", " + viewCountry }
  var viewRating: String { "\(self.rating).circle.fill" }
}

//-> FETCH REQUESTS
extension ParkEntity {
  static var firstFiveRequest: NSFetchRequest<ParkEntity> {
    let request = ParkEntity.fetchRequest()
    
    request.sortDescriptors = [NSSortDescriptor(keyPath: \ParkEntity.name_, ascending: true)]
    request.fetchLimit = 5
    
    return request
  }
}
