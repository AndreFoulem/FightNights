//
//  ParksEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//

import SwiftUI
import UIKit

//-> Handle nils and formatting
extension ParkEntity {
  
  var viewImage: UIImage {
    if let data = self.image_,
       let image = UIImage(data: data) {
        return image
    } else { return UIImage(systemName: "photo")! }
  }
  var viewName: String { self.name_ ?? "[No Park Name]" }
  var viewRegion: String { self.region_ ?? "N/A" }
  var viewCountry: String { self.country_ ?? "N/A" }
  var viewLocation: String { viewRegion + ", " + viewCountry }
  var viewRating: String { "\(self.rating).circle.fill" }
}
