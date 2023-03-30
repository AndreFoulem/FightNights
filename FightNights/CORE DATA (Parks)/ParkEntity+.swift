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
    if let image_,
      let image = UIImage(data: image_) {
        return image
    } else {
      return UIImage(systemName: "photo")!
    }
  }
  
  
}
