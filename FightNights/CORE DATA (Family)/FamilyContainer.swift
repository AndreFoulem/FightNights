//
//  FamilyContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-14.
//

import CoreData

final class FamilyContainer {
  
  let container: NSPersistentContainer
  
  init(forPreview: Bool = false) {
    container = NSPersistentContainer(name: "FamilyDataModel")
  }
  
}
