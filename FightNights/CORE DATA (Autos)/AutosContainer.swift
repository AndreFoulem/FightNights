//
//  AutosContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-03.
//

import CoreData

final class AutosContainer {
  let container : NSPersistentContainer
  let backgroundContext: NSManagedObjectContext
  
  init(forPreview: Bool = false) {
    container = NSPersistentContainer(name: "AutosDataModel")
    
    //MARK: context policies
    let context = container.viewContext
    context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    context.automaticallyMergesChangesFromParent = true
 
    
    // MARK: debug path
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    }
    
    // MARK: load data
    container.loadPersistentStores { _, _ in }
    backgroundContext = container.newBackgroundContext()
 
    //: MARK: mock data
    if(forPreview) {
      AutosContainer.addMockData(moc: context)
    }
  }//init
  
  static var shared: AutosContainer {
    return sharedAutosContainer
  }
  
  private static var sharedAutosContainer: AutosContainer
  = {
    #if DEBUG
    return AutosContainer(forPreview: true)
    #else
    return AutosContainer()
    #endif
  }()
  
}

extension AutosContainer {
  static var preview: NSManagedObjectContext {
    let container = NSPersistentContainer(name: "AutosDataModel")
    container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    container.loadPersistentStores { _, _ in }
    self.addMockData(moc: container.viewContext)
    return container.viewContext
  }
  
  static func addMockData(moc: NSManagedObjectContext) {
    let audi = ManufacturerEntity(context: moc)
    audi.name =  "Audi"
    audi.country = "Germany"
    audi.autoEntity = [
      addAuto(moc: moc, model: "Q4 e-tron", year: "2006"),
      addAuto(moc: moc, model: "Q3 e-tron", year: "2008"),
      addAuto(moc: moc, model: "Q2 e-tron", year: "2009") ]
    
    let rivian = ManufacturerEntity(context: moc)
    rivian.name =  "Rivian"
    rivian.country = "USA"
    rivian.autoEntity = [
      addAuto(moc: moc, model: "rs1", year: "2020"),
      addAuto(moc: moc, model: "rs2", year: "2018"),
      addAuto(moc: moc, model: "rs3", year: "2019") ]
    
    let toyota = ManufacturerEntity(context: moc)
    toyota.name =  "Toyoata"
    toyota.country = "Germany"
    toyota.autoEntity = [
      addAuto(moc: moc, model: "zz4 e-tron", year: "2006"),
      addAuto(moc: moc, model: "zz3 e-tron", year: "2018"),
      addAuto(moc: moc, model: "zz2 e-tron", year: "2009") ]
    
    let tesla = ManufacturerEntity(context: moc)
    tesla.name =  "Tesla"
    tesla.country = "USA"
    tesla.autoEntity = [
      addAuto(moc: moc, model: "tt4 e-tron", year: "2012"),
      addAuto(moc: moc, model: "tt3 e-tron", year: "2014"),
      addAuto(moc: moc, model: "tt2 e-tron", year: "2016") ]
    
    try? moc.save()
  }
  
  static func addAuto(moc: NSManagedObjectContext, model: String, year: String) -> AutoEntity {
    let auto = AutoEntity(context: moc)
    auto.model = model
    auto.year = year
    return auto
  }
  
}
