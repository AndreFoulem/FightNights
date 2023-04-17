//
//  FamilyEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-14.
//

import Foundation

extension FamilyMemberEntity {
  
  var viewName: String {
    return name ?? "N/A"
  }
  
  var viewChildren: [FamilyMemberEntity]? {
    if let children, children.count > 0 {
      return children.allObjects as? [FamilyMemberEntity]
    }
    return nil
  }
  
}
