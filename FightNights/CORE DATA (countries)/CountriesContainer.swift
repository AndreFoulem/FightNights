//
//  CountriesContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-31.
//

import CoreData

public class CountriesContainer {
  let container = NSPersistentContainer(name: "CountriesDataModel")
  
  init(forPreview: Bool = false) {
    
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null") }
    
    container.loadPersistentStores { _, _ in }
    
    if(forPreview) {
//      CountriesContainer.addMockData(context: container.viewContext)
    }
  }
}

